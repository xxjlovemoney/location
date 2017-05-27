//
//  OrderInfoView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=========================底部视图 -> 外卖录单 -> 手动外卖录单 ->订单信息录入==============================

#import "OrderInfoView.h"
#import "GuestName.h"
#import "GuestPhone.h"
#import "GuessAddress.h"
#import "GuestAddressNext.h"
#import "OrderPrice.h"
#import "SendTime.h"
#import "OrderWeight.h"
#import "OrderSource.h"
#import "RemarkInfo.h"
#import "TotalPrice.h"

@interface OrderInfoView ()<OrderWeightDelegate>

@end

@implementation OrderInfoView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];

    }
    return self;
}

//界面初始化
-(void)setUpUI
{
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    //客人名称
    self.guestName = [[GuestName alloc]init];
    [self addSubview:self.guestName];
    [self.guestName makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //客人电话
    self.guestPhone = [[GuestPhone alloc]init];
    self.guestPhone.changeButton.selected = YES;
    
    [self addSubview:self.guestPhone];
    [self.guestPhone makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.guestName.bottom);
        make.height.equalTo(H(40));
    }];
    
    //客人地址
    self.guestAddress = [[GuessAddress alloc]init];
    [self addSubview:self.guestAddress];
    [self.guestAddress makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.guestPhone.bottom);
        make.height.equalTo(H(40));
    }];
    
    //地址下一行
    self.addressNext = [[GuestAddressNext alloc]init];
    [self addSubview:self.addressNext];
    [self.addressNext makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.guestAddress.bottom);
        make.height.equalTo(H(40));
    }];
    
    //订单价格
    self.orderPrice = [[OrderPrice alloc]init];
    self.orderPrice.paymentButton.selected = YES;
    [self addSubview:self.orderPrice];
    [self.orderPrice makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.addressNext.bottom);
        make.height.equalTo(H(40));
    }];
    
    
    //配送时间
    self.sendTime = [[SendTime alloc]init];
    [self addSubview:self.sendTime];
    [self.sendTime makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.orderPrice.bottom);
        make.height.equalTo(H(40));
    }];
    
    
    //订单重量
    self.orderWeight = [[OrderWeight alloc]init];
    self.orderWeight.delegate = self;
    self.orderWeight.weightDetailField.tag = 200;
    [self.orderWeight.plusButton addTarget:self action:@selector(weightPlusClick) forControlEvents:UIControlEventTouchUpInside];
    [self.orderWeight.minusButton addTarget:self action:@selector(weightMinusClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.orderWeight];
    [self.orderWeight makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.sendTime.bottom);
        make.height.equalTo(H(40));
    }];
    
    //订单来源
    self.orderSource = [[OrderSource alloc]init];
    [self addSubview:self.orderSource];
    [self.orderSource makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.orderWeight.bottom);
        make.height.equalTo(H(40));
    }];
    
    //备注
    self.remarkInfo = [[RemarkInfo alloc]init];
    [self addSubview:self.remarkInfo];
    [self.remarkInfo makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.orderSource.bottom);
        make.height.equalTo(H(40));
    }];
    
    //小费
    self.orderTip = [[OrderWeight alloc]init];
    self.orderTip.delegate = self;
    self.orderTip.weightDetailField.tag = 201;
    self.orderTip.weightLable.text = @"小        费";
    self.orderTip.weightDetailField.placeholder   = @"0元";
    [self.orderTip.plusButton addTarget:self action:@selector(tipPlusClick) forControlEvents:UIControlEventTouchUpInside];
    [self.orderTip.minusButton addTarget:self action:@selector(tipMinusClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.orderTip];
    [self.orderTip makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.remarkInfo.bottom);
        make.height.equalTo(H(40));
    }];
    
    //配送费用
    self.totalPrice = [[TotalPrice alloc]init];
    [self addSubview:self.totalPrice];
    [self.totalPrice makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.left).offset(W(-10));
        }
        else
        {
            make.left.equalTo(self.left);
        }
        make.bottom.equalTo(self.bottom).offset(H(10));
        make.size.equalTo(CGSizeMake(W(100), H(90)));
    }];
    
    
    //录下一单
    self.nextBill = [[XXJButton alloc]init];
    [self.nextBill setImage:[UIImage imageNamed:@"next order input"] forState:UIControlStateNormal];
    [self.nextBill setTitle:@"录下一单" forState:UIControlStateNormal];
    self.nextBill.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.nextBill];
    [self.nextBill makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.right.equalTo(self.right);
        }else
        {
            make.right.equalTo(self.right).offset(W(-20));
        }
        make.bottom.equalTo(self.bottom).offset(H(-40));
    }];
    
    //一键录入
    self.quickBill = [[XXJButton alloc]init];
    [self.quickBill setImage:[UIImage imageNamed:@"finish order"] forState:UIControlStateNormal];
    [self.quickBill setTitle:@"一键录入" forState:UIControlStateNormal];
    self.quickBill.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.quickBill addTarget: self action:@selector(quickBillButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.quickBill];
    [self.quickBill makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.bottom).offset(H(-40));
    }];
  
}

#pragma mark -- 一键录入按钮点击事件
-(void)quickBillButton
{
    if ([self.delegate respondsToSelector:@selector(quickBillButtonClick)]) {
        [self.delegate quickBillButtonClick];
    }
}



#pragma mark -- OrderWeightDelegate
-(void)getField:(UITextField *)orderField
{
    if (orderField.tag == 200) {
        self.countWeight = [orderField.text floatValue];
    }
    else if (orderField.tag == 201)
    {
        self.countTip = [orderField.text floatValue];
    }
    
    
}


#pragma mark -- 订单重量 加号 减号 点击事件
-(void)weightPlusClick
{
    self.countWeight += 0.5;
    self.orderWeight.weightDetailField.text = [NSString stringWithFormat:@"%.1fKG",self.countWeight];
}

-(void)weightMinusClick
{
    if (self.countWeight == 0)
    {
        self.orderWeight.weightDetailField.text = nil;
        self.orderWeight.weightDetailField.placeholder = @"0.0KG";
    }
    else
    {
        self.countWeight -= 0.5;
        self.orderWeight.weightDetailField.text = [NSString stringWithFormat:@"%.1fKG",self.countWeight];
    }
}



#pragma mark -- 订单小费 加号 减号 点击事件
-(void)tipPlusClick
{
    self.countTip += 0.5;
    self.orderTip.weightDetailField.text = [NSString stringWithFormat:@"%.1fKG",self.countTip];
}

-(void)tipMinusClick
{
    if (self.countTip == 0)
    {
        self.orderTip.weightDetailField.text = nil;
        self.orderTip.weightDetailField.placeholder = @"0.0KG";
    }
    else
    {
        self.countTip -= 0.5;
        self.orderTip.weightDetailField.text = [NSString stringWithFormat:@"%.1fKG",self.countTip];
    }
}












@end
