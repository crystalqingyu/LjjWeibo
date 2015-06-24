//
//  UIBarButtonItem+Ljj.h
//  LjjWeibo
//
//  Created by liujingjing on 15/6/24.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Ljj)

+ (UIBarButtonItem*)itemWithImageName: (NSString*)imageName highlightedImageName: (NSString*)highlightedImageName action: (SEL)action target: (id)target;

@end
