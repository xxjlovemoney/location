//
//  SideslipStoreApprove.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


#import "SideslipStoreApprove.h"
#import "AboutMe.h"
@implementation SideslipStoreApprove

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUPUI];
    }
    return self;
}

-(void)setUPUI
{
    //导航栏下面的下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(44));
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //名称
    UILabel * iconLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(17) text:@"俏西北国际美食中心"];
    [self addSubview:iconLable];
    [iconLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(108+64));
        make.centerX.equalTo(self);
    }];
    
    //认证按钮
    UIButton * approveButton = [[UIButton alloc]init];
    [approveButton setBackgroundImage:[UIImage imageNamed:@"approved label"] forState:UIControlStateNormal];
    [self addSubview:approveButton];
    [approveButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(50), H(20)));
        make.top.equalTo(iconLable.bottom).offset(H(4));
        make.centerX.equalTo(self);
    }];
    
    UIImageView * nameImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:nameImageViewLine];
    [nameImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(approveButton).offset(H(70));
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    //修改姓名与身份证
    AboutMe * updateId = [[AboutMe alloc]init];
    updateId.nameLable.text = @"修改姓名与身份证";
    updateId.detailLable.text = @"修改后需要重新审核";
    updateId.nameLable.font = [UIFont systemFontOfSize:15];
    
    if (WIDTH == 320) {
        updateId.detailLable.font = [UIFont systemFontOfSize:13];
    }
    else
    {
        updateId.detailLable.font = [UIFont systemFontOfSize:14];
    }
    updateId.detailLable.alpha = 0.7;
    [self addSubview:updateId];
    [updateId makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameImageViewLine.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    
    //修改地址
    AboutMe * updateAddress = [[AboutMe alloc]init];
    updateAddress.nameLable.text = @"修改地址";
    updateAddress.detailLable.text = @"联系客服";
    updateAddress.nameLable.font = [UIFont systemFontOfSize:15];
    if (WIDTH == 320) {
        updateAddress.detailLable.font = [UIFont systemFontOfSize:13];
    }
    else
    {
        updateAddress.detailLable.font = [UIFont systemFontOfSize:14];
    }
    
    
    updateAddress.detailLable.alpha = 0.8;
    [updateAddress.moreBtn setImage:[UIImage imageNamed:@"deliveryman phone"] forState:UIControlStateNormal];
    [self addSubview:updateAddress];
    [updateAddress makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(updateId.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    //联系区域经理
    AboutMe * contactManager = [[AboutMe alloc]init];
    contactManager.nameLable.text = @"联系区域经理";
    contactManager.nameLable.font = [UIFont systemFontOfSize:15];
    contactManager.detailLable.text = nil;
    [contactManager.moreBtn setImage:[UIImage imageNamed:@"deliveryman phone"] forState:UIControlStateNormal];
    [self addSubview:contactManager];
    [contactManager makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(updateAddress.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];

    
    
    
}
@end
