//
//  TotalPrice.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 左下角封装=====================

#import "TotalPrice.h"

@implementation TotalPrice

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
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:@"配送费用"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.bottom.equalTo(self.bottom).offset(H(-29));
    }];
    
    UILabel * unitLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"元"];
    [self addSubview:unitLable];
    [unitLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLable.right);
        make.bottom.equalTo(titleLable.top).offset(H(-20));
    }];
    
    self.moneyLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:26 text:@"8.0"];
    [self addSubview:self.moneyLable];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(unitLable.left).offset(W(-5));
        make.centerY.equalTo(unitLable);
        
    }];
}

@end
