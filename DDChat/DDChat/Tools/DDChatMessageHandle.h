//
//  DDChatMessageHandle.h
//  DDChat
//
//  Created by wuqh on 2018/5/24.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDChatMessageHandle : NSObject<RCIMClientReceiveMessageDelegate>

+ (instancetype)defaultHandle;

@end
