//
//  AboutMe.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->点击头像按钮->关于我内容封装==============================

#import "AboutMe.h"

@implementation AboutMe

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
    //nameLable
    //我的名称
    self.nameLable=  [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:15 text:@"我的名称"];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.nameLable];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.left).offset(W(33));
//        make.size.equalTo(CGSizeMake(W(100), H(30)));
    }];
    
    //更多按钮
    self.moreBtn = [[UIButton alloc]init];
    [self.moreBtn setImage:[UIImage imageNamed:@"forward white"] forState:UIControlStateNormal];
    [self.moreBtn sizeToFit];
    [self addSubview:self.moreBtn];
    [self.moreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerY);
        make.right.equalTo(self.right).offset(-W(23));
        make.size.equalTo(CGSizeMake(W(20), H(20)));
        
    }];
    
    //具体名称标签
    self.detailLable=  [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:15 text:@"俏西北国际美食中心"];
    self.detailLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.detailLable];
    [self.detailLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.moreBtn.left);
//        make.size.equalTo(CGSizeMake(100, 30));
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
}
@end
