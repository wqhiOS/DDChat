//
//  DDChatBaseViewController.h
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDChatToolBar.h"
#import "DDChatEmojiKeyboard.h"
#import "DDChatMoreKeyboard.h"
@interface DDChatBaseViewController : UIViewController

{
    DDChatToolBarStatus lastStatus;
    DDChatToolBarStatus curStatus;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DDChatToolBar *chatToolBar;
@property (nonatomic, strong) DDChatEmojiKeyboard *emojiKeyboard;
@property (nonatomic, strong) DDChatMoreKeyboard *moreKeyboard;

@end
