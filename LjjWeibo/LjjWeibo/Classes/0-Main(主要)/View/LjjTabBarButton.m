//
//  LjjTabBarButton.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/12.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTabBarButton.h"

#define LjjTabBarButtonImageRatio 0.6
#define LjjTabBarButtonTitleColorNormal (IOS7 ? [UIColor colorWithRed:138.0/255 green:139.0/255 blue:138.0/255 alpha:1] : [UIColor whiteColor])
#define LjjTabBarButtonTitleColorSelected [UIColor colorWithRed:240.0/255 green:124.0/255 blue:0/255 alpha:1]

@interface LjjTabBarButton ()

@property (nonatomic, strong) UIButton* badgeButton;

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
        // UIBadgeButton设置
        UIButton* badgeButton = [[UIButton alloc] init];
        [badgeButton setBackgroundImage:[UIImage stretchableImageWithName:@"main_badge"] forState:UIControlStateNormal];
        badgeButton.titleLabel.font = [UIFont systemFontOfSize:10];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        badgeButton.hidden = YES;
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

- (void)setHighlighted:(BOOL)highlighted {
    highlighted = NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    if (self.item.badgeValue!=nil) {
        self.badgeButton.hidden = NO;
        CGFloat y = 2;
        CGFloat w = self.badgeButton.currentBackgroundImage.size.width;
        // 字数过长增加宽度
        if (self.item.badgeValue.length > 2) {
            CGSize size = [self.item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
            w = size.width;
        }
        CGFloat h = self.badgeButton.currentBackgroundImage.size.height;
        CGFloat x = self.frame.size.width - w;
        self.badgeButton.frame = CGRectMake(x,y,w,h);
        [self.badgeButton setTitle:self.item.badgeValue forState:UIControlStateNormal];
    } else {
        self.badgeButton.hidden = YES;
    }
}

@end
