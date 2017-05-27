//
//  BizInfoButton.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "BizInfoButton.h"

@implementation BizInfoButton

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
    self.imageView.xxj_y = H(21);
    
    self.imageView.xxj_centerX = self.xxj_width * 0.5;
    
    self.titleLabel.xxj_y = self.imageView.xxj_height+H(30);
    
    [self.titleLabel sizeToFit];
    
    self.titleLabel.xxj_centerX = self.xxj_width * 0.5;
    
    
}
@end
