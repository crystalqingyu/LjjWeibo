//
//  AccountTool.h
//  LjjWeibo
//
//  Created by liujingjing on 15/8/4.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//  账号管理工具类

#import <Foundation/Foundation.h>

@class Account;

@interface AccountTool : NSObject

// 存储账号信息
+ (void)saveAccount: (Account*)account;
// 获取当前账号信息
+ (Account*)account;

@end
