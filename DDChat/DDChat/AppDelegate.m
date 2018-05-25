//
//  AppDelegate.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "AppDelegate.h"
#import "DDTabBarController.h"
#import "AppDelegate+ChatMessage.h"
#import "DDNavigationController.h"
#import "DDLoginViewController.h"

#define DDChat_AppKey @"8luwapkv8j7rl"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"userId"]) {
        
        self.window.rootViewController = [DDTabBarController new];
        [self loadIMClient];
        
    }else {
        DDNavigationController *nav = [[DDNavigationController alloc] initWithRootViewController:[DDLoginViewController new]];
        self.window.rootViewController = nav;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)loadIMClient {
    
    if ([USER_ID isEqualToString:@"18516503957"]) {
        [DDUserInfoModel defaultModel].name = @"吴启晗";
        DDUserInfoModel.defaultModel.headPortrait = @"meIcon";
        DDUserInfoModel.defaultModel.userId = @"18516503957";
        
        DDUserInfoModel *friend = [DDUserInfoModel new];
        friend.name = @"冯加育";
        friend.headPortrait = @"youIcon";
        friend.userId=  @"16602152440";
        
        DDUserInfoModel.defaultModel.friends = @[friend].mutableCopy;
    }else {
        [DDUserInfoModel defaultModel].name =@"冯加育";
        DDUserInfoModel.defaultModel.headPortrait = @"youIcon";
        DDUserInfoModel.defaultModel.userId = @"16602152440";
        
        DDUserInfoModel *friend = [DDUserInfoModel new];
        friend.name = @"吴启晗";
        friend.headPortrait = @"meIcon";
        friend.userId=  @"18516503957";
        
        DDUserInfoModel.defaultModel.friends = @[friend].mutableCopy;
    }
    
    NSDictionary *tokenDict = @{
                                @"18516503957":@"bHupU4xPHlNDYVf5g70DiWqOo4oQ66S4TwsfZLDZe0z+3OcNnX++wx1F/0OoMsFe4qE84vzEUSpTjUK2fWeONpLpeUGSnMHm"
                                ,@"16602152440":@"HaOgrWt43XF6bI/vqDo8pGqOo4oQ66S4TwsfZLDZe0xEdF5Dje9tbms5fhkX9aLEm16EaORO3R2cC18eEBIWex7hgFUtgstd"
                                
                                };
    
    [[RCIMClient sharedRCIMClient] initWithAppKey:DDChat_AppKey];
    
    [[RCIMClient sharedRCIMClient] connectWithToken:tokenDict[USER_ID] success:^(NSString *userId) {
        
        NSLog(@"登录成功%@",userId);
        [self chatHandle];
        
    } error:^(RCConnectErrorCode status) {
        
        NSLog(@"%ld",(long)status);
        
    } tokenIncorrect:^{
        
        NSLog(@"token过期");
    }];
}

- (void)chatHandle {
    [self recivedMessage];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
