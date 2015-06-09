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

@interface LjjTabBarViewController ()

@end

@implementation LjjTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化所有子控制器
    [self setUpAllChildViewControllers];
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
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage* meSelectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = [meSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 子控制器包装导航控制器
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


@end
