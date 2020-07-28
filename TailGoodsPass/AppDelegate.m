//
//  AppDelegate.m
//  TailGoodsPass
//
//  Created by 杨旭 on 2017/9/2.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchViewController.h"

/** 高德地图*/
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    // 引导页
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    // 使用 NSUserDefaults 读取用户数据
    if (![useDef boolForKey:@"notFirst"]) {
        // 如果是第一次进入引导页
        _window.rootViewController = [[LaunchViewController alloc] init];
    }
    else{
        // 否则直接进入应用
        UIStoryboard *storyBord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UITabBarController *tabBarController = [storyBord instantiateViewControllerWithIdentifier:@"RootViewController"];
        _window.rootViewController = tabBarController;
        
    }
    
    // 高德地图SDK
    [[AMapServices sharedServices] setEnableHTTPS:YES];
    [AMapServices sharedServices].apiKey = AMAPIKey;

    
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:HXAPPKEY];
    options.apnsCertName = APNSCert;
    [[EMClient sharedClient] initializeSDKWithOptions:options];


    [[EMClient sharedClient] loginWithUsername:@"yuancan001"
                                      password:@"123"
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            NSLog(@"登录成功");
                                        } else {
                                            NSLog(@"登录失败");
                                        }
                                    }];
    
    return YES;
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