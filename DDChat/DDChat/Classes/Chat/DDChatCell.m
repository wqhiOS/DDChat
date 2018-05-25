//
//  DDChatCell.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatCell.h"
#import <MLLabel.h>
#import "DDChatModel.h"
#import "DDDateConvertTool.h"

@interface DDChatCell()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *containerBackgroundImageView;
@property (nonatomic, strong) MLLabel *contentLabel;
@property (nonatomic, strong) UIImageView *headIconImageView;
@property (nonatomic, strong) UIImageView *messageImageView;
@property (nonatomic, strong) UIImageView *maskImageView;

@end

@implementation DDChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    self.timeLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor greenColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        label;
    });
    
    self.headIconImageView = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        imageView;
    });
    
    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.containerView];
    
    self.containerBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_recive_nor"]];
    [self.containerView addSubview:self.containerBackgroundImageView];
    
    self.contentLabel = ({
        MLLabel *label = [MLLabel new];
        label.font = [UIFont systemFontOfSize:14.0f];
        label.textInsets = UIEdgeInsetsMake(8, 14, 8, 14);
        label.numberOfLines = 0;
        label;
    });
    [self.containerView addSubview:self.contentLabel];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    
    [self.headIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@40);
        make.top.equalTo(self.timeLabel.mas_bottom);
        make.left.equalTo(self.contentView).offset(14);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headIconImageView.mas_right).mas_offset(10);
        make.top.equalTo(self.headIconImageView.mas_top).mas_offset(10);
        make.width.mas_lessThanOrEqualTo(@250);
        make.width.mas_greaterThanOrEqualTo(@60);
        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.contentLabel).with.insets(UIEdgeInsetsMake(-10, -10, -10, -10));
    }];
    
    [self.containerBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.containerView);
    }];
    
}

- (void)setMessage:(RCMessage *)message {
    _message = message;
    
    if ([message.content isKindOfClass:[RCTextMessage class]]) {
        
        RCTextMessage *textMessage = message.content;
        
        self.contentLabel.text = textMessage.content;
        self.timeLabel.text = [DDDateConvertTool dateConvertTimeStampToStringWithTimeStamp:message.sentTime/1000 dateDisplayType:DDDateDisplayType_Time customTypeString:nil];
        self.headIconImageView.image = [UIImage imageNamed:@"youIcon"];
    }
}

- (void)setChatModel:(DDChatModel *)chatModel {
//    _chatModel = chatModel;
//
//    self.timeLabel.text = chatModel.messageTime.length > 0 ? chatModel.messageTime : @"";
//    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(chatModel.messageTime.length == 0 ? @0 :@20);
//    }];
//
//    self.contentLabel.text = chatModel.messageText;
//    if (chatModel.roleType == DDMessageRolwTypeMe) {
//        self.headIconImageView.image = [UIImage imageNamed:@"meIcon"];
//    }else {
//        self.headIconImageView.image = [UIImage imageNamed:@"youIcon"];
//    }
}

@end
