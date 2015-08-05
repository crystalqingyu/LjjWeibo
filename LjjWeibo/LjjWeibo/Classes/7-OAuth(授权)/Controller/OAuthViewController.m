//
//  OAuthViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/7/3.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "OAuthViewController.h"
#import "AFNetworking.h"
#import "Account.h"
#import "WeiboTool.h"
#import "AccountTool.h"
#import "MBProgressHUD+MJ.h"

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

#pragma mark - webview代理方法
// webView开始发送请求时候调用
- (void)webViewDidStartLoad:(UIWebView *)webView {
    // 显示登陆框
    [MBProgressHUD showMessage:@"姐正在帮你加载中..."];
}
// webView请求完毕调用
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 隐藏登陆框
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // 隐藏登陆框
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL* url = request.URL;
    NSString* urlStr = url.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.location!=NSNotFound) {
        NSString* code = [urlStr substringFromIndex:range.location + range.length];
        NSLog(@"url======%@,code======%@",urlStr,code);
        // 用code换取accessToken
        [self accessTokenWithCode: code];
    }
    return YES;
}

/*
**发送POST请求给新浪，换取access token
 必选 	类型及范围 	说明
 client_id 	true 	string 	申请应用时分配的AppKey。
 client_secret 	true 	string 	申请应用时分配的AppSecret。
 grant_type 	true 	string 	请求的类型，填写authorization_code
 
 
 grant_type为authorization_code时
 
 必选 	类型及范围 	说明
 code 	true 	string 	调用authorize获得的code值。
 redirect_uri 	true 	string 	回调地址，需需与注册应用里的回调地址一致。
*/

- (void)accessTokenWithCode: (NSString*)code {
    // AFNetworking/AFN
    // 创建请求管理类
    AFHTTPRequestOperationManager* mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 封装请求参数
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"315544151";
    params[@"client_secret"] = @"cef5bb7f882888009c4f7cb80b17a683";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";
    // 发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        // 拿到用户-应用的accessToken
        NSString* accessToken = responseObject[@"access_token"];
        NSLog(@"%@, %@",responseObject, accessToken);
        // 归档，存储accessToken信息
        // 字典转为模型
        Account* account = [Account accountWithDict:responseObject];
        // 存储模型数据
        [AccountTool saveAccount:account];
        // 选择控制器
        [WeiboTool chooseRootController];
        // 隐藏登陆框
        [MBProgressHUD hideHUD];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 隐藏登陆框
        [MBProgressHUD hideHUD];
        NSLog(@"请求失败：%@",error);
    }];
}

@end
