//
//  PublishBtnView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/11.
//  Copyright © 2017年 gaga. All rights reserved.
//

//========================================地图界面订单详情 ->顶部视图按钮 ->发布中按钮==========================

#import "PublishBtnView.h"

@implementation PublishBtnView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
    }
    return self;
}

//界面初始化
-(void)setUpUI
{
    //发布中
    XXJButton * publishButton = [[XXJButton alloc]init];
    [publishButton setTitle:@"发布中" forState:UIControlStateNormal];
    [publishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [publishButton setImage:[UIImage imageNamed:@"posting"] forState:UIControlStateNormal];
    publishButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:publishButton];
    [publishButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self).offset(W(-15));
    }];
    
    //箭头
    UIImageView * publishForward = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"forward"]];
    [self addSubview:publishForward];
    [publishForward makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(publishButton.right);
        make.centerY.equalTo(publishButton).offset(H(10));
    }];
}

@end
