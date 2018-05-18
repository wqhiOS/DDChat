//
//  DDChatRecordIndicatorView.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatRecordIndicatorView.h"

@interface DDChatRecordIndicatorView()

@property (nonatomic, strong) UIImageView *microphoneImageView;
@property (nonatomic, strong) UIImageView *signalImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UILabel *promptLabel;

@end

@implementation DDChatRecordIndicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    self.microphoneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_record_recording"]];
    [self addSubview:self.microphoneImageView];
    
    self.signalImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_record_signal_1"]];
    [self addSubview:self.signalImageView];
    
    self.centerImageView = [[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"chat_record_cancel"]];
    [self addSubview:self.centerImageView];
    self.centerImageView.hidden = YES;
    
    self.promptLabel = [[UILabel alloc] init];
    self.promptLabel.layer.cornerRadius = 4.f;
    self.promptLabel.layer.masksToBounds = YES;
    [self addSubview:self.promptLabel];
    
    [self.microphoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(21);
        make.centerY.equalTo(self);
    }];
    [self.signalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-21);
        make.centerY.equalTo(self);
    }];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-4);
    }];
    [self.centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)setRecordIndicatorStatus:(DDChatRecordIndicatorViewStatus)recordIndicatorStatus {
    _recordIndicatorStatus = recordIndicatorStatus;
    switch (recordIndicatorStatus) {
        case DDChatRecordIndicatorViewStatusRecording:
        {
            self.promptLabel.backgroundColor = [UIColor clearColor];
            self.promptLabel.text = @"手指上滑，取消发送";
            
            self.centerImageView.hidden = YES;
            self.microphoneImageView.hidden = NO;
            self.signalImageView.hidden = NO;
            
        }
            break;
        case DDChatRecordIndicatorViewStatusWillCancel:
        {
            self.promptLabel.backgroundColor = [UIColor redColor];
            self.promptLabel.text = @"松开手指，取消发送";
            self.centerImageView.hidden = NO;
            self.centerImageView.image = [UIImage imageNamed:@"chat_record_cancel"];
            self.microphoneImageView.hidden = YES;
            self.signalImageView.hidden = YES;
        }
            break;
        case DDChatRecordIndicatorViewStatusTooShort:
        {
            _recordIndicatorStatus = recordIndicatorStatus;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.centerImageView.hidden = NO;
                self.centerImageView.image = [UIImage imageNamed:@"chat_record_cancel"];
                self.microphoneImageView.hidden = YES;
                self.signalImageView.hidden = YES;
                
                self.promptLabel.text = @"说话时间太短";
            });
        }
            break;
            
        default:
            break;
    }
}

@end
