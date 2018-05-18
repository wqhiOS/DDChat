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

@interface DDChatViewController ()<UITableViewDataSource,UITableViewDelegate,DDChatToolBarRecordDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DDChatToolBar *chatToolBar;
@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation DDChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.title = @"fjy";
    [self loadData];
    [self setupUI];
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
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    [self.chatToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@49);
        make.top.equalTo(self.tableView.mas_bottom);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource= self;
        _tableView.delegate= self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [_tableView registerClass:[DDChatCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}
- (DDChatToolBar *)chatToolBar {
    if (!_chatToolBar) {
        _chatToolBar = [[DDChatToolBar alloc] init];
        _chatToolBar.recordDelegate = self;
    }
    return _chatToolBar;
}

#pragma mark - DDChatToolBarRecordDelegate
- (void)chatToolBarStartRecord {
    [[DDAudioRecorder defaultRecorder] startRecordingWithVolumeChangedBlock:nil completeBlock:nil cancelBlock:nil];
}
- (void)chatToolBarRecording {
    
}
- (void)chatToolBarEndRecord {
    [[DDAudioRecorder defaultRecorder] stopRecording];
}
- (void)chatToolBarCancelRecord {
    [[DDAudioRecorder defaultRecorder] cancelRecording];
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
- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [self.chatToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).mas_offset(-keyboardFrame.size.height);
    }];
    [self.view layoutIfNeeded];
}

@end
