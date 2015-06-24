//
//  LjjNavigationController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/17.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjNavigationController.h"

@interface LjjNavigationController ()

@end

@implementation LjjNavigationController

+ (void)initialize {
    // 设置导航栏主题
    [self setNavBarTheme];
    // 设置导航栏按钮主题
    [self setBarButtonItemTheme];
}

// 设置导航栏主题
+ (void)setNavBarTheme {
    // 取出appearence对象
    UINavigationBar* bar = [UINavigationBar appearance];
    if (!IOS7) {
        // 设置背景
        [bar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    // 设置标题属性
    NSMutableDictionary* attrDict = [NSMutableDictionary dictionary];
    [bar setTitleTextAttributes:attrDict];
    attrDict[UITextAttributeTextColor] = [UIColor blackColor];
    attrDict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    attrDict[UITextAttributeFont] = [UIFont boldSystemFontOfSize:22];
}
// 设置导航栏barButtonItem主题
+ (void)setBarButtonItemTheme {
    // 取出appearence对象
    UIBarButtonItem* item = [UIBarButtonItem appearance];
    if (!IOS7) {
        // 设置背景
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    // 设置标题属性
    NSMutableDictionary* attrDict = [NSMutableDictionary dictionary];
    [item setTitleTextAttributes:attrDict forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrDict forState:UIControlStateHighlighted];
    attrDict[UITextAttributeTextColor] = !IOS7? [UIColor grayColor] : [UIColor orangeColor];
    attrDict[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    attrDict[UITextAttributeFont] = [UIFont systemFontOfSize:14];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 拦截新push控制器底部tabBar的显示
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断如果不是根控制器添加进去，就要隐藏tabBar
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
