//
//  NewFeatureViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/26.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "LjjTabBarViewController.h"
#define kImageCount 3

@interface NewFeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl* pageControl;

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加scrollView
    [self setUpScrollView];
    // 添加pageControll
    [self setUpPageControll];
}

// 添加scrollView
- (void)setUpScrollView {
    UIScrollView* newFeatureScrollView = [[UIScrollView alloc] init];
    // 设置背景颜色
    [newFeatureScrollView setBackgroundColor:[UIColor brownColor]];
    newFeatureScrollView.frame = self.view.bounds;
    [self.view addSubview:newFeatureScrollView];
    newFeatureScrollView.delegate = self;
    
    // 添加imageView
    CGFloat imageWidth = newFeatureScrollView.frame.size.width;
    CGFloat imageHeight = newFeatureScrollView.frame.size.height;
    for (int index = 0; index < kImageCount; index++) {
        UIImageView* imageView = [[UIImageView alloc] init];
        [imageView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"new_feature_%d",index + 1]]];
        imageView.frame = CGRectMake(index * imageWidth, 0, imageWidth, imageHeight);
        [newFeatureScrollView addSubview:imageView];
        if (index == kImageCount-1) {
            [self setUpLastImageView:imageView];
        }
    }
    
    // scrollView滚动内容尺寸
    newFeatureScrollView.contentSize = CGSizeMake(imageWidth * kImageCount, 0);
    newFeatureScrollView.showsHorizontalScrollIndicator = NO;
    newFeatureScrollView.pagingEnabled = YES;
}

// 添加pageControll
- (void)setUpPageControll {
    UIPageControl* pageControll = [[UIPageControl alloc] init];
    _pageControl = pageControll;
    // 设置
    pageControll.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.9);
    pageControll.bounds = CGRectMake(0, 0, 100, 30);
    pageControll.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageControll.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControll.numberOfPages = kImageCount;
    pageControll.userInteractionEnabled = NO;
    // 添加
    [self.view addSubview:pageControll];
}

// 设置最后一张图
- (void)setUpLastImageView: (UIImageView*)imageView {
    imageView.userInteractionEnabled = YES;
    
    // 添加开始微博按钮
    UIButton* button = [[UIButton alloc] init];
    // 设置背景
    [button setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    // 设置frame
    button.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.6);
    button.bounds = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    // 设置文字
    [button setTitle:@"开始微博" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 监听
    [button addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:button];
    
    // 添加checkBox
    UIButton* checkBoxBtn = [[UIButton alloc] init];
    // 设置frame
    checkBoxBtn.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    checkBoxBtn.bounds = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    // 文字
    [checkBoxBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkBoxBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkBoxBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    // 图片
    [checkBoxBtn setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateNormal];
    [checkBoxBtn setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateSelected];
    // 监听
    [checkBoxBtn addTarget:self action:@selector(clickCheckBox:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:checkBoxBtn];
}

// 监听checkBox按钮
- (void)clickCheckBox: (UIButton*)checkBoxBtn {
    checkBoxBtn.selected = !checkBoxBtn.selected;
}

// 监听开始按钮
- (void)clickStartBtn {
    self.view.window.rootViewController = [[LjjTabBarViewController alloc] init];
}

#pragma - mark UIScrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 设置pageControl页码
    _pageControl.currentPage = (scrollView.contentOffset.x + self.view.frame.size.width*0.5) /self.view.frame.size.width;
}



@end
