//
//  DDChatBaseKeyboard.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDChatKeyboardDelegate.h"

@interface DDChatBaseKeyboard : UIView

@property (nonatomic, weak) id<DDChatKeyboardDelegate> delegate;


/**
 展示

 @param view 父view
 @param animation 是否动画
 */
- (void)showInView:(UIView *)view withAnimation:(BOOL)animation;


/**
 消失

 @param animation 是否动画
 */
- (void)dismissWithAnimation:(BOOL)animation;

@end
