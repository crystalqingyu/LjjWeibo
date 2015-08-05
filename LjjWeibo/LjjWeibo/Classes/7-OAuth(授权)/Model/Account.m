//
//  Account.m
//  LjjWeibo
//
//  Created by liujingjing on 15/8/3.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//  账号模型，存储账号信息

#import "Account.h"

@implementation Account 

+ (instancetype)accountWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if ([super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

// 从文件读取数据存储到模型中
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeInt64ForKey:@"expires_in"];
        self.remind_in = [aDecoder decodeInt64ForKey:@"remind_in"];
        self.uid = [aDecoder decodeInt64ForKey:@"uid"];
        self.expires_time = [aDecoder decodeObjectForKey:@"expires_time"];
    }
    return self;
}
// 归档数据到文件中
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.expires_time forKey:@"expires_time"];
}

@end
