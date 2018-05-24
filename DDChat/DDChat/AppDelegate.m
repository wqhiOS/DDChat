//
//  AppDelegate.m
//  DDChat
//
//  Created by wuqh on 2018/5/18.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "AppDelegate.h"
#import "DDTabBarController.h"

/*
 bHupU4xPHlNDYVf5g70DiWqOo4oQ66S4TwsfZLDZe0z+3OcNnX++wx1F/0OoMsFe4qE84vzEUSpTjUK2fWeONpLpeUGSnMHm
 18516503957
 
 cJ7wi5lxldrXT0rE0PvJmGqOo4oQ66S4TwsfZLDZe0xEdF5Dje9tbuNJm1GRn8hKQ+8V3OB9KA+cC18eEBIWex7hgFUtgstd
 16602152440
 */
@interface AppDelegate ()<RCIMClientReceiveMessageDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[RCIMClient sharedRCIMClient] initWithAppKey:@"8luwapkv8j7rl"];
    [[RCIMClient sharedRCIMClient] connectWithToken:@"bHupU4xPHlNDYVf5g70DiWqOo4oQ66S4TwsfZLDZe0z+3OcNnX++wx1F/0OoMsFe4qE84vzEUSpTjUK2fWeONpLpeUGSnMHm" success:^(NSString *userId) {
        NSLog(@"%@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"%ld",(long)status);
    } tokenIncorrect:^{
        NSLog(@"token过期");
    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [DDTabBarController new];
    
    //接受消息
    [self reciveMessages];
    return YES;
}

- (void)reciveMessages {
    [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self object:nil];
}
/*!
 接收消息的回调方法
 
 @param message     当前接收到的消息
 @param nLeft       还剩余的未接收的消息数，left>=0
 @param object      消息监听设置的key值
 
 @discussion 如果您设置了IMlib消息监听之后，SDK在接收到消息时候会执行此方法。
 其中，left为还剩余的、还未接收的消息数量。比如刚上线一口气收到多条消息时，通过此方法，您可以获取到每条消息，left会依次递减直到0。
 您可以根据left数量来优化您的App体验和性能，比如收到大量消息时等待left为0再刷新UI。
 object为您在设置消息接收监听时的key值。
 */
- (void)onReceived:(RCMessage *)message
              left:(int)nLeft
            object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *testMessage = (RCTextMessage *)message.content;
        NSLog(@"消息内容：%@", testMessage.content);
    }
    
    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
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
