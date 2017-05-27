//
//  ReportDeliveryView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报->投诉配送人员===================================

#import "ReportDeliveryView.h"

@implementation ReportDeliveryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        //增加点击手势
        [self setUpGes];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //请输入配送员名称
    self.deliveryNameField = [[UITextField alloc]init];
    self.deliveryNameField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入配送员名称（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.deliveryNameField.borderStyle = UITextBorderStyleNone ;
    self.deliveryNameField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.deliveryNameField];
    [self.deliveryNameField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(65));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageDeliveryNameLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageDeliveryNameLine];
    [imageDeliveryNameLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deliveryNameField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    //请输入配送员联系方式
    self.deliveryPhoneField = [[UITextField alloc]init];
    self.deliveryPhoneField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入配送员联系方式（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.deliveryPhoneField.borderStyle = UITextBorderStyleNone ;
    self.deliveryPhoneField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.deliveryPhoneField];
    [self.deliveryPhoneField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageDeliveryNameLine.bottom).offset(H(27));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageDeliveryPhoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageDeliveryPhoneLine];
    [imageDeliveryPhoneLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deliveryPhoneField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    
    //输入原因
    self.deliveryTextView = [[BRPlaceholderTextView alloc]init];
    [self.deliveryTextView setPlaceholderColor:[UIColor colorWithHexValue:0x838383 alpha:1.0]];
    [self.deliveryTextView setPlaceholderFont:[UIFont systemFontOfSize:14]];
    self.deliveryTextView.placeholder = @"请在此描述投诉原因，不少于15个字。\n我们将在1-3个工作日处理您的投诉（必填）";
    
    [self addSubview:self.deliveryTextView];
    [self.deliveryTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageDeliveryPhoneLine.bottom).offset(H(53));
        make.left.equalTo(self.left).offset(W(33));
        make.right.equalTo(self.right).offset(W(-25));
        make.height.equalTo(H(250));
        
        
    }];
    
    
    
    //底部按钮
    UIButton * deliveryCommitBtn = [[UIButton alloc]init];
    [deliveryCommitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [deliveryCommitBtn addTarget:self action:@selector(deliveryCommitBtn) forControlEvents:UIControlEventTouchUpInside];
    [deliveryCommitBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:deliveryCommitBtn];
    
    [deliveryCommitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];

}

#pragma mark -- 提交按钮
-(void)deliveryCommitBtn
{
    XXJLog(@"投诉配送员。投诉。投诉")
}

#pragma mark -- 增加点击手势
-(void)setUpGes
{
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick)];
    [self addGestureRecognizer:tapGes];
}

-(void)tapGesClick
{
    [self.deliveryNameField resignFirstResponder];
    [self.deliveryPhoneField resignFirstResponder];
    [self.deliveryTextView resignFirstResponder];
}

@end
