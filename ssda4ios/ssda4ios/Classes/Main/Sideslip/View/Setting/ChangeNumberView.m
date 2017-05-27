//
//  ChangeNumberView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置 -> 更换登录手机号==================================

#import "ChangeNumberView.h"
#import "ChangeNum.h"

@implementation ChangeNumberView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        
    }
    return self;
}

#pragma mark --界面初始化
-(void)setUpUI
{
    //姓名
    self.name = [[ChangeNum alloc]init];
    self.name.titleLable.text=@"姓名";
    self.name.contentField.placeholder = @"请输入原账号注册时使用的姓名";
    [self addSubview:self.name];
    [self.name makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //身份证
    self.IDcard = [[ChangeNum alloc]init];
    self.IDcard.titleLable.text=@"身份证";
    self.IDcard.contentField.placeholder = @"请输入原账号注册时使用的身份证";
    [self addSubview:self.IDcard];
    [self.IDcard makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.name.bottom);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    //原手机
    self.prePhoneNumber = [[ChangeNum alloc]init];
    self.prePhoneNumber.titleLable.text=@"原手机";
    self.prePhoneNumber.contentField.placeholder = @"请输入原来的手机号";
    [self addSubview:self.prePhoneNumber];
    [self.prePhoneNumber makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.IDcard.bottom);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    //新手机
    self.currentPhoneNumber = [[ChangeNum alloc]init];
    self.currentPhoneNumber.titleLable.text=@"新手机";
    self.currentPhoneNumber.contentField.placeholder = @"请输入原来的手机号";
    [self addSubview:self.currentPhoneNumber];
    [self.currentPhoneNumber makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.prePhoneNumber.bottom);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    //验证码
    self.authCode = [[ChangeNum alloc]init];
    self.authCode.titleLable.text=@"验证码";
    self.authCode.contentField.placeholder = @"请输入验证码";
    [self addSubview:self.authCode];
    [self.authCode makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.currentPhoneNumber.bottom);
        make.right.equalTo(self);
        make.height.equalTo(H(52));
    }];
    
    
    
    //获取验证码
    self.getAuthBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.getAuthBtn setBackgroundImage:[UIImage imageNamed:@"get code botton"] forState:UIControlStateNormal];
    [self.getAuthBtn sizeToFit];
    self.getAuthBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.getAuthBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getAuthBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.authCode addSubview:self.getAuthBtn];
    [self.getAuthBtn makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(104), H(21)));
        make.right.equalTo(self.right).offset(-W(10));
        make.centerY.equalTo(self.authCode);
    }];
    
    
    
    UIButton * changNumBtn = [[UIButton alloc]init];
    [changNumBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [changNumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    changNumBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [changNumBtn sizeToFit];
    [self addSubview:changNumBtn];
    [changNumBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.bottom).offset(-H(52));
    }];
    
    
    
    
    
    
    
    
    
    
}

@end
