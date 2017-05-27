//
//  PulldownView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 一键发单设置 ->下拉菜单======================

#import "PulldownView.h"

@implementation PulldownView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化界面
        [self setUpUI];
    }
    return self;
}


#pragma mark -- 初始化界面
-(void)setUpUI
{
    //title
    self.titleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:nil];
    [self.titleLable sizeToFit];
    [self addSubview:self.titleLable];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.top.equalTo(self.top).offset(H(27));
    }];
    
    //账号field
    self.accountField = [[UITextField alloc]init];
    self.accountField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入账号" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    self.accountField.borderStyle = UITextBorderStyleNone ;
    self.accountField.font = [UIFont systemFontOfSize:16];
    [self addSubview: self.accountField];
    [self.accountField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(33));
        make.top.equalTo(self.titleLable.bottom).offset(H(27));
    }];

    //下划线
    UIImageView * accountImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:accountImageViewLine];
    [accountImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.accountField.bottom);
        make.size.equalTo(CGSizeMake(W(300), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //密码field
    self.passwordField = [[UITextField alloc]init];
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    self.passwordField.borderStyle = UITextBorderStyleNone ;
    self.passwordField.font = [UIFont systemFontOfSize:16];
    [self addSubview: self.passwordField];
    [self.passwordField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(33));
        make.top.equalTo(accountImageViewLine.bottom).offset(H(20));
    }];

    //下划线
    UIImageView * passwordImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:passwordImageViewLine];
    [passwordImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.passwordField.bottom);
        make.size.equalTo(CGSizeMake(W(300), H(1)));
        make.centerX.equalTo(self);
    }];

    
    //确定按钮
    self.sureButton = [[UIButton alloc]init];
    [self.sureButton setBackgroundImage:[UIImage imageNamed:@"sure and cancel botton"] forState:UIControlStateNormal];
    [self.sureButton setTitle:@"确认" forState:UIControlStateNormal];
    [self.sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.sureButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.sureButton];
    [self.sureButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordImageViewLine.bottom).offset(H(37));
        make.left.equalTo(self.left).offset(W(33));
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(W(110), H(42)));
        }
    }];
    
    //取消按钮
    self.cancelButton = [[UIButton alloc]init];
    [self.cancelButton setBackgroundImage:[UIImage imageNamed:@"sure and cancel botton"] forState:UIControlStateNormal];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.cancelButton];
    [self.cancelButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordImageViewLine.bottom).offset(H(37));
        make.right.equalTo(self.right).offset(W(-33));
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(W(110), H(42)));
        }
    }];
    
    
    
    //下划线
    self.bottomImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:self.bottomImageViewLine];
    [self.bottomImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.sureButton.bottom).offset(H(52));
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];

    
    
    
    
    
    
    
}
@end
