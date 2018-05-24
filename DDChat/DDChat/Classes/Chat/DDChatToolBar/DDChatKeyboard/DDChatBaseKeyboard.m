//
//  DDChatBaseKeyboard.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseKeyboard.h"
#import "DDChatToolBarCommon.h"

@implementation DDChatBaseKeyboard

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HexColor(0xF2F2F5);
    }
    return self;
}

- (void)showInView:(UIView *)view withAnimation:(BOOL)animation {
    [view addSubview:self];
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(view);
        make.height.equalTo(@KEYBOARD_HEIGHT);
        make.bottom.equalTo(view).mas_offset(KEYBOARD_HEIGHT);
    }];
    [view layoutIfNeeded];
    
    if (animation) {
        [UIView animateWithDuration:0.3 animations:^{
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(view);
            }];
            [view layoutIfNeeded];
            
            if ([self.delegate respondsToSelector:@selector(chatKeyboard:didChangeHeight:)]) {
                [self.delegate chatKeyboard:self didChangeHeight:self.bounds.size.height];
            }
        } completion:^(BOOL finished) {
            //让tableView滚动到最底部
        }];
    }else {
        
    }
    
}

- (void)dismissWithAnimation:(BOOL)animation {
    if (animation) {
        [UIView animateWithDuration:0.3 animations:^{
            
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.superview.mas_bottom).offset(self.bounds.size.height);
            }];
            [self.superview layoutIfNeeded];
            if (self.delegate && [self.delegate respondsToSelector:@selector(chatKeyboard:didChangeHeight:)]) {
                [self.delegate chatKeyboard:self didChangeHeight:self.superview.bounds.size.height - self.frame.origin.y];
            }
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {

            [self removeFromSuperview];

    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.5 alpha:0.3].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, [UIScreen mainScreen].bounds.size.width, 0);
    CGContextStrokePath(context);
}


@end
