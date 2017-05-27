//
//  ReceivingBtnView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/11.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=============================地图界面订单详情 ->顶部视图按钮 ->已派单按钮================================

#import "ReceivingBtnView.h"

@implementation ReceivingBtnView

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
    XXJButton * receivingButton = [[XXJButton alloc]init];
    [receivingButton setTitle:@"已派单" forState:UIControlStateNormal];
    [receivingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [receivingButton setImage:[UIImage imageNamed:@"arranged"] forState:UIControlStateNormal];
    receivingButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:receivingButton];
    [receivingButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self).offset(W(-15));
    }];
    
    //箭头
    UIImageView * publishForward = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"forward"]];
    [self addSubview:publishForward];
    [publishForward makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(receivingButton.right);
        make.centerY.equalTo(receivingButton).offset(H(10));
    }];
}


@end
