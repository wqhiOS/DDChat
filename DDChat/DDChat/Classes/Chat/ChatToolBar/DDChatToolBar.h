//
//  DDChatToolBar.h
//  DDChat
//
//  Created by wuqh on 2018/5/14.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDChatToolBarRecordDelegate<NSObject>
- (void)chatToolBarStartRecord;
- (void)chatToolBarRecording:(BOOL)cancel;
- (void)chatToolBarEndRecord;
- (void)chatToolBarCancelRecord;
@end

@interface DDChatToolBar : UIView

@property (nonatomic, weak) id<DDChatToolBarRecordDelegate> recordDelegate;

@end
