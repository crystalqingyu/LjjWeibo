//
//  LjjTabBarViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/9.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTabBarViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "UIImage+Ljj.h"
#import "LjjTabBar.h"

@interface LjjTabBarViewController ()

@property (nonatomic, strong) LjjTabBar* customTabBar;

@end

@implementation LjjTabBarViewController

- (LjjTabBar*)customTabBar {
    if (_customTabBar==nil) {
        // 初始化LjjTabBar
        _customTabBar = [[LjjTabBar alloc] initWithFrame:self.tabBar.bounds];
    }
    return _customTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加customTabBar
    [self.tabBar addSubview:self.customTabBar];
    // 初始化所有子控制器
    [self setUpAllChildViewControllers];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 删除系统自带的tabBar的Button
    for (id child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

// 初始化所有子控制器
- (void)setUpAllChildViewControllers {
    // 首页
    HomeViewController* homeVc = [[HomeViewController alloc] init];
    [self setUpChildViewController:homeVc title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    // 消息
    MessageViewController* messageVc = [[MessageViewController alloc] init];
    [self setUpChildViewController:messageVc title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    // 广场
    DiscoverViewController* discoverVc = [[DiscoverViewController alloc] init];
    [self setUpChildViewController:discoverVc title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    // 我
    MeViewController* meVc = [[MeViewController alloc] init];
    [self setUpChildViewController:meVc title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

// 初始化一个子控制器
- (void)setUpChildViewController: (UIViewController*)childVc title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName {
    // 设置子控制器属性
    childVc.view.backgroundColor = [UIColor greenColor];
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    UIImage* selectedImage = [UIImage imageWithName:selectedImageName];
    if (IOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    // 子控制器包装导航控制器
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    // tabBar添加相应button
    [self.customTabBar addButtonWithTabBarItem:childVc.tabBarItem];
}

@end
