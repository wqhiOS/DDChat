//
//  DDChatViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController.h"
#import "DDChatCell.h"
#import "DDChatModel.h"
#import "DDChatToolBar.h"
#import "DDAudioRecorder.h"
#import "DDChatEmojiKeyboard.h"
#import "DDChatRecordIndicatorView.h"

#import "DDChatViewController+AudioRecorder.h"
#import "DDChatViewController+DDChatToolBarDelegate.h"

@interface DDChatViewController ()<UITableViewDataSource,UITableViewDelegate,DDChatKeyboardDelegate>



@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation DDChatViewController

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    self.title = @"fjy";
    [self loadData];
    [self setupUI];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)ges {
    [self.chatToolBar resignFirstResponder];
}

- (void)loadData {
    DDChatModel *model1 = [DDChatModel new];
    model1.messageText = @"hello world!";
    model1.roleType = DDMessageRolwTypeOthers;
    model1.messageTime = @"08:51";
    
    DDChatModel *model2 = [DDChatModel new];
    model2.messageText = @"hello world!hello world!hello world!hello world!hello world!hello world!";
    model2.messageTime = @"08:53";
    model2.roleType = DDMessageRolwTypeMe;
    
    DDChatModel *model3 = [DDChatModel new];
    model3.messageText = @"hello world!hello world!hello world!hello world!hello world!hello world!你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界";
    //    model3.messageTime = @"08:53";
    model3.roleType = DDMessageRolwTypeMe;
    
    DDChatModel *model4 = [DDChatModel new];
    model4.messageText = @"世界你好世界你好世界";
    //    model4.messageTime = @"08:53";
    model4.roleType = DDMessageRolwTypeMe;
    
    DDChatModel *model5 = [DDChatModel new];
    model5.messageText = @"hello world!hello world!hello world!hello world!hello world!hello world!你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界";
    model5.messageTime = @"09:05";
    model5.roleType = DDMessageRolwTypeMe;
    
    DDChatModel *model6 = [DDChatModel new];
    model6.messageText = @"hello world!hello world!hello world!hello world!hello world!hello world!你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界你好世界";
    model6.messageTime = @"10:11";
    model6.roleType = DDMessageRolwTypeMe;
    
    self.messages = @[model1,model2,model3,model4,model5,model6].mutableCopy;
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.chatToolBar];
    [self.view addSubview:self.recordIndicatorView];
    [self.view addSubview:self.emojiKeyboard];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    [self.chatToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@49);
        make.top.equalTo(self.tableView.mas_bottom);
    }];
    
    [self.recordIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.width.equalTo(@150);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource= self;
        _tableView.delegate= self;
//        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_tableView registerClass:[DDChatCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

- (DDChatToolBar *)chatToolBar {
    if (!_chatToolBar) {
        _chatToolBar = [[DDChatToolBar alloc] init];
        _chatToolBar.recordDelegate = self;
        _chatToolBar.delegate = self;
    }
    return _chatToolBar;
}

- (DDChatRecordIndicatorView *)recordIndicatorView {
    if (!_recordIndicatorView) {
        _recordIndicatorView = [[DDChatRecordIndicatorView alloc] initWithFrame:CGRectZero];
        _recordIndicatorView.hidden = YES;
    }
    return _recordIndicatorView;
}

- (DDChatEmojiKeyboard *)emojiKeyboard {
    if (!_emojiKeyboard) {
        _emojiKeyboard = [DDChatEmojiKeyboard defaultKeyboard];
        _emojiKeyboard.keyboardDelegate = self;
    }
    return _emojiKeyboard;
}

#pragma mark - DDC
- (void)chatKeyboardWillShow:(id)keyboard animated:(BOOL)animated
{
//    [self.messageDisplayView scrollToBottomWithAnimation:YES];
    
}

- (void)chatKeyboardDidShow:(id)keyboard animated:(BOOL)animated
{
    if (curStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
     if (lastStatus == DDChatToolBarStatusEmoji) {
        [self.emojiKeyboard dismissWithAnimation:NO];
    }
    
}

- (void)chatKeyboard:(id)keyboard didChangeHeight:(CGFloat)height
{

    NSLog(@"---:%f",height);
    [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-height);
    }];
    [self.view layoutIfNeeded];

    
}





#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DDChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.chatModel = self.messages[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - 键盘通知
- (void)keyboardWillShow:(NSNotification *)nf {
    if (curStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
}

- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    if (curStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSLog(@"KEYBOARD:%@",NSStringFromCGRect(keyboardFrame));
    if (curStatus != DDChatToolBarStatusKeyboard && lastStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
    if (lastStatus == DDChatToolBarStatusMore || lastStatus == DDChatToolBarStatusEmoji) {
        //        if (keyboardFrame.size.height <= 215.f) {
        //            return;
        //        }
        //        return;
    }
    else if (curStatus == DDChatToolBarStatusEmoji || curStatus == DDChatToolBarStatusMore) {
        return;
    }
    [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        if (keyboardFrame.origin.y == [UIScreen mainScreen].bounds.size.height) {
             make.bottom.mas_equalTo(self.view).mas_offset(0);
        }else {
             make.bottom.mas_equalTo(self.view).mas_offset(-keyboardFrame.size.height);
        }
       
    }];
    [self.view layoutIfNeeded];
}
- (void)keyboardDidShow:(NSNotification *)notification
{
    if (curStatus != DDChatToolBarStatusKeyboard && lastStatus != DDChatToolBarStatusKeyboard) {
        return;
    }
    if (lastStatus == DDChatToolBarStatusEmoji) {
        [self.emojiKeyboard dismissWithAnimation:NO];
    }
//    [self.messageDisplayView scrollToBottomWithAnimation:YES];
}


@end
