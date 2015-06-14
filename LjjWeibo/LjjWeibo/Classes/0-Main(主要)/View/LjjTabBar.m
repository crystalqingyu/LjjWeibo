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

@property (nonatomic, strong) LjjTabBarButton* selectedButton;

@end

@implementation LjjTabBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
    }
    return self;
}

- (void)addButtonWithTabBarItem:(UITabBarItem *)item {
    // 创建按钮
    LjjTabBarButton* button = [[LjjTabBarButton alloc] init];
    [self addSubview:button];
    // 设置按钮
    [button setItem:item];
    // 监听按钮
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat y = 0;
    CGFloat w = self.frame.size.width / self.subviews.count;
    CGFloat h = self.frame.size.height;
    for (int i = 0; i<self.subviews.count; i++) {
        LjjTabBarButton* button = self.subviews[i];
        CGFloat x = self.frame.size.width / self.subviews.count * i;
        button.frame = CGRectMake(x, y, w, h);
        // 默认一进来第0个按钮选中
        if (i == 0) {
            [self clickButton:button];
        }
    }
}

- (void)clickButton: (LjjTabBarButton*)button {
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
