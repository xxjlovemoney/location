//
//  UIButton+OrderInfoButton.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "UIButton+OrderInfoButton.h"

@implementation UIButton (OrderInfoButton)

+(UIButton *)buttonWithTitle:(NSString *) title NormalbackImageTitle:(NSString *)normalImageTitle SelectedbackImageTitle:(NSString *)selectedImageTitle
{
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:title forState:UIControlStateNormal];
    //按钮标题颜色
    [button setTitleColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.6] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] forState:UIControlStateSelected];
    //按钮背景颜色
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.3]] forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setBackgroundImage:[UIImage imageNamed:normalImageTitle] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImageTitle] forState:UIControlStateSelected];
    [button sizeToFit];
    return button;
}

@end
