//
//  LjjTabBar.h
//  LjjWeibo
//
//  Created by liujingjing on 15/6/11.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LjjTabBar;
@protocol LjjTabBarDelegate <NSObject>
- (void)tabBar: (LjjTabBar*)tabBar didSelectedButtonFrom: (int)from to: (int)to;
@end

@interface LjjTabBar : UIView

@property (nonatomic, weak) id<LjjTabBarDelegate>delegate;

- (void)addButtonWithTabBarItem: (UITabBarItem*)item;

@end
