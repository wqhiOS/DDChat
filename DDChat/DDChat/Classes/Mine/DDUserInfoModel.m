//
//  DDUserInfoModel.m
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDUserInfoModel.h"

@implementation DDUserInfoModel

+ (instancetype)defaultModel {
    static dispatch_once_t onceToken;
    static DDUserInfoModel *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
