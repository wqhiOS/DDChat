//
//  DDChatToolBarTranslateDelegate.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDChatToolBarCommon.h"
@class DDChatToolBar;

@protocol DDChatToolBarTranslateDelegate <NSObject>

- (void)chatBar:(DDChatToolBar *)chatBar changeStatusFrom:(DDChatToolBarStatus)fromStatus to:(DDChatToolBarStatus)toStatus;

@end
