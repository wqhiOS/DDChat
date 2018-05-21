//
//  DDChatRecordIndicatorView.h
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DDChatRecordIndicatorViewStatus) {
    DDChatRecordIndicatorViewStatusRecording,
    DDChatRecordIndicatorViewStatusWillCancel,
    DDChatRecordIndicatorViewStatusTooShort,
    DDChatRecordIndicatorViewStatusEnd
};


@interface DDChatRecordIndicatorView : UIView

@property (nonatomic, assign) DDChatRecordIndicatorViewStatus recordIndicatorStatus;

/**
 *  音量大小，取值（0-1）
 */
@property (nonatomic, assign) CGFloat volume;

@end
