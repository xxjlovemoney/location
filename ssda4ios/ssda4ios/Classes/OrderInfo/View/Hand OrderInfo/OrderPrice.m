//
//  OrderPrice.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 订单价格=====================

#import "OrderPrice.h"

@interface OrderPrice ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation OrderPrice
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
    //订单价格
    self.priceLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"订单价格"];
    [self addSubview:self.priceLable];
    [self.priceLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //价格详情
    self.priceTextField = [[UITextField alloc]init];
    if (WIDTH == 320) {
        self.priceTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"输入价格" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    }else
    {
        self.priceTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"输入订单价格" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    }
    [self.priceTextField setTextColor:[UIColor whiteColor]];
    self.priceTextField.borderStyle = UITextBorderStyleNone ;
    self.priceTextField.font = [UIFont systemFontOfSize:14];
    [self.priceTextField sizeToFit];
    [self addSubview: self.priceTextField];
    [self.priceTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLable.right).offset(W(23));
        make.centerY.equalTo(self);
    }];

    //未付款
    self.non_paymentButton = [[UIButton alloc]init];
    [self.non_paymentButton setTitle:@"未付款" forState:UIControlStateNormal];
    [self.non_paymentButton setImage:[UIImage imageNamed:@"not choosed"] forState:UIControlStateNormal];
    [self.non_paymentButton setImage:[UIImage imageNamed:@"choosed"] forState:UIControlStateSelected];
    self.non_paymentButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.non_paymentButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.non_paymentButton];
    [self.non_paymentButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-26));
        make.centerY.equalTo(self);
    }];
    
    //已付款
    self.paymentButton = [[UIButton alloc]init];
    [self.paymentButton setTitle:@"已付款" forState:UIControlStateNormal];
    [self.paymentButton setImage:[UIImage imageNamed:@"not choosed"] forState:UIControlStateNormal];
    [self.paymentButton setImage:[UIImage imageNamed:@"choosed"] forState:UIControlStateSelected];
    self.paymentButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.paymentButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.preBtn = self.paymentButton;
    [self addSubview:self.paymentButton];
    [self.paymentButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.non_paymentButton.left).offset(W(-13));
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


#pragma mark -- 性别按钮 点击事件
-(void)btnClick:(UIButton *)sender
{
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
}






@end
