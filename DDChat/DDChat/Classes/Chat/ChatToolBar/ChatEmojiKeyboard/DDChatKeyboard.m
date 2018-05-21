//
//  DDChatKeyboard.m
//  DDChat
//
//  Created by wuqh on 2018/5/21.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatKeyboard.h"

#define kChatKeyboardHeight (215.f)

@implementation DDChatKeyboard

- (void)showInView:(UIView *)view withAnimation:(BOOL)animation {
    
    [view addSubview:self];
    
    CGFloat keyboardHeight = kChatKeyboardHeight;
    
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(view);
        make.height.mas_equalTo(keyboardHeight);
        make.bottom.mas_equalTo(view).mas_offset(keyboardHeight);
    }];
    
    [view layoutIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(view.mas_bottom);
        }];
        [view layoutIfNeeded];
        if (self.keyboardDelegate && [self.keyboardDelegate respondsToSelector:@selector(chatKeyboard:didChangeHeight:)]) {
            [self.keyboardDelegate chatKeyboard:self didChangeHeight:view.bounds.size.height - self.frame.origin.y];
        }
    } completion:^(BOOL finished) {
//        if (self.keyboardDelegate && [self.keyboardDelegate respondsToSelector:@selector(chatKeyboardDidShow:animated:)]) {
//            [self.keyboardDelegate chatKeyboardDidShow:self animated:animation];
//        }
    }];
}

- (void)dismissWithAnimation:(BOOL)animation
{
   
    if (animation) {
        CGFloat keyboardHeight = 215.f;
        [UIView animateWithDuration:0.3 animations:^{
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.superview).mas_offset(keyboardHeight);
            }];
            [self.superview layoutIfNeeded];
            if (self.keyboardDelegate && [self.keyboardDelegate respondsToSelector:@selector(chatKeyboard:didChangeHeight:)]) {
                [self.keyboardDelegate chatKeyboard:self didChangeHeight:self.superview.bounds.size.height - self.frame.origin.y];
            }
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
            if (self.keyboardDelegate && [self.keyboardDelegate respondsToSelector:@selector(chatKeyboardDidDismiss:animated:)]) {
                [self.keyboardDelegate chatKeyboardDidDismiss:self animated:animation];
            }
        }];
        
    } else {
        [self removeFromSuperview];
        if (self.keyboardDelegate && [self.keyboardDelegate respondsToSelector:@selector(chatKeyboardDidDismiss:animated:)]) {
            [self.keyboardDelegate chatKeyboardDidDismiss:self animated:animation];
        }
    }
    
    
    
}

@end
