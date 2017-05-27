//
//  UIBarButtonItem+XXJNavItem.m
//  ssdas4ios
//
//  Created by gagakj on 2017/4/28.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "UIBarButtonItem+XXJNavItem.h"

@implementation UIBarButtonItem (XXJNavItem)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -9, 0, 0);
//    [leftBtn setFrame:CGRectMake(-11, 0, 44, 44)];
    UIView * containView = [[UIView alloc]initWithFrame:leftBtn.bounds];
//    containView.backgroundColor = [UIColor yellowColor];
    [containView addSubview:leftBtn];
    return [[UIBarButtonItem alloc]initWithCustomView:containView];
}

+(UIBarButtonItem *)RightitemWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 9, 0, 0);
//    [leftBtn setFrame:CGRectMake(11, 0, 44, 44)];
    UIView * containView = [[UIView alloc]initWithFrame:leftBtn.bounds];
//    containView.backgroundColor = [UIColor yellowColor];
    [containView addSubview:leftBtn];
    return [[UIBarButtonItem alloc]initWithCustomView:containView];
}
@end
