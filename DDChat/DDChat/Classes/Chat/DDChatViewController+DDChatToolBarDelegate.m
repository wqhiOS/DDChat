//
//  DDChatViewController+DDChatToolBarDelegate.m
//  DDChat
//
//  Created by wuqh on 2018/5/21.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController+DDChatToolBarDelegate.h"
#import "DDChatToolBar.h"
#import "DDChatEmojiKeyboard.h"

@implementation DDChatViewController (DDChatToolBarDelegate)

#pragma mark - DDChatToolBarDelegate
- (void)chatToolBarFromStatus:(DDChatToolBarStatus)fromStatus toStatus:(DDChatToolBarStatus)toStatus {

    if (curStatus == toStatus) {
        return;
    }
    lastStatus = fromStatus;
    curStatus = toStatus;
    
    if (toStatus == DDChatToolBarStatusVoice) {
        
        
        
    }else if (toStatus == DDChatToolBarStatusEmoji) {
        [self.emojiKeyboard showInView:self.view withAnimation:YES];
    }else if (toStatus == DDChatToolBarStatusKeyboard) {
        return;
    }
}

@end
