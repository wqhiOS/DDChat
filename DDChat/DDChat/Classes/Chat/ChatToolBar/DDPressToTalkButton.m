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
@property (nonatomic, copy) void(^touchMove)(BOOL);
@property (nonatomic, copy) void(^touchEnd)(BOOL) ;
@property (nonatomic, copy) void(^touchCancel)(void) ;

/**
 YES 代表录制结束。NO代表取消录制
 */
@property (nonatomic, assign) BOOL isComplete;

@end

@implementation DDPressToTalkButton

- (instancetype)initWithFrame:(CGRect)frame touchBeginAction:(void (^)(void))touchBegin touchMoveAction:(void (^)(BOOL))touchMove touchEndAction:(void (^)(BOOL))touchEnd touchCancelAction:(void (^)(void))touchCancel {
    
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
        
        [self setTitleColor:HexColor(0x444444) forState:UIControlStateNormal];
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
    self.isComplete = YES;
    if (self.touchbegin) {
        self.touchbegin();
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self];
    
    if (point.y < -40) {
        self.pressToTalkButtonState = DDPressToTalkButtonStateCancel;
        self.isComplete = NO;
        if (self.touchMove) {
            self.touchMove(YES);//YES代表取消
        }
    }else {
        
        if (self.pressToTalkButtonState != DDPressToTalkButtonStateHighlighted) {
            self.pressToTalkButtonState = DDPressToTalkButtonStateHighlighted;
            self.isComplete = YES;
            if (self.touchMove) {
                self.touchMove(NO);//NO代表不取消
            }
        }
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.pressToTalkButtonState = DDPressToTalkButtonStateNormal;
    NSLog(@"%ld",self.isComplete);
    if (self.touchEnd) {
        self.touchEnd(self.isComplete);
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
