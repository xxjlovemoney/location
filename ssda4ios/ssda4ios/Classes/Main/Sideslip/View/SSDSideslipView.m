//
//  SSDSideslipView.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面=======================================

#import "SSDSideslipView.h"
#import "SideslipView.h"

@interface SSDSideslipView ()
@property(nonatomic,weak)SideslipView * slipView;
@end
@implementation SSDSideslipView


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
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu-BG"]];
    [self addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    UIImageView * iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icons"]];
    [self addSubview:iconImageView];
    [iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(18));
        make.top.equalTo(self).offset(23);
        make.size.equalTo(CGSizeMake(W(70), H(70)));
        
    }];
    
    
    UILabel * nameLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:17 text:@"俏西北美食中心"];
    [self addSubview:nameLable];
    [nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(45));
        make.left.equalTo(self).offset(W(95));
        
    }];
    
    
    UILabel * phoneLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:14 text:@"18788888888"];
    [self addSubview:phoneLable];
    [phoneLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLable.bottom).offset(H(7));
        make.left.equalTo(self).offset(W(95));
        
    }];
    
    //认证
    UIButton * approveButton = [[UIButton alloc]init];
    [approveButton setBackgroundImage:[UIImage imageNamed:@"approved label"] forState:UIControlStateNormal];
    [self addSubview:approveButton];
    [approveButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLable.right).offset(W(+3));
        make.centerY.equalTo(phoneLable);
    }];
    
    //更多按钮
    UIButton *  moreButton = [[UIButton alloc]init];
    [moreButton addTarget:self action:@selector(moreBtn) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setBackgroundImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    [self addSubview:moreButton];
    [moreButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLable.bottom);
        if (WIDTH == 320) {
            make.left.equalTo(approveButton.right).offset(W(-5));
        }else if (WIDTH == 375)
        {
            make.left.equalTo(approveButton.right);
        }else if (WIDTH == 414)
        {
            make.left.equalTo(approveButton.right).offset(W(10));
        }
    }];
    
    //下划线
    UIImageView * topImageViewline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewline];
    [topImageViewline makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLable.bottom).offset(H(32));
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(W(250), H(1)));
    }];
    
    //我的订单
    self.myBillView= [[SideslipView alloc]init];
    [self.myBillView.titleButton setTitle:@"我的订单" forState:UIControlStateNormal];
    [self.myBillView.titleButton addTarget:self action:@selector(orderBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.myBillView];
    [self.myBillView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewline.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //我的钱包
    self.walletView= [[SideslipView alloc]init];
    [self.walletView.titleButton setTitle:@"我的钱包" forState:UIControlStateNormal];
    [self.walletView.titleButton addTarget:self action:@selector(walletBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.walletView];
    [self.walletView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.myBillView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //联系客服
    self.contactView= [[SideslipView alloc]init];
    [self.contactView.titleButton setTitle:@"联系客服" forState:UIControlStateNormal];
    [self addSubview:self.contactView];
    [self.contactView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.walletView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //举报投降
    self.reportView= [[SideslipView alloc]init];
    [self.reportView.titleButton setTitle:@"投诉举报" forState:UIControlStateNormal];
    [self.reportView.titleButton addTarget:self action:@selector(reportBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.reportView];
    [self.reportView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contactView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //商家认证
    self.bizInfoView= [[SideslipView alloc]init];
    [self.bizInfoView.titleButton setTitle:@"商家认证" forState:UIControlStateNormal];
    [self.bizInfoView.titleButton addTarget:self action:@selector(storeApproveBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bizInfoView];
    [self.bizInfoView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reportView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //商家管理规则
    self.rollView= [[SideslipView alloc]init];
    [self.rollView.titleButton setTitle:@"商家管理规则" forState:UIControlStateNormal];
    [self.rollView.titleButton addTarget:self action:@selector(storeRuleBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.rollView];
    [self.rollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bizInfoView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
    //设置
    self.settingView= [[SideslipView alloc]init];
    [self.settingView.titleButton setTitle:@"设置" forState:UIControlStateNormal];
    [self.settingView.titleButton addTarget:self action:@selector(settingBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.settingView];
    [self.settingView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rollView.bottom);
        make.centerX.equalTo(self.centerX).offset(W(15));
        make.height.equalTo(H(51));
        make.width.equalTo(self);
    }];
    
}

#pragma mark -- 顶部更多按钮点击
//顶部更多按钮点击
-(void)moreBtn
{
    if ([self.delegate respondsToSelector:@selector(moreBtnClick)]) {
        [self.delegate moreBtnClick];
    }
    
}
#pragma mark -- 商家认证按钮点击
-(void)storeApproveBtn
{
    if ([self.delegate respondsToSelector:@selector(storeApproveBtnClick)]) {
        [self.delegate storeApproveBtnClick];
    }
}

#pragma mark -- 投诉举报
-(void)reportBtn
{
    if ([self.delegate respondsToSelector:@selector(reportBtnClick)]) {
        [self.delegate reportBtnClick];
    }
}


#pragma mark -- 设置
-(void)settingBtn
{
    if ([self.delegate respondsToSelector:@selector(settingBtnClick)]) {
        [self.delegate settingBtnClick];
    }
}

#pragma mark -- 我的钱包
-(void)walletBtn
{
    if ([self.delegate respondsToSelector:@selector(walletBtnClick)]) {
        [self.delegate walletBtnClick];
    }
}

#pragma mark -- 我的订单
-(void)orderBtn
{
    if ([self.delegate respondsToSelector:@selector(orderBtnClick)]) {
        [self.delegate orderBtnClick];
    }
}

#pragma mark -- 商家管理规则
-(void)storeRuleBtn
{
    if ([self.delegate respondsToSelector:@selector(storeRuleBtnClick)]) {
        [self.delegate storeRuleBtnClick];
    }
}





@end
