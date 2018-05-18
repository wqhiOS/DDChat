//
//  DDAddressBookViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/17.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDAddressBookViewController.h"
#import "DDAddressBookCell.h"
#import "DDAddressBookModel.h"
#import "DDAddressBookSearchController.h"
#import "DDChatViewController.h"

@interface DDAddressBookViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *dataDict;
@property (nonatomic, strong) DDAddressBookSearchController *searchResultsController;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation DDAddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
    [self setupUI];
    [self setupSearch];
    
}

- (void)loadData {
    
    DDAddressBookModel *addressBookModel1 = [DDAddressBookModel new];
    addressBookModel1.name = @"新的朋友";
    addressBookModel1.headIcon = @"ab_newfriend";
    
    DDAddressBookModel *addressBookModel2 = [DDAddressBookModel new];
    addressBookModel2.name = @"群聊";
    addressBookModel2.headIcon = @"ab_addgroup";

    DDAddressBookModel *addressBookModel3 = [DDAddressBookModel new];
    addressBookModel3.name = @"标签";
    addressBookModel3.headIcon = @"ab_tag";
    
    
    
    DDAddressBookModel *addressBookModel4 = [DDAddressBookModel new];
    addressBookModel4.name = @"公众号";
    addressBookModel4.headIcon = @"ab_newfriend";
    
    DDAddressBookModel *addressBookModel5 = [DDAddressBookModel new];
    addressBookModel5.name = @"fjy";
    addressBookModel5.headIcon = @"youIcon";
    
    self.dataDict = @{@"head":@[addressBookModel1,addressBookModel2,addressBookModel3,addressBookModel4],
                       @"★星标朋友":@[addressBookModel5]}.mutableCopy;
    
    
}
#pragma mark - UI
- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (void)setupSearch {
    self.searchResultsController = [DDAddressBookSearchController new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchResultsController];
    
    self.searchController.searchBar.barTintColor = HexColor(0xECEBF2);
    self.searchController.searchBar.tintColor = HexColor(0x02BB00);
    UIImageView *barImageView = [[[self.searchController.searchBar.subviews firstObject] subviews] firstObject];
    barImageView.layer.borderColor = HexColor(0xe5e5e5).CGColor;
    barImageView.layer.borderWidth = 1;
    
    self.searchController.delegate = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.placeholder = @"搜索";
    
//    if (@available(iOS 11.0, *)) {
//        self.navigationItem.searchController = self.searchController;
//    } else {
    self.tableView.tableHeaderView = self.searchController.searchBar;
//    }
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataDict.allKeys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataDict[self.dataDict.allKeys[section]] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDAddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.addressBookModel = [self.dataDict[self.dataDict.allKeys[indexPath.section]] objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DDChatViewController *vc = [[DDChatViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = HexColor(0xEDECF2);
    label.text = [NSString stringWithFormat:@"    %@",self.dataDict.allKeys[section]];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0 : 30;
}

#pragma mark - Getter
static NSString *cellId = @"cellId";
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[DDAddressBookCell class] forCellReuseIdentifier:cellId];
        _tableView.estimatedRowHeight = 60;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

@end
