//
//  DDChatBaseViewController+ChatKeyboard.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseViewController.h"
#import "DDChatKeyboardDelegate.h"

@interface DDChatBaseViewController (ChatKeyboard)<DDChatKeyboardDelegate>

- (void)initChatKeyboard;

@end
