//
//  LjjTabBarButton.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/12.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTabBarButton.h"

#define LjjTabBarButtonImageRatio 0.6

@implementation LjjTabBarButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
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
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

- (void)setHighlighted:(BOOL)highlighted {
    highlighted = NO;
}

@end
