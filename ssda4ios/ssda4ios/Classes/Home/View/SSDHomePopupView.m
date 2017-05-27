//
//  SSDHomePopupView.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================主界面-> 底部弹出视图==============================================

#import "SSDHomePopupView.h"

@implementation SSDHomePopupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //内容初始化
        [self setUpUI];
        
        //
        
    }
    return self;
}


#pragma mark -- 内容初始化
-(void)setUpUI
{
    //外卖录单
    self.takeoutBillButton = [[XXJButton alloc]init];
    [self.takeoutBillButton setImage:[UIImage imageNamed:@"take-out botton"] forState:UIControlStateNormal];
    self.takeoutBillButton.tag = 100;
    [self.takeoutBillButton setTitle:@"外卖录单" forState:UIControlStateNormal];
    self.takeoutBillButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.takeoutBillButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.takeoutBillButton];
    [self.takeoutBillButton makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.left).offset(H(29));
        make.left.equalTo(self.left).offset(H(15));
        make.bottom.equalTo(self.bottom).offset(H(-114));
        make.size.equalTo(CGSizeMake(W(56), H(80)));
//        make.size.equalTo(CGSizeMake(56, 80));
    }];
    
    //饿了吗
    self.hungryButton = [[XXJButton alloc]init];
    self.hungryButton.tag = 101;
    [self.hungryButton setImage:[UIImage imageNamed:@"eleme botton"] forState:UIControlStateNormal];
    [self.hungryButton setTitle:@"饿了吗" forState:UIControlStateNormal];
    self.hungryButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.hungryButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.hungryButton];
    [self.hungryButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.takeoutBillButton.right).offset(W(20));
        make.bottom.equalTo(self.bottom).offset(H(-114));
        make.size.equalTo(CGSizeMake(W(56), H(80)));
//        make.size.equalTo(CGSizeMake(56, 80));
    }];
    
    //美团外卖
    self.meituanButton = [[XXJButton alloc]init];
    self.meituanButton.tag = 102;
    [self.meituanButton setImage:[UIImage imageNamed:@"meituan botton"] forState:UIControlStateNormal];
    [self.meituanButton setTitle:@"美团外卖" forState:UIControlStateNormal];
    self.meituanButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.meituanButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.meituanButton];
    [self.meituanButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hungryButton.right).offset(W(20));
        make.bottom.equalTo(self.bottom).offset(H(-114));
        make.size.equalTo(CGSizeMake(W(56), H(80)));
//        make.size.equalTo(CGSizeMake(56, 80));
    }];
    
    //百度外卖
    self.baiduButton = [[XXJButton alloc]init];
    self.baiduButton.tag = 103;
    [self.baiduButton setImage:[UIImage imageNamed:@"baidu botton"] forState:UIControlStateNormal];
    [self.baiduButton setTitle:@"百度外卖" forState:UIControlStateNormal];
    self.baiduButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.baiduButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.baiduButton];
    [self.baiduButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.meituanButton.right).offset(W(20));
//        make.right.equalTo(self.right).offset(W(-29));
        make.bottom.equalTo(self.bottom).offset(H(-114));
        make.size.equalTo(CGSizeMake(W(56), H(80)));
//        make.size.equalTo(CGSizeMake(56, 80));
    }];

    //
    UILabel * explainLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:W(10) text:@"您需要通过商家审核方可使用一下功能"];
    [self addSubview:explainLable];
    [explainLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.takeoutBillButton.left);
        make.bottom.equalTo(self.takeoutBillButton.top).offset(H(-9));

    }];
    //
    UIButton * examiningButton = [[UIButton alloc]init];
    examiningButton.userInteractionEnabled = NO;
    [examiningButton setBackgroundImage:[UIImage imageNamed:@"examining"] forState:UIControlStateNormal];
    [self addSubview:examiningButton];
    [examiningButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(explainLable.right).offset(W(4));
        make.centerY.equalTo(explainLable);
        make.size.equalTo(CGSizeMake(W(50), H(20)));
    }];
    
    //同城快递
    self.cityButton = [[XXJButton alloc]init];
    self.cityButton.tag = 104;
    [self.cityButton setImage:[UIImage imageNamed:@"city express botton"] forState:UIControlStateNormal];
    [self.cityButton setTitle:@"同城快递" forState:UIControlStateNormal];
    self.cityButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.cityButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.cityButton];
    [self.cityButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(15));
        make.bottom.equalTo(explainLable.top).offset(H(-47));
        make.size.equalTo(CGSizeMake(W(56), H(80)));
//        make.size.equalTo(CGSizeMake(56, 80));
    }];
    
    //跑腿服务
    self.errandButton = [[XXJButton alloc]init];
    self.errandButton.tag = 105;
    [self.errandButton setImage:[UIImage imageNamed:@"errand botton"] forState:UIControlStateNormal];
    [self.errandButton setTitle:@"跑腿服务" forState:UIControlStateNormal];
    self.errandButton.titleLabel.font = [UIFont systemFontOfSize:W(12)];
    self.errandButton.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.errandButton];
    [self.errandButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cityButton.right).offset(W(95));
        make.bottom.equalTo(explainLable.top).offset(H(-47));
        make.size.equalTo(CGSizeMake(W(56), H(80)));

    }];
    
}





@end































