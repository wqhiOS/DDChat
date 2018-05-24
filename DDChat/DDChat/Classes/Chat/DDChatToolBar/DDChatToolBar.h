//
//  DDChatToolBar.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDChatToolBarTranslateDelegate.h"


@interface DDChatToolBar : UIView

@property (nonatomic, weak) id<DDChatToolBarTranslateDelegate> translateDelegate;

@property (nonatomic, assign) DDChatToolBarStatus status;

@end
