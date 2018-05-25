//
//  DDAddressBookModel.h
//  DDChat
//
//  Created by wuqh on 2018/5/17.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDBaseModel.h"

@interface DDAddressBookModel : DDBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *headIcon;
@property (nonatomic, copy) NSString *userId;

@end
