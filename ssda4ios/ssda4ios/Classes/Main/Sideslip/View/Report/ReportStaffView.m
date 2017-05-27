//
//  ReportStaffView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报->投诉随时达工作人员===================================

#import "ReportStaffView.h"

@implementation ReportStaffView
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
    //请输入随时达工作人员名称
    self.staffNameField = [[UITextField alloc]init];
    self.staffNameField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入随时达工作人员名称（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.staffNameField.borderStyle = UITextBorderStyleNone ;
    self.staffNameField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.staffNameField];
    [self.staffNameField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(65));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageStaffNameLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageStaffNameLine];
    [imageStaffNameLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.staffNameField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    //请输入配送员联系方式
    self.staffPhoneField = [[UITextField alloc]init];
    self.staffPhoneField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入配送员联系方式（必填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    self.staffPhoneField.borderStyle = UITextBorderStyleNone ;
    self.staffPhoneField.font = [UIFont systemFontOfSize:14];
    [self addSubview: self.staffPhoneField];
    [self.staffPhoneField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageStaffNameLine.bottom).offset(H(27));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageStaffPhoneLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageStaffPhoneLine];
    [imageStaffPhoneLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.staffPhoneField.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    
    //输入原因
    self.staffTextView = [[BRPlaceholderTextView alloc]init];
    [self.staffTextView setPlaceholderColor:[UIColor colorWithHexValue:0x838383 alpha:1.0]];
    [self.staffTextView setPlaceholderFont:[UIFont systemFontOfSize:14]];
    self.staffTextView.placeholder = @"请在此描述投诉原因，不少于15个字。\n我们将在1-3个工作日处理您的投诉（必填）";
    
    [self addSubview:self.staffTextView];
    [self.staffTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageStaffPhoneLine.bottom).offset(H(53));
        make.left.equalTo(self.left).offset(W(33));
        make.right.equalTo(self.right).offset(W(-25));
        make.height.equalTo(H(250));
        
        
    }];
    
    
    
    //底部按钮
    UIButton * staffCommitBtn = [[UIButton alloc]init];
    [staffCommitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [staffCommitBtn addTarget:self action:@selector(staffCommitBtn) forControlEvents:UIControlEventTouchUpInside];
    [staffCommitBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:staffCommitBtn];
    
    [staffCommitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
    
}

#pragma mark -- 提交按钮
-(void)staffCommitBtn
{
    XXJLog(@"投诉随时达工作人员。投诉。投诉")
}

#pragma mark -- 增加点击手势
-(void)setUpGes
{
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesClick)];
    [self addGestureRecognizer:tapGes];
}

-(void)tapGesClick
{
    [self.staffNameField resignFirstResponder];
    [self.staffPhoneField resignFirstResponder];
    [self.staffTextView resignFirstResponder];
}

@end
