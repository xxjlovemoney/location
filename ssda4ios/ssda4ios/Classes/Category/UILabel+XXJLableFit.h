//
//  UILabel+XXJLableFit.h
//  ssda4ios
//
//  Created by 许小军 on 2017/4/30.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XXJLableFit)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

+ (UILabel *)lableWithTextColor:(UIColor *)textColor textFont:(CGFloat)font text:(NSString *)text;
@end
