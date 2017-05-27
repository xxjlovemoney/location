//
//  ServingBtnView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/11.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=============================地图界面订单详情 ->顶部视图按钮 ->服务中按钮================================

#import "ServingBtnView.h"

@implementation ServingBtnView


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
    XXJButton * servingButton = [[XXJButton alloc]init];
    [servingButton setTitle:@"服务中" forState:UIControlStateNormal];
    [servingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [servingButton setImage:[UIImage imageNamed:@"in transit"] forState:UIControlStateNormal];
    servingButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:servingButton];
    [servingButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self).offset(W(-15));
    }];
    
    //箭头
    UIImageView * publishForward = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"forward"]];
    [self addSubview:publishForward];
    [publishForward makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(servingButton.right);
        make.centerY.equalTo(servingButton).offset(H(10));
    }];
}


@end
