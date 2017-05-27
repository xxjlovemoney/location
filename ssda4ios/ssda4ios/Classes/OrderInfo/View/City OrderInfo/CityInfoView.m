//
//  CityInfoView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================底部视图 -> 同城快递 -> 同城快递发单==================================

#import "CityInfoView.h"
#import "SenderInfo.h"
#import "SettingReceiverInfo.h"
#import "SendTime.h"
#import "OrderWeight.h"
#import "OrderKind.h"
#import "RemarkInfo.h"
#import "TotalPrice.h"

@interface CityInfoView ()<UITextFieldDelegate>

@end

@implementation CityInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        //增加点击手势
        [self setUpTapGes];
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
    
    //寄方
    self.senderInfo = [[SenderInfo alloc]init];
    [self.senderInfo.moreButton addTarget:self action:@selector(senderDetailButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.senderInfo];
    [self.senderInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewLine.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(100));
    }];
    
    //点击设置收方信息
    self.receiverInfo = [[SettingReceiverInfo alloc]init];
    [self.receiverInfo.receiverInfoButton addTarget:self action:@selector(receiverInfoButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.receiverInfo];
    [self.receiverInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.senderInfo.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(100));
    }];
    
    //配送时间
    self.sendtime = [[SendTime alloc]init];
    self.sendtime.currentTimeButton.selected = YES;
    [self addSubview:self.sendtime];
    [self.sendtime makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiverInfo.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //物品重量
    
    self.orderWeight = [[OrderWeight alloc]init];
    
    self.orderWeight.weightDetailField.delegate = self;
    
    [self addSubview:self.orderWeight];
    [self.orderWeight makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendtime.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //物品种类
    self.orderkind = [[OrderKind alloc]init];
    [self addSubview:self.orderkind];
    [self.orderkind makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderWeight.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(60));
    }];
    
    //备注
    self.remarkInfo = [[RemarkInfo alloc]init];
    self.remarkInfo.remarkField.delegate = self;
    
    [self addSubview:self.remarkInfo];
    [self.remarkInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderkind.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //小费
    self.orderTip = [[OrderWeight alloc]init];
    self.orderTip.weightLable.text = @"小        费";
    self.orderTip.weightDetailField.placeholder   = @"0元";
    self.orderTip.weightDetailField.delegate = self;
    self.orderTip.weightDetailField.placeholderColor = [UIColor colorWithHexValue:0xFFFFFF alpha:0.6];
    [self addSubview:self.orderTip];
    [self.orderTip makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarkInfo.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //配送费用
    self.totalPrice = [[TotalPrice alloc]init];
    [self addSubview:self.totalPrice];
    [self.totalPrice makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.bottom.equalTo(self.bottom).offset(H(10));
        }else
        {
            make.bottom.equalTo(self.bottom);
        }
        make.left.equalTo(self.left);
        
        make.size.equalTo(CGSizeMake(W(120), H(120)));
    }];
    
    //点击确认
    self.OkButton = [[XXJLeftRightButton alloc]init];
    [self.OkButton addTarget:self action:@selector(OKButton) forControlEvents:UIControlEventTouchUpInside];
    [self.OkButton setTitle:@"点击确认" forState:UIControlStateNormal];
    [self.OkButton setImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    self.OkButton.titleLabel.font = [UIFont systemFontOfSize:24];
    [self addSubview:self.OkButton];
    [self.OkButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-26));
//        make.left.equalTo(self.totalPrice.right).offset(W(100));
        make.bottom.equalTo(self.bottom).offset(H(-29));
    }];
    
}

#pragma mark -- 增加点击手势
-(void)setUpTapGes
{
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes)];
    [self addGestureRecognizer:tapGes];
}

-(void)tapGes
{
    
}

#pragma mark -- 寄方。 更多按钮点击事件
-(void)senderDetailButton
{
    if ([self.delegate respondsToSelector:@selector(senderDetailButtonClick)]) {
        [self.delegate senderDetailButtonClick];
    }
}
#pragma mark -- 点击设置收方信息。按钮点击啊事件
-(void)receiverInfoButton
{
    if ([self.delegate respondsToSelector:@selector(receiverInfoButtonClick)]) {
        [self.delegate receiverInfoButtonClick];
    }
}

#pragma mark -- 确认按钮 点击事件
-(void)OKButton
{
    if ([self.delegate respondsToSelector:@selector(OkButtonClick)]) {
        [self.delegate OkButtonClick];
    }
}







@end
