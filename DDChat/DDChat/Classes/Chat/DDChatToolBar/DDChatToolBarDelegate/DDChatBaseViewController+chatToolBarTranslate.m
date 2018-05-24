//
//  DDChatBaseViewController+chatToolBarTranslate.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseViewController+chatToolBarTranslate.h"
#import "DDChatEmojiKeyboard.h"

@implementation DDChatBaseViewController (chatToolBarTranslate)

- (void)chatBar:(DDChatToolBar *)chatBar changeStatusFrom:(DDChatToolBarStatus)fromStatus to:(DDChatToolBarStatus)toStatus {
    
    //状态相同 返回
    if (curStatus == toStatus) return;
    
    NSLog(@"%s",__FUNCTION__);
    
    lastStatus = fromStatus;
    curStatus = toStatus;
    
    if (toStatus == DDChatToolBarStatusEmoji) {
        [self.emojiKeyboard showInView:self.view withAnimation:YES];
        if (fromStatus == DDChatToolBarStatusMore) {
            [self.moreKeyboard dismissWithAnimation:NO];
        }
    } else if (toStatus == DDChatToolBarStatusVoice) {
        if (fromStatus == DDChatToolBarStatusEmoji) {
            [self.emojiKeyboard dismissWithAnimation:YES];
        }else if (fromStatus == DDChatToolBarStatusMore) {
            [self.moreKeyboard dismissWithAnimation:YES];
        }
    } else if (toStatus == DDChatToolBarStatusMore) {
        [self.moreKeyboard showInView:self.view withAnimation:YES];
        if (fromStatus == DDChatToolBarStatusEmoji) {
            [self.emojiKeyboard dismissWithAnimation:NO];
        }
    } else if (toStatus == DDChatToolBarStatusInit) {
        if (fromStatus == DDChatToolBarStatusEmoji) {
            [self.emojiKeyboard dismissWithAnimation:YES];
        }else if (fromStatus == DDChatToolBarStatusMore) {
            [self.moreKeyboard dismissWithAnimation:YES];
        }
    }
}

@end
