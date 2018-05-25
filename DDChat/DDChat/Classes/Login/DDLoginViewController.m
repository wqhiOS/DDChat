//
//  DDLoginViewController.m
//  DDChat
//
//  Created by wuqh on 2018/5/25.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDLoginViewController.h"
#import "AppDelegate.h"
#import "DDTabBarController.h"

@interface DDLoginViewController ()

@end

@implementation DDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"选择测试账号登录:";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).mas_offset(150);
    }];
    
    UIButton *heButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [heButton setImage:[UIImage imageNamed:@"meIcon"] forState:UIControlStateNormal];
    heButton.layer.masksToBounds = YES;
    heButton.layer.cornerRadius = 25.f;
    [heButton addTarget:self action:@selector(heButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:heButton];
    [heButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(@50);
        make.left.equalTo(self.view).mas_offset(80);
        make.top.equalTo(label.mas_bottom).offset(40);
    }];
    
    UIButton *sheButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sheButton setImage:[UIImage imageNamed:@"youIcon"] forState:UIControlStateNormal];
    sheButton.layer.masksToBounds = YES;
    sheButton.layer.cornerRadius = 25.f;
    [sheButton addTarget:self action:@selector(sheButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sheButton];
    [sheButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(@50);
        make.right.equalTo(self.view).mas_offset(-80);
        make.centerY.equalTo(heButton);
    }];
    
}

#pragma mark - Action
- (void)heButtonClick:(UIButton *)button {
    
    [[NSUserDefaults standardUserDefaults ] setObject:@"18516503957" forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [DDTabBarController new];
   
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate loadIMClient];
}
- (void)sheButtonClick:(UIButton *)button {
    [[NSUserDefaults standardUserDefaults ] setObject:@"16602152440" forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [DDTabBarController new];
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate loadIMClient];
}

@end
