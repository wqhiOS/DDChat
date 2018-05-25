//
//  DDConversationCell.m
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDConversationCell.h"
#import "DDDateConvertTool.h"

@interface DDConversationCell()

@property (nonatomic, strong) UIImageView *headPortraitImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *lastMessageLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation DDConversationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.headPortraitImageView = [[UIImageView alloc] init];
    self.headPortraitImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headPortraitImageView.layer.cornerRadius = 5.f;
    self.headPortraitImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headPortraitImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.lastMessageLabel = [[UILabel alloc] init];
    self.lastMessageLabel.font = [UIFont systemFontOfSize:13];
    self.lastMessageLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.lastMessageLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:11];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    
    [self.headPortraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@48);
        make.left.top.equalTo(self.contentView).mas_offset(10);
        make.bottom.equalTo(self.contentView).mas_offset(-10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headPortraitImageView.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(14);
    }];
    
    [self.lastMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headPortraitImageView.mas_right).offset(10);
        make.bottom.equalTo(self.contentView).offset(-14);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headPortraitImageView);
        make.right.equalTo(self.contentView).mas_offset(-10);
    }];
}

- (void)setConversation:(RCConversation *)conversation {
  
    _conversation    = conversation;
    
    self.headPortraitImageView.image = [UIImage imageNamed:DDUserInfoModel.defaultModel.friends.lastObject.headPortrait];
    self.nameLabel.text = DDUserInfoModel.defaultModel.friends.lastObject.name;
    
    RCTextMessage *textMessage = (RCTextMessage *)conversation.lastestMessage;
    self.lastMessageLabel.text = textMessage.content;

    long lastTime = MAX(conversation.sentTime, conversation.receivedTime)/1000;
    self.timeLabel.text = [DDDateConvertTool dateConvertTimeStampToStringWithTimeStamp:lastTime dateDisplayType:DDDateDisplayType_Time customTypeString:nil];
}
@end
