//
//  AccountTool.m
//  LjjWeibo
//
//  Created by liujingjing on 15/8/4.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "AccountTool.h"
#import "Account.h"

// 账号信息存取路径
#define accountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountTool

+ (void)saveAccount: (Account*)account {
    // 计算账号过期时间
    NSDate* now = [NSDate date];
    account.expires_time = [now dateByAddingTimeInterval:account.expires_in];
    // 存储模型数据
    [NSKeyedArchiver archiveRootObject:account toFile:accountPath];
}

+ (Account*)account {
    // 获取模型数据
    Account* account = [NSKeyedUnarchiver unarchiveObjectWithFile:accountPath];
    // 判断是否过期
    if ([[NSDate date] compare:account.expires_time] == NSOrderedAscending || [[NSDate date] compare:account.expires_time] == NSOrderedSame) { // 没过期
        NSLog(@"过期时间-----%@",account.expires_time);
        return account;
    } else { // 过期
        return nil;
    }
}

@end
