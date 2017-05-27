//
//  MyWalletView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包==============================================

#import "MyWalletView.h"
#import "Wallet.h"
@implementation MyWalletView
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
    //钱标识
    self.moneyLogoLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:32 text:@"￥"];
    [self addSubview:self.moneyLogoLable];
    [self.moneyLogoLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(102));
        make.left.equalTo(self.left).equalTo(W(107));
    }];
    
    //钱标签
    self.moneyLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:42 text:@"88.00"];
    [self addSubview:self.moneyLable];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(102));
        make.left.equalTo(self.moneyLogoLable.right).offset(W(5));
//        make.right.equalTo(self.right).equalTo(W(-119));
        
    }];
    
    //账户可用余额
    UILabel * remainLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:11 text:@"账户可用余额"];
    [self addSubview:remainLable];
    [remainLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyLable.bottom).offset(H(1));
        make.left.equalTo(self.moneyLogoLable.right).offset(W(10));
    }];
    
    //月度统计
    self.statisticsView = [[Wallet alloc]init];
    self.statisticsView.nameLable.text = @"月度统计";
    UITapGestureRecognizer * statisticsTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(statisticsTap)];
    [self.statisticsView addGestureRecognizer:statisticsTap];
    [self addSubview:self.statisticsView];
    [self.statisticsView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(-H(189-64));
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //交易明细
    self.detailView = [[Wallet alloc]init];
    self.detailView.nameLable.text = @"交易明细";
    UITapGestureRecognizer * detailTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detailTap)];
    [self.detailView addGestureRecognizer:detailTap];
    [self addSubview:self.detailView];
    [self.detailView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.statisticsView.top);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //充值
    self.rechargeView = [[Wallet alloc]init];
    self.rechargeView.nameLable.text = @"充值";
    UITapGestureRecognizer * rechargeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rechargeTap)];
    [self.rechargeView addGestureRecognizer:rechargeTap];
    [self addSubview:self.rechargeView];
    [self.rechargeView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.detailView.top);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
}

//月度统计点击事件
-(void)statisticsTap
{
    if ([self.delegate respondsToSelector:@selector(statisticsClick)]) {
        [self.delegate statisticsClick];
    }
}

//交易明细点击事件
-(void)detailTap
{
    if ([self.delegate respondsToSelector:@selector(detailClick)]) {
        [self.delegate detailClick];
    }
}

//充值
-(void)rechargeTap
{
    if ([self.delegate respondsToSelector:@selector(rechargeClick)]) {
        [self.delegate rechargeClick];
    }
}







@end
