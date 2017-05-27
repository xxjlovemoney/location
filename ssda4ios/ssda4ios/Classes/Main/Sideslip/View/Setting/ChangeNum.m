//
//  ChangeNum.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置 -> 更换登录手机号内容封装============================

#import "ChangeNum.h"

@implementation ChangeNum
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
    //titleLable
    self.titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:16 text:@"姓名"];
    [self addSubview:self.titleLable];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        
        if (WIDTH == 320) {
            make.width.equalTo(W(50));
            make.left.equalTo(self.left).offset(W(18));
        }
        else
        {
            make.width.equalTo(W(45));
            make.left.equalTo(self.left).offset(W(33));
        }
        
    }];
    
    
    //textField
    self.contentField = [[UITextField alloc]init];
//    self.contentField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入原账号注册时使用的姓名" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    self.contentField.placeholder = @"请输入原账号注册时使用的姓名";
    self.contentField.placeholderColor = [UIColor colorWithHexValue:0xFFFFFF alpha:0.6];
    self.contentField.borderStyle = UITextBorderStyleNone ;
    self.contentField.font = [UIFont systemFontOfSize:16];
    [self.contentField setTextColor:[UIColor whiteColor]];
    [self addSubview: self.contentField];
    [self.contentField makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.titleLable.right).offset(W(10));
        }
        else
        {
            make.left.equalTo(self.titleLable.right).offset(W(20));
        }
        
        make.centerY.equalTo(self);
    }];
    
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
}


@end
