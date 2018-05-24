//
//  DDEmojiCell.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/23.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDEmojiCell.h"

@implementation DDEmojiCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.and.width.equalTo(@24);
            make.center.equalTo(self);
        }];
    }
    return self;
}

@end
