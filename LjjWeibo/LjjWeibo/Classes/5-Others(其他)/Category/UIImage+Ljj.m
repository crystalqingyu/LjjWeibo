//
//  UIImage+Ljj.m
//  LjjWeibo
//
//  Created by liujingjing on 15/6/11.
//  Copyright (c) 2015年 liujingjing. All rights reserved.
//

#import "UIImage+Ljj.h"

@implementation UIImage (Ljj)

+(UIImage*)imageWithName: (NSString*)imageName {
    if (IOS7) {
        NSString* newImageName = [imageName stringByAppendingString:@"_os7"];
        UIImage* image = [UIImage imageNamed:newImageName];
        if (image==nil) { // 可能会公用同一图片
            image = [UIImage imageNamed:imageName];
        }
        return image;
    }
    return [UIImage imageNamed:imageName];
}

+(UIImage*)stretchableImageWithName:(NSString *)imageName {
    UIImage* image = [self imageWithName:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:0.5];
}

@end
