//
//  HomeViewController.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/9.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+Ljj.h"
#import "LjjTitleButton.h"
#import "AFNetworking.h"
#import "AccountTool.h"
#import "Account.h"
#import "UIImageView+WebCache.h"
#import "Statuse.h"
#import "User.h"
#import "MJExtension.h"

#define kTitleButtonUpTag -1
#define kTitleButtonDownTag 0

@interface HomeViewController ()

@property (nonatomic, strong) NSArray* statuses;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏内容
    [self setupNavBar];
    // 加载微博数据
    [self setupStatusData];
}

// 设置导航栏内容
- (void)setupNavBar {
    // 添加左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem  itemWithImageName:@"navigationbar_friendsearch" highlightedImageName:@"navigationbar_friendsearch_highlighted" action:@selector(clickFriendSearch) target: self];
    // 添加右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem  itemWithImageName:@"navigationbar_pop" highlightedImageName:@"navigationbar_pop_highlighted" action:@selector(clickPop) target:self];
    // 添加中间按钮
    LjjTitleButton* btn = [[LjjTitleButton alloc] init];
    btn.frame = CGRectMake(0, 0, 130, 40);
    [btn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [btn setTitle:@"Julie_Jing" forState:UIControlStateNormal];
    btn.tag = kTitleButtonDownTag;
    self.navigationItem.titleView = btn;
    // 监听按钮
    [btn addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
}

// 加载微博数据
- (void)setupStatusData {
    // AFNetworking/AFN
    // 创建请求管理类
    AFHTTPRequestOperationManager* mgr = [AFHTTPRequestOperationManager manager];
    
    // 封装请求参数
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [AccountTool account].access_token;
    //params[@"count"] = @2;

    // 发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        NSLog(@"请求成功：%@",responseObject);
        NSArray* statuses = responseObject[@"statuses"];
//        NSMutableArray* statuse_temp = [NSMutableArray array];
//        for (NSDictionary* dict in statuses) {
//            Statuse* statuse = [Statuse objectWithKeyValues:dict];
//            [statuse_temp addObject:statuse];
//        }
//        // 获取微博数据
//        self.statuses = statuse_temp;
        self.statuses = [Statuse objectArrayWithKeyValuesArray:statuses];
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败：%@",error);
    }];
}

// 快速创建一个显示图片的barButtonItem
- (UIBarButtonItem*)barButtonItemInitWithImageName: (NSString*)imageName action: (SEL)action {
    // 创建按钮并设置属性
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    CGSize btnSize = [btn currentBackgroundImage].size;
    btn.bounds = CGRectMake(0, 0, btnSize.width, btnSize.height);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加进item中并返回
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

- (void)clickFriendSearch {
    NSLog(@"点击了搜索朋友按钮");
}

- (void)clickPop {
   NSLog(@"点击了Pop按钮");
}

- (void)clickTitle: (LjjTitleButton*)titleBtn {
    [titleBtn setImage:titleBtn.tag==kTitleButtonDownTag? [UIImage imageWithName:@"navigationbar_arrow_up"] : [UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    titleBtn.tag = titleBtn.tag==kTitleButtonDownTag? kTitleButtonUpTag : kTitleButtonDownTag;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    // 显示微博内容
    Statuse* statuse = self.statuses[indexPath.row];
    cell.textLabel.text = statuse.text;
    // 显示微博创建者
    User* user = statuse.user;
    cell.detailTextLabel.text = user.name;
    // 加载微博头像
    NSString* imageUrl = user.profile_image_url;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageWithName:@"tabbar_compose_button"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // push进去新控制器
    UIViewController* vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
