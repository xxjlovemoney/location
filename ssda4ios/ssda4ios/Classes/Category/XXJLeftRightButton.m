//
//  XXJLeftRightButton.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "XXJLeftRightButton.h"

@implementation XXJLeftRightButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleLabel.xxj_width, 0, -self.titleLabel.xxj_width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.xxj_width, 0, self.imageView.xxj_width);
}



@end
