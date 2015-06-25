//
//  LjjTitleButton.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/25.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjTitleButton.h"

#define kImageViewWidth 30

@implementation LjjTitleButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 标题
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:22];
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        // 图片
        self.imageView.contentMode = UIViewContentModeCenter;
        // 背景
        [self setBackgroundImage:[UIImage stretchableImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        // 高亮不自动调整图标
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = 30;
    CGFloat x = contentRect.size.width - w;
    CGFloat y = 0;
    CGFloat h = contentRect.size.height;
    CGRect imageFrame = CGRectMake(x, y, w, h);
    return imageFrame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = contentRect.size.width - kImageViewWidth;
    CGFloat h = contentRect.size.height;
    CGRect titleFrame = CGRectMake(x, y, w, h);
    return titleFrame;
}

@end
