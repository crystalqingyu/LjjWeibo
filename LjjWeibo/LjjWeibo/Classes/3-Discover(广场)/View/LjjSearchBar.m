//
//  LjjSearchBar.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/24.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "LjjSearchBar.h"

@interface LjjSearchBar ()

@end

@implementation LjjSearchBar

+ (id)searchBar {
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        // 背景
        self.background = [UIImage stretchableImageWithName:@"searchbar_textfield_background"];
        // 左边的放大镜
        UIImageView* leftView = [[UIImageView alloc] initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        // 字体
        self.font = [UIFont systemFontOfSize:14];
        // placeholder
        NSMutableDictionary* attrDict = [NSMutableDictionary dictionary];
        attrDict[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索" attributes:attrDict];
        // 右边的小叉叉
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 左边放大镜frame
    self.leftView.frame = CGRectMake(0, 0, self.leftView.frame.size.width + 10, self.frame.size.height);
}

@end
