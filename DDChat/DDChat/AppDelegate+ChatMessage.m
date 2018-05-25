//
//  AppDelegate+ChatMessage.m
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "AppDelegate+ChatMessage.h"
#import "DDChatMessageHandle.h"

@implementation AppDelegate (ChatMessage)

- (void)recivedMessage {
    [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:[DDChatMessageHandle defaultHandle] object:nil];
}

@end
