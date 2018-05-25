//
//  DDChatViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/23.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatViewController.h"
#import "DDChatModel.h"
#import "DDChatCell.h"
#import "DDAddressBookModel.h"
@interface DDChatViewController ()<UITableViewDataSource,UITableViewDelegate>






@end

@implementation DDChatViewController

- (instancetype)initWithAddressBookModel:(DDAddressBookModel *)addressBookModel {
    if (self = [super init]) {
        self.addressBookModel = addressBookModel;
    }
    return self;
}

- (instancetype)initWithTargetId:(NSString *)targetId {
    if (self = [super init]) {
        _targetId = targetId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:Notification_RecivedMessage object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
       
        RCMessage *message = note.userInfo[@"message"];
        NSLog(@"收到消息 %@",message);
    }];
    
    NSArray *getMessages = [[RCIMClient sharedRCIMClient] getLatestMessages:ConversationType_PRIVATE targetId:_targetId count:99];
    self.messages  = [NSMutableArray array];
    for (RCMessage *message in getMessages) {
        [self.messages insertObject:message atIndex:0];
    }
    [self.tableView reloadData];
    NSLog(@"%@",self.messages);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.chatToolBar scrollViewToBottom:NO];
}

#pragma mark - setupUI
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"fjy";
    
    self.messages = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[DDChatCell class] forCellReuseIdentifier:@"cellId"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.chatToolBar = [[DDChatToolBar alloc]initWithTableView:self.tableView];
    self.chatToolBar.translateDelegate = self;
    self.chatToolBar.delegate = self;
   
}

#pragma mark - UITableViewDataSource
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DDChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.message = self.messages[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
