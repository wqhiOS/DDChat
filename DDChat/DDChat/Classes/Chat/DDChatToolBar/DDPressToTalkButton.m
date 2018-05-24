//
//  DDPressToTalkButton.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDPressToTalkButton.h"
#import "DDChatToolBarCommon.h"

typedef NS_ENUM(NSInteger,DDPressToTalkButtonState) {
    DDPressToTalkButtonStateNormal,
    DDPressToTalkButtonStateHighlighted,
    DDPressToTalkButtonStateCancel
};

@interface DDPressToTalkButton()

@property (nonatomic, assign) DDPressToTalkButtonState pressToTalkButtonState;

@end

@implementation DDPressToTalkButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = BORDER_WIDTH_1PX;
        self.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.3].CGColor;;
        self.layer.cornerRadius = 4.0f;
        
        [self setTitleColor:HexColor(0x444444) forState:UIControlStateNormal];
        
        self.pressToTalkButtonState = DDPressToTalkButtonStateNormal;
    }
    return self;
}

- (void)setPressToTalkButtonState:(DDPressToTalkButtonState)pressToTalkButtonState {
    _pressToTalkButtonState = pressToTalkButtonState;
    
    switch (pressToTalkButtonState) {
        case DDPressToTalkButtonStateNormal:
        {
            [self setTitle:@"按住 说话" forState:UIControlStateNormal];
            [self setTitleColor:HexColor(0x444444) forState:UIControlStateNormal];
            self.backgroundColor = HexColor(0xF5F5F7);
            
        }
            break;
        case DDPressToTalkButtonStateHighlighted:
        {
            [self setTitle:@"松开 结束" forState:UIControlStateNormal];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.backgroundColor = HexColor(0xB9BBC0);
        }
            break;
        case DDPressToTalkButtonStateCancel:
        {
            [self setTitle:@"松开 取消" forState:UIControlStateNormal];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.backgroundColor = HexColor(0xB9BBC0);
        }
            break;
        default:
            break;
    }
    
}


@end
