//
//  DDChatEmojiKeyboard.m
//  DDChat
//
//  Created by wuqh on 2018/5/21.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatEmojiKeyboard.h"

@interface DDChatEmojiKeyboard()



@end

@implementation DDChatEmojiKeyboard

+ (instancetype)defaultKeyboard {
    static dispatch_once_t onceToken;
    static DDChatEmojiKeyboard *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



@end
