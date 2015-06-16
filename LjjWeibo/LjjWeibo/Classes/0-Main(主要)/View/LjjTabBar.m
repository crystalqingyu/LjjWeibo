//
//  LjjTabBar.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/11.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTabBar.h"
#import "LjjTabBarButton.h"

@interface LjjTabBar ()

@property (nonatomic, weak) LjjTabBarButton* selectedButton;
// 中间的加号按钮
@property (nonatomic, weak) UIButton* plusButton;
// 除了加号按钮的其他按钮数组
@property (nonatomic, strong) NSMutableArray* tabBarButtonsArray;

@end

@implementation LjjTabBar

- (NSMutableArray*)tabBarButtonsArray {
    if (!_tabBarButtonsArray) {
        _tabBarButtonsArray = [NSMutableArray array];
    }
    return _tabBarButtonsArray;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景
        if (!IOS7) {
            self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        // 创建加号按钮
        UIButton* plusButton = [[UIButton alloc] init];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        // 设置加号按钮的frame
        CGSize plusButtonSize = plusButton.currentBackgroundImage.size;
        CGRect frame = CGRectMake(0, 0, plusButtonSize.width, plusButtonSize.height);
        plusButton.frame = frame;
        plusButton.center = self.center;
        [self addSubview:plusButton];
        // 添加加号按钮到全局变量中
        _plusButton = plusButton;
    }
    return self;
}

- (void)addButtonWithTabBarItem:(UITabBarItem *)item {
    // 创建按钮
    LjjTabBarButton* button = [[LjjTabBarButton alloc] init];
    [self addSubview:button];
    // 设置按钮
    [button setItem:item];
    // 添加按钮到全局数组中
    [self.tabBarButtonsArray addObject:button];
    // 监听按钮
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置tabBarButton按钮位置
    CGFloat y = 0;
    CGFloat w = (self.frame.size.width - self.plusButton.frame.size.width) / self.tabBarButtonsArray.count;
    CGFloat h = self.frame.size.height;
    for (int i = 0; i<self.tabBarButtonsArray.count; i++) {
        LjjTabBarButton* button = self.tabBarButtonsArray[i];
        CGFloat x = (i>=self.tabBarButtonsArray.count/2 ? w * (i+1) : w * i);
        button.frame = CGRectMake(x, y, w, h);
        // 绑定tag
        button.tag = i;
        // 默认一进来第0个按钮选中
        if (i == 0) {
            [self clickButton:button];
        }
    }
}

- (void)clickButton: (LjjTabBarButton*)button {
    // 通知代理切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    // 切换内部按钮
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
