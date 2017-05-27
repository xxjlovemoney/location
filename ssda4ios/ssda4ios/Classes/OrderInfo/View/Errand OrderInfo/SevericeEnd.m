//
//  SevericeEnd.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 服务终点======================

#import "SevericeEnd.h"

@implementation SevericeEnd
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
    //服务终点
    UILabel * severiceLabe = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"服务终点"];
    [self addSubview:severiceLabe];
    [severiceLabe makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    
    //点击设置服务终点
    self.endButton = [[UIButton alloc]init];
    [self.endButton setTitle:@"点击设置服务终点" forState:UIControlStateNormal];
    self.endButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.endButton setBackgroundImage:[UIImage imageNamed:@"setting address"] forState:UIControlStateNormal];
    [self addSubview:self.endButton];
    [self.endButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(severiceLabe.right).offset(W(23));
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(60));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    

}

@end
