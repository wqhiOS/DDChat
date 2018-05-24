//
//  DDAddFriendViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/24.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDAddFriendViewController.h"

@interface DDAddFriendViewController ()

@end

@implementation DDAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加朋友";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addConfirmItemClick:)];
}
- (void)addConfirmItemClick:(UIBarButtonItem *)item {
    
}



@end
