//
//  AffirmSenderReceiverInfo.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

//===============底部视图 -> 外卖录单 -> 同城快递信息录入 ->点击确认 -> 寄方（收方）信息封装=============

#import "AffirmSenderReceiverInfo.h"

@implementation AffirmSenderReceiverInfo

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
    self.infoLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"寄      方"];
    [self addSubview:self.infoLable];
    [self.infoLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //详细信息
    self.detailLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"梁山伯 先生，18965236984 上海市浦东新区沈梅路888弄宇宙智慧湾66号101室"];
    self.detailLable.numberOfLines = 0;
    [self addSubview:self.detailLable];
    [self.detailLable makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.width.equalTo(W(200));
        }else
        {
            make.width.equalTo(W(160));
        }
        make.left.equalTo(self.infoLable.right).offset(W(23));
        make.centerY.equalTo(self);
        
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLable.bottom).offset(H(10));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
}

@end
