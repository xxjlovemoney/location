//
//  UIBarButtonItem+XXJNavItem.h
//  ssdas4ios
//
//  Created by gagakj on 2017/4/28.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XXJNavItem)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

+(UIBarButtonItem *)RightitemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
@end
