//
//  LjjBadgeButton.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/16.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjBadgeButton.h"

@implementation LjjBadgeButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage stretchableImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.hidden = YES;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = [badgeValue copy];
    if (self.badgeValue!=nil) {
        self.hidden = NO;
        // 设置按钮frame
        CGFloat w = self.currentBackgroundImage.size.width;
        // 字数过长增加宽度
        if (self.badgeValue.length > 2) {
            CGSize size = [self.badgeValue sizeWithFont:self.titleLabel.font];
            w = size.width + 10;
        }
        CGFloat h = self.currentBackgroundImage.size.height;
        CGRect frame = self.frame;
        frame.size.width = w;
        frame.size.height = h;
        self.frame = frame;
        // 设置按钮文字
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
    } else {
        self.hidden = YES;
    }
}

@end
