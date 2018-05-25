//
//  DDChatMessageHandle.m
//  DDChat
//
//  Created by wuqh on 2018/5/24.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatMessageHandle.h"

@implementation DDChatMessageHandle

+ (instancetype)defaultHandle {
    static dispatch_once_t onceToken;
    static DDChatMessageHandle *instance;
    dispatch_once(&onceToken, ^{
        instance = [[DDChatMessageHandle alloc]init];
    });
    return instance;
}

#pragma mark - RCIMClientReceiveMessageDelegate
/*!
 接收消息的回调方法
 
 @param message     当前接收到的消息
 @param nLeft       还剩余的未接收的消息数，left>=0
 @param object      消息监听设置的key值
 
 @discussion 如果您设置了IMlib消息监听之后，SDK在接收到消息时候会执行此方法。
 其中，left为还剩余的、还未接收的消息数量。比如刚上线一口气收到多条消息时，通过此方法，您可以获取到每条消息，left会依次递减直到0。
 您可以根据left数量来优化您的App体验和性能，比如收到大量消息时等待left为0再刷新UI。
 object为您在设置消息接收监听时的key值。
 */
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_RecivedMessage object:nil userInfo:@{@"message":message,@"left":@(nLeft)}];
}

/*!
 消息被撤回的回调方法
 
 @param messageId 被撤回的消息ID
 
 @discussion 被撤回的消息会变更为RCRecallNotificationMessage，App需要在UI上刷新这条消息。
 */
- (void)onMessageRecalled:(long)messageId {
    
}

@end
