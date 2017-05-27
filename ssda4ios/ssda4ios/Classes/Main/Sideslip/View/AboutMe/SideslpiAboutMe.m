//
//  SideslpiAboutMe.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->点击头像按钮->关于我=======================================

#import "SideslpiAboutMe.h"
#import "AboutMe.h"
@implementation SideslpiAboutMe

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
    //导航栏下面的下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //头像图片
    UIImageView * iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icons"]];
    [self addSubview:iconImageView];
    [iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(73));
        make.size.equalTo(CGSizeMake(W(70), H(70)));
        make.centerX.equalTo(self);
        
    }];
    
    //名称
    UILabel * iconLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:17 text:@"俏西北国际美食中心"];
    [self addSubview:iconLable];
    [iconLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.bottom).offset(H(11));
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
    
    //
    AboutMe * myname = [[AboutMe alloc]init];
    myname.nameLable.text = @"我的名字";
    myname.detailLable.text = @"俏西北国际美食中心";
    [self addSubview:myname];
    [myname makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameImageViewLine.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];

    AboutMe * contact = [[AboutMe alloc]init];
    contact.nameLable.text = @"联系方式";
    contact.detailLable.text = @"12133698547";
    [self addSubview:contact];
    [contact makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(myname.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    
    AboutMe * public = [[AboutMe alloc]init];
    public.nameLable.text = @"随时达公众号";
    public.detailLable.text = nil;
    [self addSubview:public];
    [public makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contact.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    
    
    
    
    
    
    
    
}
@end
