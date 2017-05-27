//
//  ReportStoreView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报->投诉商家===================================

#import "ReportStoreView.h"

@implementation ReportStoreView
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
    
    //请输入商家名称
    self.storeNameField = [[UITextField alloc]init];
    self.storeNameField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入商家名称（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.storeNameField.borderStyle = UITextBorderStyleNone ;
    self.storeNameField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.storeNameField];
    [self.storeNameField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(65));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageStoreNameLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageStoreNameLine];
    [imageStoreNameLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storeNameField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    //请输入商家名联系方式
    self.storePhoneField = [[UITextField alloc]init];
    self.storePhoneField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入商家联系方式（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.storePhoneField.borderStyle = UITextBorderStyleNone ;
    self.storePhoneField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.storePhoneField];
    [self.storePhoneField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageStoreNameLine.bottom).offset(H(27));
        make.left.equalTo(self.left).offset(W(35));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageStorePhoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageStorePhoneLine];
    [imageStorePhoneLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storePhoneField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    

    
    //输入原因
    self.storeTextView = [[BRPlaceholderTextView alloc]init];
    [self.storeTextView setPlaceholderColor:[UIColor colorWithHexValue:0x838383 alpha:1.0]];
    [self.storeTextView setPlaceholderFont:[UIFont systemFontOfSize:14]];
    self.storeTextView.placeholder = @"请在此描述投诉原因，不少于15个字。\n我们将在1-3个工作日处理您的投诉（必填）";
    
    [self addSubview:self.storeTextView];
    [self.storeTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageStorePhoneLine.bottom).offset(H(53));
        make.left.equalTo(self.left).offset(W(33));
        make.right.equalTo(self.right).offset(W(-25));
        make.height.equalTo(H(250));
        
        
    }];
    

    
    //底部按钮
    UIButton * storeCommitBtn = [[UIButton alloc]init];
    [storeCommitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [storeCommitBtn addTarget:self action:@selector(storeCommitBtn) forControlEvents:UIControlEventTouchUpInside];
    [storeCommitBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:storeCommitBtn];
    
    [storeCommitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
    
    
}
    
#pragma mark -- 提交按钮
-(void)storeCommitBtn
{
    XXJLog(@"投诉商家。投诉。投诉")
}


#pragma mark -- 增加点击手势
-(void)setUpGes
{
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick)];
    [self addGestureRecognizer:tapGes];
}

-(void)tapGesClick
{
    [self.storeNameField resignFirstResponder];
    [self.storePhoneField resignFirstResponder];
    [self.storeTextView resignFirstResponder];
}

@end
