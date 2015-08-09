//
//  User.h
//  LjjWeibo
//
//  Created by liujingjing on 15/8/9.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
     "user": {
         "id": 1404376560,
         "name": "zaku",
         "profile_image_url": "http://tp1.sinaimg.cn/1404376560/50/0/1",
     }
 */

@interface User : NSObject

/**
 * 用户ID
 */
@property (nonatomic, copy) NSString* idstr;
/**
 * 用户昵称
 */
@property (nonatomic, copy) NSString* name;
/**
 * 用户头像
 */
@property (nonatomic, copy) NSString* profile_image_url;
//
//+ (instancetype)userWithDict: (NSDictionary*)dict;
//- (instancetype)initWithDict: (NSDictionary*)dict;

@end
