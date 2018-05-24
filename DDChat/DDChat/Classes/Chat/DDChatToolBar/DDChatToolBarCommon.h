//
//  DDChatCommon.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#ifndef DDChatToolBarCommon_h
#define DDChatToolBarCommon_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DDChatToolBarStatus) {
    DDChatToolBarStatusInit,
    DDChatToolBarStatusVoice,
    DDChatToolBarStatusEmoji,
    DDChatToolBarStatusMore,
    DDChatToolBarStatusKeyboard,
};

#define     HexColor(color)             [UIColor colorWithRed:((float)((color & 0xFF0000) >> 16))/255.0 green:((float)((color & 0xFF00) >> 8))/255.0 blue:((float)(color & 0xFF))/255.0 alpha:1.0]

#define     BORDER_WIDTH_1PX            ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)

#define     KEYBOARD_HEIGHT             (215.f)


#endif /* DDChatToolBarCommon_h */
