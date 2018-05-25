//
//  DDChatViewController.h
//  DDChat
//
//  Created by wuqh on 2018/5/23.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseViewController.h"
@class DDAddressBookModel;

@interface DDChatViewController : DDChatBaseViewController

- (instancetype)initWithAddressBookModel:(DDAddressBookModel *)addressBookModel;
- (instancetype)initWithTargetId:(NSString *)targetId;

@end
