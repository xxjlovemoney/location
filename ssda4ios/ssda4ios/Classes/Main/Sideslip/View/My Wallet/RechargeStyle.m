//
//  RechargeStyle.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包 -> 充值方式内容封装============================

#import "RechargeStyle.h"

@implementation RechargeStyle
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
    
    //支付图片
    UIImageView * payImageView = [[UIImageView alloc]initWithImage:self.payImage];
    [self addSubview:payImageView];
    [payImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(38));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    
    //支付标签
    self.payLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:@"支付宝"];
    [self addSubview:self.payLable];
    [self.payLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(payImageView.right).offset(W(25));
        make.centerY.equalTo(self);
    }];
    
    self.chooseBtn = [[UIButton alloc]init];
    [self.chooseBtn setImage:[UIImage imageNamed:@"tick"] forState:UIControlStateSelected];
    [self addSubview:self.chooseBtn];
    [self.chooseBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-28));
        make.centerY.equalTo(self);
    }];
    
    
}


@end
