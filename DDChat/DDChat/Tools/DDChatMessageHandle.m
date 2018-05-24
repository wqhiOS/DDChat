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
        instance = [DDChatMessageHandle alloc]init
    });
}

@end
