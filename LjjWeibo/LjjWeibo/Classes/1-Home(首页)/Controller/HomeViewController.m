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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem  itemWithImageName:@"navigationbar_friendsearch" highlightedImageName:@"navigationbar_friendsearch_highlighted" action:@selector(clickFriendSearch) target: self];
    
    // 添加右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem  itemWithImageName:@"navigationbar_pop" highlightedImageName:@"navigationbar_pop_highlighted" action:@selector(clickPop) target:self];
    
    // 添加中间按钮
    LjjTitleButton* btn = [[LjjTitleButton alloc] init];
    self.navigationItem.titleView = btn;
    btn.frame = CGRectMake(0, 0, 130, 40);
    [btn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [btn setTitle:@"Julie_Jing" forState:UIControlStateNormal];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"hahah";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // push进去新控制器
    UIViewController* vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
