//
//  LjjTabBarButton.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/12.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTabBarButton.h"
#import "LjjBadgeButton.h"

#define LjjTabBarButtonImageRatio 0.6
#define LjjTabBarButtonTitleColorNormal (IOS7 ? [UIColor colorWithRed:138.0/255 green:139.0/255 blue:138.0/255 alpha:1] : [UIColor whiteColor])
#define LjjTabBarButtonTitleColorSelected [UIColor colorWithRed:240.0/255 green:124.0/255 blue:0/255 alpha:1]

@interface LjjTabBarButton ()

// 提醒数字
@property (nonatomic, strong) LjjBadgeButton* badgeButton;

@end

@implementation LjjTabBarButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!IOS7) {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        // Button的图片和文字居中显示
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 文字颜色设置
        [self setTitleColor:LjjTabBarButtonTitleColorNormal forState:UIControlStateNormal];
        [self setTitleColor:LjjTabBarButtonTitleColorSelected forState:UIControlStateSelected];
        // 提醒数字按钮设置
        LjjBadgeButton* badgeButton = [[LjjBadgeButton alloc] init];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        _badgeButton = badgeButton;
        [self addSubview:badgeButton];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height * LjjTabBarButtonImageRatio;
    CGRect imageFrame = CGRectMake(x, y, w, h);
    return imageFrame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = self.frame.size.height * LjjTabBarButtonImageRatio;
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height * (1-LjjTabBarButtonImageRatio);
    CGRect titleFrame = CGRectMake(x, y, w, h);
    return titleFrame;
}

- (void)setItem: (UITabBarItem*)item {
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    // kvo监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字按钮
    self.badgeButton.badgeValue = self.item.badgeValue;
    // 设置提醒数字按钮位置
    CGFloat y = 2;
    CGFloat x = self.frame.size.width - self.badgeButton.frame.size.width;
    CGRect frame = self.badgeButton.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.badgeButton.frame = frame;
}

- (void)dealloc {
    // 释放按钮对item属性的监听
    [self.item removeObserver:self forKeyPath:@"badgeValue" context:nil];
    [self.item removeObserver:self forKeyPath:@"title" context:nil];
    [self.item removeObserver:self forKeyPath:@"image" context:nil];
    [self.item removeObserver:self forKeyPath:@"selectedImage" context:nil];
}

- (void)setHighlighted:(BOOL)highlighted {
    highlighted = NO;
}

@end
