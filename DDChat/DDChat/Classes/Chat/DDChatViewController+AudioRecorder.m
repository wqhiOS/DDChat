//
//  DDChatViewController+AudioRecorder.m
//  DDChat
//
//  Created by wuqh on 2018/5/21.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController+AudioRecorder.h"
#import "DDAudioRecorder.h"
#import "DDChatRecordIndicatorView.h"

@implementation DDChatViewController (AudioRecorder)

#pragma mark - DDChatToolBarRecordDelegate
- (void)chatToolBarStartRecord {
    self.recordIndicatorView.hidden = NO;
    
    __block NSInteger timeCount = 0;
    [[DDAudioRecorder defaultRecorder] startRecordingWithVolumeChangedBlock:^(CGFloat volume) {
        timeCount++;
        if (timeCount == 1) {
            NSLog(@"录制了1s，添加语音视图");
        }
        NSLog(@"volume:%f",volume);
        self.recordIndicatorView.volume = volume;
    } completeBlock:^(NSString *path, CGFloat time) {
        if (time < 1) {
            self.recordIndicatorView.recordIndicatorStatus = DDChatRecordIndicatorViewStatusTooShort;
        }else {
            self.recordIndicatorView.hidden = YES;
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                NSString *fileName = [NSString stringWithFormat:@"%.0lf.caf", [NSDate date].timeIntervalSince1970 * 1000];
                
                NSError *error;
                NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName];
                
                [[NSFileManager defaultManager] moveItemAtPath:path toPath:filePath error:&error];
                if (error) {
                    NSLog(@"录音文件出错: %@", error);
                    return;
                }
                
                NSLog(@"发送语音消息：%@",filePath);
            }
        }
    } cancelBlock:^{
        
        self.recordIndicatorView.recordIndicatorStatus = DDChatRecordIndicatorViewStatusRecording;
    }];
    
}
- (void)chatToolBarRecording:(BOOL)cancel {
    if (cancel) {
        self.recordIndicatorView.recordIndicatorStatus = DDChatRecordIndicatorViewStatusWillCancel;
    }else {
        self.recordIndicatorView.recordIndicatorStatus = DDChatRecordIndicatorViewStatusRecording;
    }
}
- (void)chatToolBarEndRecord:(BOOL)complete {
    if (complete) {
        [[DDAudioRecorder defaultRecorder] stopRecording];
    }else {
        [[DDAudioRecorder defaultRecorder] cancelRecording];
    }
    if (self.recordIndicatorView.recordIndicatorStatus == DDChatRecordIndicatorViewStatusTooShort) {
        return;
    }
    self.recordIndicatorView.recordIndicatorStatus = DDChatRecordIndicatorViewStatusEnd;
    
}
- (void)chatToolBarCancelRecord {
    [[DDAudioRecorder defaultRecorder] cancelRecording];
}

@end
