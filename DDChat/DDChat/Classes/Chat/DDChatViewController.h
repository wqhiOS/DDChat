//
//  DDChatViewController.h
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDBaseViewController.h"
#import "DDChatToolBar.h"
@class DDChatEmojiKeyboard,DDChatRecordIndicatorView;

@interface DDChatViewController : DDBaseViewController

{
    DDChatToolBarStatus lastStatus;
    DDChatToolBarStatus curStatus;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DDChatToolBar *chatToolBar;
@property (nonatomic, strong) DDChatRecordIndicatorView *recordIndicatorView;


/**
 表情键盘
 */
@property (nonatomic, strong) DDChatEmojiKeyboard *emojiKeyboard;

@end
