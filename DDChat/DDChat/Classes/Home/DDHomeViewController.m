//
//  DDHomeViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/17.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDHomeViewController.h"
#import "DDConversationCell.h"
#import "DDChatViewController.h"

@interface DDHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<RCConversation *>*conversations;

@end

@implementation DDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.conversations =[[RCIMClient sharedRCIMClient]
                         getConversationList:@[@(ConversationType_PRIVATE),
                                               @(ConversationType_DISCUSSION),
                                               @(ConversationType_GROUP),
                                               @(ConversationType_SYSTEM),
                                               @(ConversationType_APPSERVICE),
                                               @(ConversationType_PUBLICSERVICE)]];
    [self.tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 68;
        [_tableView registerClass:[DDConversationCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.conversations.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.conversation = self.conversations[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    DDChatViewController *vc = [[DDChatViewController alloc]  initWithTargetId:[self.conversations[indexPath.row] targetId]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
