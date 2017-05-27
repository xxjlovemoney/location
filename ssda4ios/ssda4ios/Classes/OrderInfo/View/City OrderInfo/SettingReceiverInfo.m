//
//  SettingReceiverInfo.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//======================底部视图 -> 同城快递 -> 同城快递发单内容封装 -> 点击设置收方信息======================

#import "SettingReceiverInfo.h"

@implementation SettingReceiverInfo
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
    //点击设置收方信息
    self.receiverInfoButton = [[UIButton alloc]init];
    [self.receiverInfoButton setTitle:@"点击设置收方信息" forState:UIControlStateNormal];
    self.receiverInfoButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.receiverInfoButton setBackgroundImage:[UIImage imageNamed:@"setting address"] forState:UIControlStateNormal];
    [self addSubview:self.receiverInfoButton];
    [self.receiverInfoButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
       
    }];
 
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(100));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    
}

@end
