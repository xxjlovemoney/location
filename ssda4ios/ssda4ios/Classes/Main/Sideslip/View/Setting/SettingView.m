//
//  SettingView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置 -> ==============================================

#import "SettingView.h"
#import "AboutMe.h"

@implementation SettingView
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
    
    //更换手机号
    self.changePhoneNumber = [[AboutMe alloc]init];
    self.changePhoneNumber.nameLable.font = [UIFont systemFontOfSize:16];
    self.changePhoneNumber.nameLable.text = @"更换登录手机号";
    self.changePhoneNumber.detailLable.text = nil;
    UITapGestureRecognizer * changeNumberGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeNumberBtn)];
    [self.changePhoneNumber addGestureRecognizer:changeNumberGes];
    self.changePhoneNumber.moreBtn.userInteractionEnabled = NO;
    [self addSubview:self.changePhoneNumber];
    [self.changePhoneNumber makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.top.equalTo(topImageViewLine.bottom);
        make.right.equalTo(self.right);
        make.height.equalTo(H(52));
    }];
    
    //设置一键发单
    self.quickBill = [[AboutMe alloc]init];
    self.quickBill.nameLable.font = [UIFont systemFontOfSize:16];
    self.quickBill.nameLable.text = @"设置一键发单";
    self.quickBill.detailLable.text = nil;
    UITapGestureRecognizer * quickBillGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(quickBillBtn)];
    [self.quickBill addGestureRecognizer:quickBillGes];
    self.quickBill.moreBtn.userInteractionEnabled = NO;
    [self addSubview:self.quickBill];
    [self.quickBill makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.top.equalTo(self.changePhoneNumber.bottom);
        make.right.equalTo(self.right);
        make.height.equalTo(H(52));
    }];
    
    //关于
    self.about = [[AboutMe alloc]init];
    self.about.nameLable.font = [UIFont systemFontOfSize:16];
    self.about.nameLable.text = @"关于";
    self.about.detailLable.text = nil;
    UITapGestureRecognizer * aboutGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aboutBtn)];
    [self.about addGestureRecognizer:aboutGes];
    self.about.moreBtn.userInteractionEnabled = NO;
    [self addSubview:self.about];
    [self.about makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.top.equalTo(self.quickBill.bottom);
        make.right.equalTo(self.right);
        make.height.equalTo(H(52));
    }];
    
    //退出登录
    self.logOut = [[AboutMe alloc]init];
    self.logOut.nameLable.font = [UIFont systemFontOfSize:16];
    self.logOut.nameLable.text = @"退出登录";
    self.logOut.detailLable.text = nil;
    UITapGestureRecognizer * logOutGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(logOutBtn)];
    [self.logOut addGestureRecognizer:logOutGes];
    self.logOut.moreBtn.userInteractionEnabled = NO;
    [self addSubview:self.logOut];
    [self.logOut makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.top.equalTo(self.about.bottom);
        make.right.equalTo(self.right);
        make.height.equalTo(H(52));
    }];
}


#pragma mark -- 更换登录手机号
-(void)changeNumberBtn
{
    if ([self.delegate respondsToSelector:@selector(changeNumberBtnClick)]) {
        [self.delegate changeNumberBtnClick];
    }
}

#pragma mark -- 设置一键发单
-(void)quickBillBtn
{
    if ([self.delegate respondsToSelector:@selector(quickBillBtnClick)]) {
        [self.delegate quickBillBtnClick];
    }
}

#pragma mark -- 关于
-(void)aboutBtn
{
    if ([self.delegate respondsToSelector:@selector(aboutBtnClick)]) {
        [self.delegate aboutBtnClick];
    }
}

#pragma mark -- 退出登录
-(void)logOutBtn
{
    if ([self.delegate respondsToSelector:@selector(logOutBtnClick)]) {
        [self.delegate logOutBtnClick];
    }
}


@end



















