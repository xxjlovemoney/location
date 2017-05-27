//
//  Wallet.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包内容封装=========================================

#import "Wallet.h"

@implementation Wallet
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
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //充值
    self.nameLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:@"充值"];
    [self addSubview:self.nameLable];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //更过按钮
    self.moreBtn = [[UIButton alloc]init];
    [self.moreBtn setBackgroundImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    [self addSubview:self.moreBtn];
    [self.moreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-W(23));
        make.centerY.equalTo(self);
    }];
}

@end
