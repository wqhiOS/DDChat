//
//  DDChatViewController.h
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDBaseViewController.h"
@class DDChatToolBar,DDChatEmojiKeyboard,DDChatRecordIndicatorView;

@interface DDChatViewController : DDBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DDChatToolBar *chatToolBar;
@property (nonatomic, strong) DDChatRecordIndicatorView *recordIndicatorView;
@property (nonatomic, strong) DDChatEmojiKeyboard *emojiKeyboard;

@end
