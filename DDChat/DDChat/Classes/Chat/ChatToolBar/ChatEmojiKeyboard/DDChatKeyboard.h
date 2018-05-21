//
//  DDChatKeyboard.h
//  DDChat
//
//  Created by wuqh on 2018/5/21.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DDChatKeyboardDelegate <NSObject>

@optional
- (void)chatKeyboardWillShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardWillDismiss:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidDismiss:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboard:(id)keyboard didChangeHeight:(CGFloat)height;

@end

@interface DDChatKeyboard : UIView

// 键盘事件回调
@property (nonatomic, weak) id<DDChatKeyboardDelegate> keyboardDelegate;

- (void)showInView:(UIView *)view withAnimation:(BOOL)animation;
- (void)dismissWithAnimation:(BOOL)animation;

@end
