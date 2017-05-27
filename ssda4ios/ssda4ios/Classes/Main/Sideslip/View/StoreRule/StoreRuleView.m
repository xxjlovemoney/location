//
//  StoreRuleView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/13.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "StoreRuleView.h"
#import "Wallet.h"
@implementation StoreRuleView

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
    //取消订单规则
    Wallet * cancelRule = [[Wallet alloc]init];
    cancelRule.nameLable.text = @"一. 取消订单规则";
    cancelRule.nameLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:cancelRule];
    [cancelRule makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //发单不规范
    Wallet * billRule = [[Wallet alloc]init];
    billRule.nameLable.text = @"二. 发单不规范";
    billRule.nameLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:billRule];
    [billRule makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cancelRule.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];

    //补单及刷单
    Wallet * repairBill = [[Wallet alloc]init];
    repairBill.nameLable.text = @"三. 补单及刷单";
    repairBill.nameLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:repairBill];
    [repairBill makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(billRule.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //账户余额
    Wallet * spareMoney = [[Wallet alloc]init];
    spareMoney.nameLable.text = @"四. 账户余额";
    spareMoney.nameLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:spareMoney];
    [spareMoney makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(repairBill.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //其他恶劣行为
    Wallet * harmfulAction = [[Wallet alloc]init];
    harmfulAction.nameLable.text = @"五. 其他恶劣行为";
    harmfulAction.nameLable.font = [UIFont systemFontOfSize:14];
    [self addSubview:harmfulAction];
    [harmfulAction makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(spareMoney.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(harmfulAction.bottom);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    
}

@end
