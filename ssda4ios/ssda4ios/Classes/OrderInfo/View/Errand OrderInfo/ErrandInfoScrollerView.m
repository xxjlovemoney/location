//
//  ErrandInfoScrollerView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//========================底部视图 -> 跑腿服务-> 跑腿服务发单 -> 跑腿服务信息录入==============================

#import "ErrandInfoScrollerView.h"

#import "GuestName.h"
#import "ErrandGuestPhone.h"
#import "SevericeOrigin.h"
#import "SevericeEnd.h"
#import "SevericeTime.h"
#import "SevericeContent.h"
#import "SevericeLable.h"
#import "OrderWeight.h"
#import "TotalPrice.h"

@interface ErrandInfoScrollerView ()<UITextFieldDelegate>

@end

@implementation ErrandInfoScrollerView

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
    
    //客户姓名
    self.guestName = [[GuestName alloc]init];
    self.guestName.manButton.selected  = YES;
    [self addSubview:self.guestName];
    [self.guestName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewLine.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //客户电话
    self.guestPhone = [[ErrandGuestPhone alloc]init];
    [self addSubview:self.guestPhone];
    [self.guestPhone makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(WIDTH, H(95)));
        }else
        {
            make.size.equalTo(CGSizeMake(WIDTH, H(75)));
        }
        make.top.equalTo(self.guestName.bottom);
        make.centerX.equalTo(self.centerX);
    }];
    
    //服务起点
    self.severiceOrigin = [[SevericeOrigin alloc]init];
    [self.severiceOrigin.moreButton addTarget:self action:@selector(detailButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.severiceOrigin];
    [self.severiceOrigin makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.guestPhone.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(60)));
    }];
    
    
    //服务终点
    self.severiceEnd = [[SevericeEnd alloc]init];
    [self.severiceEnd.endButton addTarget:self action:@selector(EndButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.severiceEnd];
    [self.severiceEnd makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceOrigin.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(60)));
    }];
    
    
    //服务时间
    self.severiceTime = [[SevericeTime alloc]init];
    [self addSubview:self.severiceTime];
    [self.severiceTime makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceEnd.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(80)));
    }];
    
    
    //服务内容
    self.severiceContent = [[SevericeContent alloc]init];
    [self addSubview:self.severiceContent];
    [self.severiceContent makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceTime.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(124)));
    }];
    
    
    //服务标签
    self.severiceLable = [[SevericeLable alloc]init];
    [self addSubview:self.severiceLable];
    [self.severiceLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceContent.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(85)));
        
        
    }];
    
    //小费
    self.orderTip = [[OrderWeight alloc]init];
    self.orderTip.weightLable.text = @"小        费";
    self.orderTip.weightDetailField.placeholder   = @"0元";
    self.orderTip.weightDetailField.delegate = self;
    self.orderTip.weightDetailField.placeholderColor = [UIColor colorWithHexValue:0xFFFFFF alpha:0.6];
    [self addSubview:self.orderTip];
    [self.orderTip makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceLable.bottom);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    
    //跑腿费用
    self.totalPrice = [[TotalPrice alloc]init];
    self.totalPrice.moneyLable.text = @"26.0";
    [self addSubview:self.totalPrice];
    [self.totalPrice makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.top.equalTo(self.orderTip.bottom).offset(H(37));
        make.size.equalTo(CGSizeMake(W(100), H(90)));
    }];
    
    //点击确认
    self.OkButton = [[XXJLeftRightButton alloc]init];
    [self.OkButton setTitle:@"点击确认" forState:UIControlStateNormal];
    [self.OkButton setImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    self.OkButton.titleLabel.font = [UIFont systemFontOfSize:24];
    [self.OkButton addTarget:self action:@selector(sureButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.OkButton];
    [self.OkButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.totalPrice.right).offset(W(80));
        }
        else
        {
            make.left.equalTo(self.totalPrice.right).offset(W(100));
        }
        
        make.top.equalTo(self.orderTip.bottom).offset(H(62));
        make.size.equalTo(CGSizeMake(W(130), H(25)));
    }];
    
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.maxHeight = CGRectGetMaxY(self.totalPrice.frame);
//    XXJLog(@"errand===view======%ld",(long)self.maxHeight)
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


#pragma mark -- 服务起点 更多按钮点击事件
//更多按钮点击事件
-(void)detailButton
{
    if ([self.ButtonDelegate respondsToSelector:@selector(moreButtonClick)]) {
        [self.ButtonDelegate moreButtonClick];
    }
    
}

#pragma mark -- 服务终点 按钮点击事件
//服务终点。按钮点击
-(void)EndButton
{
    if ([self.ButtonDelegate respondsToSelector:@selector(endButtonClick)]) {
        [self.ButtonDelegate endButtonClick];
    }
}

#pragma mark -- 点击确认
-(void)sureButton
{
    if ([self.ButtonDelegate respondsToSelector:@selector(sureButtonClick)]) {
        [self.ButtonDelegate sureButtonClick];
    }
}




















@end
