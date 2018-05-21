//
//  DDChatToolBar.m
//  DDChat
//
//  Created by wuqh on 2018/5/14.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatToolBar.h"
#import "DDPressToTalkButton.h"

@interface DDChatToolBar()<UITextViewDelegate>
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
    
    if (self.status == DDChatToolBarStatusVoice) {
        
        self.pressToTalkButton.hidden = YES;
        [self.inputTextView becomeFirstResponder];
        
        [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard"] forState:UIControlStateNormal];
        [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard_HL"] forState:UIControlStateHighlighted];
        
        self.status = DDChatToolBarStatusKeyboard;
        
        if ([self.delegate respondsToSelector:@selector(chatToolBarFromStatus:toStatus:)]) {
            [self.delegate chatToolBarFromStatus:DDChatToolBarStatusVoice toStatus:DDChatToolBarStatusKeyboard];
        }
        
    }else {
        
        [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice"] forState:UIControlStateNormal];
        [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice_HL"] forState:UIControlStateHighlighted];
        
        self.pressToTalkButton.hidden = NO;
    
        if ([self.inputTextView isFirstResponder]) {
            [self.inputTextView resignFirstResponder];
        }
        if ([self.delegate respondsToSelector:@selector(chatToolBarFromStatus:toStatus:)]) {
            [self.delegate chatToolBarFromStatus:self.status toStatus:DDChatToolBarStatusVoice];
        }
        self.status = DDChatToolBarStatusVoice;
        
    }
    
}

- (void)emojiButtonClick:(UIButton *)button{
    
    if (self.status == DDChatToolBarStatusEmoji) {
        
        [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_emotion"] forState:UIControlStateNormal];
        [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_emotion_HL"] forState:UIControlStateHighlighted];
        
        
        if ([self.delegate respondsToSelector:@selector(chatToolBarFromStatus:toStatus:)]) {
            [self.delegate chatToolBarFromStatus:DDChatToolBarStatusEmoji toStatus:DDChatToolBarStatusKeyboard];
        }
        
        [self.inputTextView becomeFirstResponder];
        
        self.status = DDChatToolBarStatusKeyboard;
    }else {
        
        if (!self.pressToTalkButton.isHidden) {
            self.pressToTalkButton.hidden = YES;
            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice"] forState:UIControlStateNormal];
            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice_HL"] forState:UIControlStateHighlighted];
        }
        [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard"] forState:UIControlStateNormal];
        [self.emojiButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard_HL"] forState:UIControlStateHighlighted];
        
        [self.inputTextView resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(chatToolBarFromStatus:toStatus:)]) {
            [self.delegate chatToolBarFromStatus:self.status toStatus:DDChatToolBarStatusEmoji];
        }
        
        self.status = DDChatToolBarStatusEmoji;
    }
    
}
- (void)moreButtonClick:(UIButton *)button {
    
}

//- (void)setStatus:(DDChatToolBarStatus)status {
//    _status = status;
//    switch (status) {
//        case DDChatToolBarStatusVoice:
//        {
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard"] forState:UIControlStateNormal];
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_keyboard_HL"] forState:UIControlStateHighlighted];
//        }
//            break;
//        case DDChatToolBarStatusInit:
//        {
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice"] forState:UIControlStateNormal];
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice_HL"] forState:UIControlStateHighlighted];
//        }
//            break;
//        case DDChatToolBarStatusKeyboard:
//        {
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice"] forState:UIControlStateNormal];
//            [self.voiceButton setImage:[UIImage imageNamed:@"chat_toolbar_voice_HL"] forState:UIControlStateHighlighted];
//        }
//            break;
//        case DDChatToolBarStatusEmoji:
//        {
//
//        }
//            break;
//        case DDChatToolBarStatusMore:
//        {
//
//        }
//            break;
//
//        default:
//            break;
//    }
//}
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
    self.inputTextView.delegate = self;
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
    [self.emojiButton addTarget:self action:@selector(emojiButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.emojiButton];
    
    self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.moreButton setImage:[UIImage imageNamed:@"chat_toolbar_more"] forState:UIControlStateNormal];
    [self.moreButton setImage:[UIImage imageNamed:@"chat_toolbar_more_HL"] forState:UIControlStateHighlighted];
    [self.moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
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

#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (self.status != DDChatToolBarStatusKeyboard) {

        if ([self.delegate respondsToSelector:@selector(chatToolBarFromStatus:toStatus:)]) {
            [self.delegate chatToolBarFromStatus:self.status toStatus:DDChatToolBarStatusKeyboard];
        }
        self.status = DDChatToolBarStatusKeyboard;
    }
    return YES;
}

#pragma mark - overrid
- (BOOL)resignFirstResponder
{
//    [self.moreButton setImage:kMoreImage imageHL:kMoreImageHL];
//    [self.emojiButton setImage:kEmojiImage imageHL:kEmojiImageHL];
//    if (self.status == TLChatBarStatusKeyboard) {
//        [self.textView resignFirstResponder];
//        self.status = TLChatBarStatusInit;
//        if (self.delegate && [self.delegate respondsToSelector:@selector(chatBar:changeStatusFrom:to:)]) {
//            [self.delegate chatBar:self changeStatusFrom:self.status to:TLChatBarStatusInit];
//        }
//    }
    
//    return [super resignFirstResponder];
    [self.inputTextView resignFirstResponder];
    return [super resignFirstResponder];
}


@end
