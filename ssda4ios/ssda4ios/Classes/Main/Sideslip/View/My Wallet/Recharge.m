//
//  Recharge.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包 -> 充值内容封装============================

#import "Recharge.h"

@implementation Recharge
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    //
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    //
    self.titleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:nil];
    [self addSubview:self.titleLable];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    self.contentLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:nil];
    [self addSubview:self.contentLable];
    [self.contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLable.right).offset(W(10));
        make.centerY.equalTo(self);
    }];
}
@end
