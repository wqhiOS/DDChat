//
//  DDUserInfoModel.h
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDBaseModel.h"

@interface DDUserInfoModel : DDBaseModel

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *headPortrait;
@property (nonatomic, strong) NSMutableArray<DDUserInfoModel*> *friends;

+ (instancetype)defaultModel;

@end
