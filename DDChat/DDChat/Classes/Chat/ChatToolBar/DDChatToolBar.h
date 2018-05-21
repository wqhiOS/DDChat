//
//  DDChatToolBar.h
//  DDChat
//
//  Created by wuqh on 2018/5/14.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DDChatToolBarStatus) {
    DDChatToolBarStatusInit = 0,
    DDChatToolBarStatusVoice,
    DDChatToolBarStatusEmoji,
    DDChatToolBarStatusMore,
    DDChatToolBarStatusKeyboard
};

@protocol DDChatToolBarRecordDelegate<NSObject>
- (void)chatToolBarStartRecord;
- (void)chatToolBarRecording:(BOOL)cancel;
- (void)chatToolBarEndRecord:(BOOL)complete;
- (void)chatToolBarCancelRecord;
@end

@protocol DDChatToolBarDelegate<NSObject>
- (void)chatToolBarFromStatus:(DDChatToolBarStatus)fromStatus toStatus:(DDChatToolBarStatus)toStatus;
@end

@interface DDChatToolBar : UIView

@property (nonatomic, assign) DDChatToolBarStatus status;
@property (nonatomic, weak) id<DDChatToolBarRecordDelegate> recordDelegate;
@property (nonatomic, weak) id<DDChatToolBarDelegate> delegate;

@end
