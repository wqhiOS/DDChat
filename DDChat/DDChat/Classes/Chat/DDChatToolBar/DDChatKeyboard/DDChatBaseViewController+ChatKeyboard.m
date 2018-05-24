//
//  DDChatBaseViewController+ChatKeyboard.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseViewController+ChatKeyboard.h"
#import "DDChatEmojiKeyboard.h"
#import "DDChatMoreKeyboard.h"

@implementation DDChatBaseViewController (ChatKeyboard)

- (void)initChatKeyboard {
    self.emojiKeyboard = [DDChatEmojiKeyboard defaultKeyboard];
    self.emojiKeyboard.delegate = self;
    self.moreKeyboard = [DDChatMoreKeyboard defaultKeyboard];
    self.moreKeyboard.delegate = self;
}

#pragma mark - DDChatEmojiKeyboard.h
- (void)chatKeyboardWillShow:(id)keyboard animated:(BOOL)animated {
    
}

- (void)chatKeyboardDidShow:(id)keyboard animated:(BOOL)animated {
    
}

- (void)chatKeyboardWillDismiss:(id)keyboard animated:(BOOL)animated {
    
}

- (void)chatKeyboardDidDismiss:(id)keyboard animated:(BOOL)animated {
    
}

- (void)chatKeyboard:(id)keyboard didChangeHeight:(CGFloat)height {
    [UIView animateWithDuration:0.3 animations:^{
        [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(-height);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
}

@end
