//
//  EndBtnView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/11.
//  Copyright © 2017年 gaga. All rights reserved.
//


//=============================地图界面订单详情 ->顶部视图按钮 ->已结束按钮================================

#import "EndBtnView.h"

@implementation EndBtnView

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
    XXJButton * endButton = [[XXJButton alloc]init];
    [endButton setTitle:@"已结束" forState:UIControlStateNormal];
    [endButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [endButton setImage:[UIImage imageNamed:@"finished"] forState:UIControlStateNormal];
    endButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:endButton];
    [endButton makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.left.equalTo(self).offset(W(-15));
    }];
    

}



@end
