//
//  NewFeatureViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/26.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "NewFeatureViewController.h"
#define kImageCount 3

@interface NewFeatureViewController ()

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加scrollView
    UIScrollView* newFeatureScrollView = [[UIScrollView alloc] init];
    // 设置背景颜色
    [newFeatureScrollView setBackgroundColor:[UIColor brownColor]];
    newFeatureScrollView.frame = self.view.bounds;
    [self.view addSubview:newFeatureScrollView];
    
    // 添加imageView
    CGFloat imageWidth = newFeatureScrollView.frame.size.width;
    CGFloat imageHeight = newFeatureScrollView.frame.size.height;
    for (int index = 0; index < kImageCount; index++) {
        UIImageView* imageView = [[UIImageView alloc] init];
        [imageView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"new_feature_%d",index + 1]]];
        imageView.frame = CGRectMake(index * imageWidth, 0, imageWidth, imageHeight);
        [newFeatureScrollView addSubview:imageView];
    }
    
    // scrollView滚动内容尺寸
    newFeatureScrollView.contentSize = CGSizeMake(imageWidth * kImageCount, 0);
    newFeatureScrollView.showsHorizontalScrollIndicator = NO;
    newFeatureScrollView.pagingEnabled = YES;
}


@end
