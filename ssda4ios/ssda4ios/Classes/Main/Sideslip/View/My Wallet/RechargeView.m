//
//  RechargeView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包 -> 充值=======================================

#import "RechargeView.h"
#import "Recharge.h"
#import "RechargeStyle.h"
@implementation RechargeView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        //添加手势
        [self addGesTap];
    }
    return self;
}

#pragma mark -- 添加手势
-(void)addGesTap
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self addGestureRecognizer:tap];
}

-(void)tapClick
{
    [self.moneyField resignFirstResponder];
}
#pragma mark -- 界面初始化
-(void)setUpUI
{
    //充值账户
    self.rechargeView = [[Recharge alloc]init];
    self.rechargeView.titleLable.text = @"充值账户";
    self.rechargeView.contentLable.text = @"125698745";
    [self addSubview:self.rechargeView];
    [self.rechargeView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //账户余额
    self.RemainView = [[Recharge alloc]init];
    self.RemainView.titleLable.text = @"账户余额";
    self.RemainView.contentLable.text = @"88.00元";
    [self addSubview:self.RemainView];
    [self.RemainView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rechargeView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    
    //充值金额
    self.moneyView = [[Recharge alloc]init];
    self.moneyView.titleLable.text = @"充值金额";
    self.moneyView.contentLable = nil;
    [self addSubview:self.moneyView];
    [self.moneyView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.RemainView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //请输入充值金额
    self.moneyField = [[UITextField alloc]init];
    self.moneyField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入充值金额" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    [self.moneyField setTextColor:[UIColor whiteColor]];
    self.moneyField.borderStyle = UITextBorderStyleNone ;
    self.moneyField.font = [UIFont systemFontOfSize:16];
    [self.moneyView addSubview: self.moneyField];
    [self.moneyField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.moneyView.titleLable.right).offset(W(10));
        make.centerY.equalTo(self.moneyView);
    }];
    
    
    //下划线
    UIImageView * bottomImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:bottomImageViewLine];
    [bottomImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyView.bottom);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //充值方式
    UILabel * styleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:@"充值方式"];
    [self addSubview:styleLable];
    [styleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomImageViewLine.bottom).offset(H(80));
        make.left.equalTo(self.left).offset(W(33));
    }];
    
    
    //支付宝
    self.alipayView = [[RechargeStyle alloc]init];
    self.alipayView.payImage = [UIImage imageNamed:@"Alipay"];
    self.alipayView.chooseBtn.selected = YES;
    UITapGestureRecognizer * alipayTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alipayTapGes)];
    [self.alipayView addGestureRecognizer:alipayTap];
    [self addSubview:self.alipayView];
    [self.alipayView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(styleLable.bottom).offset(H(10));
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    //微信支付
    self.wechatView = [[RechargeStyle alloc]init];
    self.wechatView.payImage = [UIImage imageNamed:@"wechatpay"];
    self.wechatView.payLable.text = @"微信支付";
    UITapGestureRecognizer * wechatTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wechatTapGes)];
    [self.wechatView addGestureRecognizer:wechatTap];
    [self addSubview:self.wechatView];
    [self.wechatView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.alipayView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    //下一步
    UIButton * nextStepButton = [[UIButton alloc]init];
    [nextStepButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextStepButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:nextStepButton];
    [nextStepButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.bottom).offset(H(-52));
    }];
    
}

//支付宝点击事件
-(void)alipayTapGes
{
    self.alipayView.chooseBtn.selected = YES;
    self.wechatView.chooseBtn.selected = NO;
}

//微信支付点击事件
-(void)wechatTapGes
{
    self.wechatView.chooseBtn.selected = YES;
    self.alipayView.chooseBtn.selected = NO;
}














@end
