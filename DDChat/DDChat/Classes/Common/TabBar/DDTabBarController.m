//
//  DDTabBarController.m
//  DDChat
//
//  Created by wuqh on 2018/5/17.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDTabBarController.h"
#import "DDNavigationController.h"
#import "DDHomeViewController.h"
#import "DDAddressBookViewController.h"
#import "DDDiscoveryViewController.h"
#import "DDMineViewController.h"

@interface DDTabBarController ()

@end

@implementation DDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViewControllers];
}

- (void)setupViewControllers {
    [self addChildViewController:[DDHomeViewController new] title:@"微信" image:@"tabbar_mainframe"];
    [self addChildViewController:[DDAddressBookViewController new] title:@"通信录" image:@"tabbar_contacts"];
    [self addChildViewController:[DDDiscoveryViewController new] title:@"发现" image:@"tabbar_discover"];
    [self addChildViewController:[DDMineViewController new] title:@"我" image:@"tabbar_me"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)imageName{
    childController.title = title;
    DDNavigationController *nav = [[DDNavigationController alloc] initWithRootViewController:childController];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@HL",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:2.0/255.0f green:187.0/255.0f blue:0.0/255.0f alpha:1.0]} forState:UIControlStateSelected];
    
    [self addChildViewController:nav];
}


@end
