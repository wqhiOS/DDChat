//
//  DDPressToTalkButton.h
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DDPressToTalkButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame
             touchBeginAction:(void (^)(void))touchBegin
              touchMoveAction:(void (^)(BOOL))touchMove
               touchEndAction:(void (^)(BOOL))touchEnd
            touchCancelAction:(void (^)(void))touchCancel;


@end
