//
//  UIImage+XXJImageColor.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "UIImage+XXJImageColor.h"

@implementation UIImage (XXJImageColor)

//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
