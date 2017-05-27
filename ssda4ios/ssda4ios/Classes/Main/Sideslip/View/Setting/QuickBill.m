//
//  QuickBill.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 一键发单设置===================================

#import "QuickBill.h"

@implementation QuickBill
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
    //
    self.titleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:16 text:nil];
    [self.titleLable sizeToFit];
    [self addSubview:self.titleLable];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self.centerY);
        make.size.equalTo(CGSizeMake(W(200), H(25)));
    }];
    
    
    //展开按钮
    self.spreadButton = [[UIButton alloc]init];
    [self.spreadButton setImage:[UIImage imageNamed:@"open drawer"] forState:UIControlStateNormal];
    [self.spreadButton setImage:[UIImage imageNamed:@"close drawer"] forState:UIControlStateSelected];
    self.spreadButton.selected = NO;
    [self.spreadButton sizeToFit];
    [self addSubview:self.spreadButton];
    [self.spreadButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(20), H(20)));
        make.centerY.equalTo(self);
        make.right.equalTo(self.right).offset(W(-30));
    }];
    
    //绑定按钮
    self.boundButton  = [[UIButton alloc]init];
    [self.boundButton setImage:[UIImage imageNamed:@"bounded"] forState:UIControlStateNormal];
    [self addSubview:self.boundButton];
    [self.boundButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.spreadButton.left).offset(W(-20));
        make.size.equalTo(CGSizeMake(W(50), H(20)));
    }];
    
    //line
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
