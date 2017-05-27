//
//  ReportBillReasonView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报->订单相关投诉内容封装=============================

#import "ReportBillReasonView.h"

@implementation ReportBillReasonView

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
    //按钮
    self.chooseBtn = [[UIButton alloc]init];
    [self.chooseBtn setImage:[UIImage imageNamed:@"not choosed blue"] forState:UIControlStateNormal];
    [self.chooseBtn setImage:[UIImage imageNamed:@"choosed blue"] forState:UIControlStateSelected];
    [self.chooseBtn sizeToFit];
    [self addSubview:self.chooseBtn];
    [self.chooseBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(20), H(20)));
        
    }];
    
    //原因标签
    self.reasonLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x131313 alpha:1.0] textFont:14 text:nil];
//    self.reasonLable.font=[UIFont boldSystemFontOfSize:]
    [self addSubview:self.reasonLable];
    [self.reasonLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.chooseBtn.right).offset(W(7));
    }];
    
}

@end
