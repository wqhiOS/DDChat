//
//  DDAudioRecorder.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDAudioRecorder.h"
#import <AVFoundation/AVFoundation.h>



@interface DDAudioRecorder()<AVAudioRecorderDelegate>

@property (nonatomic, strong) AVAudioRecorder *recorder;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) void (^volumeChangedBlock)(CGFloat valume);
@property (nonatomic, strong) void (^completeBlock)(NSString *path, CGFloat time);
@property (nonatomic, strong) void (^cancelBlock)(void);

@end

@implementation DDAudioRecorder


+ (instancetype)defaultRecorder {
    static DDAudioRecorder *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DDAudioRecorder new];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        NSError *error = nil;
        [audioSession setCategory:AVAudioSessionCategoryRecord error:&error];
//        NSString *recordingUrl = [NSTemporaryDirectory() stringByAppendingString:@"wuqh.wav"];
        
        NSDictionary *settings = @{AVFormatIDKey: @(kAudioFormatLinearPCM),
                                   AVSampleRateKey: @8000.00f,
                                   AVNumberOfChannelsKey: @1,
                                   AVLinearPCMBitDepthKey: @16,
                                   AVLinearPCMIsNonInterleaved: @NO,
                                   AVLinearPCMIsFloatKey: @NO,
                                   AVLinearPCMIsBigEndianKey: @NO};
        
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:PATH_RECFILE] settings:settings error:&error];
        //对录音开启音量检测
        _recorder.meteringEnabled = YES;
        _recorder.delegate = self;
        
    }
    return self;
}

#pragma mark - 录音
- (void)startRecordingWithVolumeChangedBlock:(void (^)(CGFloat))volumeChanged completeBlock:(void (^)(NSString *, CGFloat))complete cancelBlock:(void (^)(void))cancel {
    self.volumeChangedBlock = volumeChanged;
    self.completeBlock = complete;
    self.cancelBlock = cancel;
    
    [self.recorder prepareToRecord];
    [self.recorder record];
    
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf.recorder updateMeters];
        
        float peakPower = [weakSelf.recorder peakPowerForChannel:0];
        double peakPowerForChannel = pow(10, (0.05 * peakPower));

        if (weakSelf && weakSelf.volumeChangedBlock) {
            weakSelf.volumeChangedBlock(peakPowerForChannel);
        }
    }];
 
}
- (void)stopRecording {
    [self.timer invalidate];
    CGFloat time = self.recorder.currentTime;
    [self.recorder stop];
    if (self.completeBlock) {
        
        self.completeBlock(PATH_RECFILE, time);
    }
}
- (void)cancelRecording {
    [self.timer invalidate];
    [self.recorder stop];
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

#pragma mark - AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError * __nullable)error {
    NSLog(@"%s",__FUNCTION__);
}

@end
