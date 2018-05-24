//
//  DDChatViewController+keyboardNotification.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController+keyboardNotification.h"

@implementation DDChatBaseViewController (keyboardNotification)


- (void)registerNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma makr - 系统键盘通知
- (void)keyboardWillShow:(NSNotification *)notification
{
    if (curStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
    
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    if (curStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
    if (lastStatus == DDChatToolBarStatusEmoji) {
        [self.emojiKeyboard dismissWithAnimation:NO];
    }
    if (lastStatus == DDChatToolBarStatusMore) {
        [self.moreKeyboard dismissWithAnimation:NO];
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification
{
  
    if (curStatus != DDChatToolBarStatusKeyboard && lastStatus == DDChatToolBarStatusKeyboard) {
        return;
    }
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-keyboardFrame.size.height);
    }];
    [self.view layoutIfNeeded];
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    if (curStatus == DDChatToolBarStatusEmoji || curStatus == DDChatToolBarStatusMore) {
        return;
    }
    [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
}


@end
