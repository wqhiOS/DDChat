//
//  DDChatBaseViewController.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatBaseViewController.h"

#import "DDChatViewController+keyboardNotification.h"
#import "DDChatBaseViewController+chatToolBarTranslate.h"
#import "DDChatBaseViewController+ChatKeyboard.h"

@interface DDChatBaseViewController ()

@end

@implementation DDChatBaseViewController

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
    
    [self registerNotificationCenter];
    [self initChatKeyboard];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark - Action

#pragma mark TapAction
- (void)tap:(UITapGestureRecognizer *)ges {
    [self.chatToolBar resignFirstResponder];
}

@end
