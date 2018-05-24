//
//  DDChatMoreKeyboard.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatMoreKeyboard.h"

@implementation DDChatMoreKeyboard

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

+ (instancetype)defaultKeyboard {
    static dispatch_once_t onceToken;
    static DDChatMoreKeyboard *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
@end
