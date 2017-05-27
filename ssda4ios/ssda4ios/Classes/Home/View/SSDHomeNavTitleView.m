//
//  SSDHomeNavTitleView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDHomeNavTitleView.h"

@implementation SSDHomeNavTitleView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //接面初始化
        [self setupUI];
        
    }
    return self;
}

#pragma mark -- 接面初始化
-(void)setupUI
{
    //发布中
    self.publishButton = [[UIButton alloc]init];
    [self.publishButton setTitle:@"发布中" forState:UIControlStateNormal];
    self.publishButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.publishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.publishButton sizeToFit];
    [self.publishButton addTarget:self action:@selector(pubButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.publishButton];
    [self.publishButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    //下划线
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.lineView];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.publishButton.bottom);
        make.centerX.equalTo(self.publishButton);
        make.size.equalTo(CGSizeMake(W(26), H(1.5)));
    }];
    
    //进行中
    self.processButton = [[UIButton alloc]init];
    [self.processButton setTitle:@"进行中(52)" forState:UIControlStateNormal];
    self.processButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.processButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.processButton sizeToFit];
    [self.processButton addTarget:self action:@selector(proButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.processButton];
    [self.processButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
}


-(void)pubButton
{
    if ([self.delegate respondsToSelector:@selector(publishButtonClick)]) {
        [self.delegate publishButtonClick];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.xxj_centerX = self.publishButton.xxj_centerX;
    }];
    
}

-(void)proButton
{
    if ([self.delegate respondsToSelector:@selector(processButtonClick)]) {
        [self.delegate processButtonClick];
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.xxj_centerX = self.processButton.xxj_centerX;
    }];
    
}

@end
