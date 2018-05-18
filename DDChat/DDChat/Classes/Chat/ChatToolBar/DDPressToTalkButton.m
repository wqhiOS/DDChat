//
//  DDPressToTalkButton.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDPressToTalkButton.h"

typedef NS_ENUM(NSInteger,DDPressToTalkButtonState) {
    DDPressToTalkButtonStateNormal,
    DDPressToTalkButtonStateHighlighted,
    DDPressToTalkButtonStateCancel
};

@interface DDPressToTalkButton()

@property (nonatomic, assign) DDPressToTalkButtonState pressToTalkButtonState;

@property (nonatomic, copy) void(^touchbegin)(void);
@property (nonatomic, copy) void(^touchMove)(void);
@property (nonatomic, copy) void(^touchEnd)(void) ;
@property (nonatomic, copy) void(^touchCancel)(void) ;

@end

@implementation DDPressToTalkButton

- (instancetype)initWithFrame:(CGRect)frame touchBeginAction:(void (^)(void))touchBegin touchMoveAction:(void (^)(void))touchMove touchEndAction:(void (^)(void))touchEnd touchCancelAction:(void (^)(void))touchCancel {
    
    if (self = [super initWithFrame:frame]) {
        self.touchbegin = touchBegin;
        self.touchMove = touchMove;
        self.touchEnd = touchEnd;
        self.touchCancel = touchCancel;
        
        self.pressToTalkButtonState = DDPressToTalkButtonStateNormal;

        self.layer.masksToBounds = YES;
        self.layer.borderWidth = BORDER_WIDTH_1PX;
        self.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.3].CGColor;;
        self.layer.cornerRadius = 4.0f;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.pressToTalkButtonState = DDPressToTalkButtonStateHighlighted;
    if (self.touchbegin) {
        self.touchbegin();
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    
    if (point.y < -40) {
        self.pressToTalkButtonState = DDPressToTalkButtonStateCancel;
        if (self.touchMove) {
            self.touchMove();
        }
    }else {
        if (self.pressToTalkButtonState != DDPressToTalkButtonStateHighlighted) {
            self.pressToTalkButtonState = DDPressToTalkButtonStateHighlighted;
            if (self.touchbegin) {
                self.touchbegin();
            }
        }
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.pressToTalkButtonState = DDPressToTalkButtonStateNormal;
    if (self.touchEnd) {
        self.touchEnd();
    }
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.pressToTalkButtonState = DDPressToTalkButtonStateCancel;
}

- (void)setPressToTalkButtonState:(DDPressToTalkButtonState)pressToTalkButtonState {
    _pressToTalkButtonState = pressToTalkButtonState;
    
    switch (pressToTalkButtonState) {
        case DDPressToTalkButtonStateNormal:
        {
            [self setTitle:@"按住 说话" forState:UIControlStateNormal];
            [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
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
