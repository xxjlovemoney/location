//
//  SideslipView.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面内容封装视图=======================================

#import "SideslipView.h"

@implementation SideslipView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}



-(void)setUpUI
{
    
    self.titleButton  = [[UIButton alloc]init];
    [self.titleButton setTitle:nil forState:UIControlStateNormal];
    self.titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.titleButton];
    [self.titleButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(W(-15));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(150), H(40)));
    }];
    
    
    UIImageView * line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self).offset(W(-18));
        make.size.equalTo(CGSizeMake(W(250), H(1)));
    }];
}







@end
