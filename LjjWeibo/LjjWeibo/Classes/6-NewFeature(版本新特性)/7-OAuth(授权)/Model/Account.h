//
//  Account.h
//  LjjWeibo
//
//  Created by liujingjing on 15/8/3.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString* access_token;
@property (nonatomic, assign) long long expires_in;
@property (nonatomic, assign) long long remind_in;
@property (nonatomic, assign) long long uid;

+ (instancetype)accountWithDict: (NSDictionary*)dict;
- (instancetype)initWithDict: (NSDictionary*)dict;

@end
