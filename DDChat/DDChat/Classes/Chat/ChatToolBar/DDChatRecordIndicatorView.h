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
    DDChatRecordIndicatorViewStatusTooShort
};


@interface DDChatRecordIndicatorView : UIView

@property (nonatomic, assign) DDChatRecordIndicatorViewStatus recordIndicatorStatus;

@end
