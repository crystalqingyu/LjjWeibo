//
//  UIBarButtonItem+Ljj.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/24.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "UIBarButtonItem+Ljj.h"

@implementation UIBarButtonItem (Ljj)

// 快速创建一个显示图片的barButtonItem
+ (UIBarButtonItem*)itemWithImageName: (NSString*)imageName highlightedImageName:(NSString *)highlightedImageName action: (SEL)action target:(id)target {
    // 创建按钮并设置属性
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:highlightedImageName] forState:UIControlStateHighlighted];
    CGSize btnSize = [btn currentBackgroundImage].size;
    btn.bounds = CGRectMake(0, 0, btnSize.width, btnSize.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加进item中并返回
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

@end
