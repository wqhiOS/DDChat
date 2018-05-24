//
//  DDChatKeyboardDelegate.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDChatKeyboardDelegate <NSObject>

@optional
- (void)chatKeyboardWillShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardWillDismiss:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidDismiss:(id)keyboard animated:(BOOL)animated;


/**
 修改chatToolBar高度
 */
- (void)chatKeyboard:(id)keyboard didChangeHeight:(CGFloat)height;

@end
