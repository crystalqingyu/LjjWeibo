//
//  OAuthViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/7/3.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "OAuthViewController.h"
#import "AFNetworking.h"

@interface OAuthViewController () <UIWebViewDelegate>

@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载webView
    UIWebView* webView = [[UIWebView alloc] init];
    webView.frame = self.view.frame;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSURL* url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=315544151&redirect_uri=http://www.baidu.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL* url = request.URL;
    NSString* urlStr = url.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.location!=NSNotFound) {
        NSLog(@"url======%@,code======%@",urlStr,[urlStr substringFromIndex:range.location + range.length]);
    }
    return YES;
}


@end
