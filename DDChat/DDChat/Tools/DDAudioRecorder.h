//
//  DDAudioRecorder.h
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDAudioRecorder : NSObject

+ (instancetype)defaultRecorder;


/**
 开始录音

 @param volumeChanged 音量
 @param complete 成功
 @param cancel 取消
 */
- (void)startRecordingWithVolumeChangedBlock:(void (^)(CGFloat volume))volumeChanged
                               completeBlock:(void (^)(NSString *path, CGFloat time))complete
                                 cancelBlock:(void (^)(void))cancel;

/**
 录音完成，结束
 */
- (void)stopRecording;

/**
 取消录音
 */
- (void)cancelRecording;

@end
