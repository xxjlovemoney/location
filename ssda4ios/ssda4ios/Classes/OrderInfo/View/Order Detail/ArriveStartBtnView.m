//
//  ArriveStartBtnView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/11.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=============================地图界面订单详情 ->顶部视图按钮 ->到起点按钮================================

#import "ArriveStartBtnView.h"

@implementation ArriveStartBtnView

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
    XXJButton * arriveStartButton = [[XXJButton alloc]init];
    [arriveStartButton setTitle:@"到起点" forState:UIControlStateNormal];
    [arriveStartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [arriveStartButton setImage:[UIImage imageNamed:@"arrive start"] forState:UIControlStateNormal];
    arriveStartButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:arriveStartButton];
    [arriveStartButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self).offset(W(-15));
    }];
    
    //箭头
    UIImageView * publishForward = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"forward"]];
    [self addSubview:publishForward];
    [publishForward makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(arriveStartButton.right);
        make.centerY.equalTo(arriveStartButton).offset(H(10));
    }];
}


@end
