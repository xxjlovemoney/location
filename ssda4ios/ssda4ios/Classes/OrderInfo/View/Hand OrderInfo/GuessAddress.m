//
//  GuessAddress.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 客人地址=====================

#import "GuessAddress.h"

@implementation GuessAddress

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
    
    //名称
    self.addressLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"客人地址"];
    [self addSubview:self.addressLable];
    [self.addressLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
        
    }];
    
    
    //详情按钮
    self.detailButton = [[UIButton alloc]init];
    [self.detailButton setImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    [self.detailButton sizeToFit];
    [self addSubview:self.detailButton];
    [self.detailButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.right).offset(W(-26));
        make.size.equalTo(CGSizeMake(W(20), H(20)));
    }];
    
    
    //详情地址
    self.detailAddressLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.6] textFont:14 text:@"请选择小区/大厦/学校"];
    [self addSubview:self.detailAddressLable];
    [self.detailAddressLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressLable.right).offset(W(20));
        make.centerY.equalTo(self);
//        make.right.equalTo(self.detailButton.left).offset(W(-20));
//        make.width.equalTo(W(100));
    }];
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
}
@end
