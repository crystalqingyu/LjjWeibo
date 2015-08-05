//
//  WeiboTool.m
//  LjjWeibo
//
//  Created by liujingjing on 15/8/4.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//  

#import "WeiboTool.h"
#import "LjjTabBarViewController.h"
#import "NewFeatureViewController.h"

@implementation WeiboTool

+ (void)chooseRootController {
    // 取出当前版本号
    NSString* version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    // 取出上一次登录版本号
    NSString* lastVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"lastVersion"];
    if ([version isEqualToString:lastVersion]) { // 无新版本
        [UIApplication sharedApplication].keyWindow.rootViewController = [[LjjTabBarViewController alloc] init];
    } else { // 有新版本
        [UIApplication sharedApplication].keyWindow.rootViewController = [[NewFeatureViewController alloc] init];
        // 存储版本号到userDefaults
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"lastVersion"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
