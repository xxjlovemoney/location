//
//  SevericeOrigin.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 服务起点=====================

#import "SevericeOrigin.h"

@implementation SevericeOrigin

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
    //服务起点
    UILabel * severiceLabe = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"服务起点"];
    [self addSubview:severiceLabe];
    [severiceLabe makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    
    
    //更多按钮
    self.moreButton = [[UIButton alloc]init];
    [self.moreButton setImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    [self.moreButton sizeToFit];
    [self addSubview:self.moreButton];
    [self.moreButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.right).offset(W(-26));
        make.size.equalTo(CGSizeMake(W(20), H(20)));
    }];
    
    //起点详情
    self.detailSevericeOrigin = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"上海市浦东新区沪南公路1099号四九干洗店"];
    self.detailSevericeOrigin.numberOfLines = 0;
    [self addSubview:self.detailSevericeOrigin];
    [self.detailSevericeOrigin makeConstraints:^(MASConstraintMaker *make) {
//        if (WIDTH == 320) {
//            make.width.equalTo(W(<#float#>))
//        }
        make.left.equalTo(severiceLabe.right).offset(W(23));
        make.right.equalTo(self.moreButton).offset(W(-23));
        make.centerY.equalTo(self);
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
