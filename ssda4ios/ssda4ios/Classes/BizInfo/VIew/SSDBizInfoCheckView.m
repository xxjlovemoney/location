//
//  SSDBizInfoCheckView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoCheckView.h"

@implementation SSDBizInfoCheckView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    //下划线
    UIImageView * line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kMarginTopHeight);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
    }];
    
    
    //时钟图片
    UIImageView * clockImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"time"]];
    [self addSubview:clockImageView];
    [clockImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(145)+kMarginTopHeight);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(41, 51));
    }];
    
    //
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(14) text:@"信息审核中，我们将于今日\n（13:30）前完成审核，\n请耐心等待"];
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.numberOfLines = 0;
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clockImageView.bottom).offset(H(36));
        make.centerX.equalTo(self);
    }];
    
    
    UILabel * nexttitleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(14) text:@"您可在菜单中选择“商家认证”\n查看审核进度"];
    nexttitleLable.textAlignment = NSTextAlignmentCenter;
    nexttitleLable.numberOfLines = 0;
    [self addSubview:nexttitleLable];
    [nexttitleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(36));
        make.centerX.equalTo(self);
    }];
    
    
    
    
    UIImageView * bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"button"]];
    bottomImageView.userInteractionEnabled = YES;
    [self addSubview:bottomImageView];
    [bottomImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(199));
    }];
    
    //底部按钮
    UIButton * nextStepBtn = [[UIButton alloc]init];
    [nextStepBtn setTitle:@"好的" forState:UIControlStateNormal];
    [nextStepBtn addTarget:self action:@selector(OKClick) forControlEvents:UIControlEventTouchUpInside];
    //    [nextStepBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:nextStepBtn];
    
    [nextStepBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(80));
    }];
}



-(void)OKClick
{
    if ([self.delegate respondsToSelector:@selector(OKButtonClick)]) {
        [self.delegate OKButtonClick];
    }
}






@end
