//
//  DDChatViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/23.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController.h"

@interface DDChatViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DDChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

#pragma mark - setupUI
- (void)setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.tableView];
    
    self.chatToolBar = [[DDChatToolBar alloc]init];
    self.chatToolBar.translateDelegate = self;
    [self.view addSubview:self.chatToolBar];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(self.view);
    }];
    [self.chatToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@49);
        make.left.right.and.bottom.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


@end
