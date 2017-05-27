//
//  XXJButton.m
//  ssdas4ios
//
//  Created by gagakj on 2017/4/27.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "XXJButton.h"

@implementation XXJButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textColor = [UIColor whiteColor];
        // 设置文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 设置图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return self;
}

-(void)layoutSubviews
{
     [super layoutSubviews];
    self.imageView.xxj_y = 0;
    
    self.imageView.xxj_centerX = self.xxj_width * 0.5;
   
    self.titleLabel.xxj_y = self.imageView.xxj_height + 3;
    
    [self.titleLabel sizeToFit];
    
    self.titleLabel.xxj_centerX = self.xxj_width * 0.5;
    
    
}

@end
