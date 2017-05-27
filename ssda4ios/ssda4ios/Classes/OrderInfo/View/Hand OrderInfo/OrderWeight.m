//
//  OrderWeight.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 订单重量=====================

#import "OrderWeight.h"

@interface OrderWeight ()<UITextFieldDelegate>

@end

@implementation OrderWeight
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
    //订单重量
    self.weightLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"订单重量"];
    [self addSubview:self.weightLable];
    [self.weightLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //重量详情
    self.weightDetailField = [[UITextField alloc]init];
    self.weightDetailField.placeholder = @"0.0KG";
    self.weightDetailField.placeholderColor = [UIColor colorWithHexValue:0xFFFFFF alpha:0.6];
    [self.weightDetailField setTextColor:[UIColor whiteColor]];
    self.weightDetailField.borderStyle = UITextBorderStyleNone ;
    self.weightDetailField.font = [UIFont systemFontOfSize:14];
    [self.weightDetailField setTextColor:[UIColor whiteColor]];
    [self.weightDetailField sizeToFit];
    
    self.weightDetailField.delegate = self;
    
    [self addSubview: self.weightDetailField];
    [self.weightDetailField makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.weightLable.right).offset(27);
    }];
    
    //加号
    self.plusButton = [[UIButton alloc]init];
    [self.plusButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [self addSubview:self.plusButton];
    [self.plusButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-44));
        make.centerY.equalTo(self);
    }];
    
    
    //减号
    self.minusButton = [[UIButton alloc]init];
    [self.minusButton setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];
    [self addSubview:self.minusButton];
    [self.minusButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusButton.left).equalTo(W(-37));
        make.centerY.equalTo(self);
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
}


#pragma mark -- UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(getField:)]) {
        [self.delegate getField:textField];
    }
    
}





@end
