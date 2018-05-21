//
//  DDChatToolBar.m
//  DDChat
//
//  Created by wuqh on 2018/5/14.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatToolBar.h"
#import "DDPressToTalkButton.h"

@interface DDChatToolBar()
@property (nonatomic, strong) UIButton *voiceButton;
@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, strong) DDPressToTalkButton *pressToTalkButton;
@property (nonatomic, strong) UIButton *emojiButton;
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation DDChatToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HexColor(0xF5F5F7);
        [self setupUI];
    }
    return self;
}

#pragma mark - Action
- (void)voiceButtonClick:(UIButton *)button {
    self.pressToTalkButton.hidden = !self.pressToTalkButton.isHidden;
    if (self.inputTextView.isFirstResponder) {
        [self.inputTextView resignFirstResponder];
    }
}
#pragma mark - UI
- (void)setupUI {
    self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice"] forState:UIControlStateNormal];
    [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice_HL"] forState:UIControlStateHighlighted];
    [self.voiceButton addTarget:self action:@selector(voiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.voiceButton];
    
    self.inputTextView = [[UITextView alloc] initWithFrame:CGRectZero];
    self.inputTextView.font = [UIFont systemFontOfSize:16];
    self.inputTextView.returnKeyType = UIReturnKeySend;
    self.inputTextView.layer.masksToBounds = YES;
    self.inputTextView.layer.borderWidth = BORDER_WIDTH_1PX;
    self.inputTextView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.3].CGColor;
    self.inputTextView.layer.cornerRadius = 4.0f;
    [self addSubview:self.inputTextView];
    
    
    
    self.pressToTalkButton = [[DDPressToTalkButton alloc] initWithFrame:CGRectZero touchBeginAction:^{
        if ([self.recordDelegate respondsToSelector:@selector(chatToolBarStartRecord)]) {
            [self.recordDelegate chatToolBarStartRecord];
        }
    } touchMoveAction:^(BOOL isWillCancel){
        if ([self.recordDelegate respondsToSelector:@selector(chatToolBarRecording:)]) {
            [self.recordDelegate chatToolBarRecording:isWillCancel];
        }
    } touchEndAction:^(BOOL isComplete){
        if ([self.recordDelegate respondsToSelector:@selector(chatToolBarEndRecord:)]) {
            [self.recordDelegate chatToolBarEndRecord:isComplete];
        }
    } touchCancelAction:^{
        if ([self.recordDelegate respondsToSelector:@selector(chatToolBarCancelRecord)]) {
            [self.recordDelegate chatToolBarCancelRecord];
        }
    }];
    self.pressToTalkButton.hidden = YES;
    [self addSubview:self.pressToTalkButton];
    
    self.emojiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_emotion"] forState:UIControlStateNormal];
    [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_emotion_HL"] forState:UIControlStateHighlighted];
    [self addSubview:self.emojiButton];
    
    self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.moreButton setImage:[UIImage imageNamed:@"chat_toolbar_more"] forState:UIControlStateNormal];
    [self.moreButton setImage:[UIImage imageNamed:@"chat_toolbar_more_HL"] forState:UIControlStateHighlighted];
    [self addSubview:self.moreButton];
    
    //constraint
    [self.voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-7);
        make.height.width.equalTo(@35);
        make.left.equalTo(self.mas_left).offset(7);
    }];
    
    [self.emojiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.moreButton.mas_left).offset(-7);
        make.centerY.equalTo(self.voiceButton);
        make.width.height.equalTo(@35);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.voiceButton);
        make.right.equalTo(self).offset(-7);
        make.width.height.equalTo(@35);
    }];
    
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).mas_offset(-7);
        make.left.equalTo(self.voiceButton.mas_right).offset(7);
        make.right.equalTo(self.emojiButton.mas_left).offset(-7);
        make.height.equalTo(@35);
    }];
    
    [self.pressToTalkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.inputTextView);
    }];
    
}

@end
