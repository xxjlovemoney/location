//
//  SenderInfo.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 同城快递 -> 同城快递发单内容封装 -> 寄放信息========================

#import "SenderInfo.h"

@implementation SenderInfo
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
    //寄方
    UILabel * senderLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"寄      方"];
    [self addSubview:senderLable];
    [senderLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(33));
        make.top.equalTo(self).offset(H(28));
    }];
    
    //寄放具体信息
    self.detailSenderLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"312311234123123123123123123123123123123123123123123123"];
    self.detailSenderLable.numberOfLines = 0;
    [self addSubview:self.detailSenderLable];
    [self.detailSenderLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(senderLable.right).offset(W(20));
        make.top.equalTo(senderLable.top);
//        make.size.equalTo(CGSizeMake(W(180), H(55)));
        make.width.equalTo(W(170));
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
