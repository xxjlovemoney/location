//
//  ReportView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报==============================================

#import "ReportView.h"
#import "AboutMe.h"
@implementation ReportView

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
    //导航栏下面的下划线
//    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
//    [self addSubview:topImageViewLine];
//    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(H(1));
//        make.size.equalTo(CGSizeMake(W(375), H(1)));
//        make.centerX.equalTo(self);
//    }];
//    
    //订单相关投诉举报
    self.billReport = [[AboutMe alloc]init];
    self.billReport.nameLable.text = @"订单相关投诉举报";
    self.billReport.nameLable.font = [UIFont systemFontOfSize:17];
    self.billReport.detailLable.text = nil;
    self.billReport.moreBtn.userInteractionEnabled = NO;
    UITapGestureRecognizer  * billGesTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(billReportBtn)];
    [self.billReport addGestureRecognizer:billGesTap];
    [self addSubview:self.billReport];
    [self.billReport makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(133-64));
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    

    
    
    //其他问题
    UILabel * otherQuestion = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:18 text:@"其他问题:"];
    [self addSubview:otherQuestion];
    [otherQuestion makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.top.equalTo(self.billReport.bottom).offset(H(78));
        
    }];
    
    //投诉商家
    self.reportStore = [[AboutMe alloc]init];
    self.reportStore.nameLable.text = @"投诉商家";
    self.reportStore.nameLable.font = [UIFont systemFontOfSize:17];
    UITapGestureRecognizer  * storeGesTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reportStoreBtn)];
    [self.reportStore addGestureRecognizer:storeGesTap];
    self.reportStore.moreBtn.userInteractionEnabled = NO;
    self.reportStore.detailLable.text = nil;
    [self addSubview:self.reportStore];
    [self.reportStore makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(otherQuestion.bottom).offset(H(39));
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    //投诉配送人员
    self.reportDelivery = [[AboutMe alloc]init];
    self.reportDelivery.nameLable.font = [UIFont systemFontOfSize:17];
    self.reportDelivery.nameLable.text = @"投诉配送人员";
    UITapGestureRecognizer  * deliveryGesTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reportDeliveryBtn)];
    [self.reportDelivery addGestureRecognizer:deliveryGesTap];
    self.reportDelivery.moreBtn.userInteractionEnabled = NO;
    self.reportDelivery.detailLable.text = nil;
    [self addSubview:self.reportDelivery];
    [self.reportDelivery makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reportStore.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
    
    //投诉随时达工作人员
    self.reportStaff = [[AboutMe alloc]init];
    self.reportStaff.nameLable.font = [UIFont systemFontOfSize:17];
    self.reportStaff.nameLable.text = @"投诉随时达工作人员";
    UITapGestureRecognizer  * staffGesTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reportStaffBtn)];
    [self.reportStaff addGestureRecognizer:staffGesTap];
    self.reportStaff.moreBtn.userInteractionEnabled = NO;
    self.reportStaff.detailLable.text = nil;
    [self addSubview:self.reportStaff];
    [self.reportStaff makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reportDelivery.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(52)));
    }];
}



#pragma mark -- 订单相关投诉举报
-(void)billReportBtn
{
    if ([self.delegate respondsToSelector:@selector(billReportBtnClick)]) {
        [self.delegate billReportBtnClick];
    }
}
#pragma mark -- 订单相关投诉商家
-(void)reportStoreBtn
{
    if ([self.delegate respondsToSelector:@selector(reportStoreBtnClick)]) {
        [self.delegate reportStoreBtnClick];
    }
}
#pragma mark -- 订单相关投诉配送人员
-(void)reportDeliveryBtn
{
    if ([self.delegate respondsToSelector:@selector(reportDeliveryBtnClick)]) {
        [self.delegate reportDeliveryBtnClick];
    }}
#pragma mark -- 订单相关投诉随时达工作人员
-(void)reportStaffBtn
{
    if ([self.delegate respondsToSelector:@selector(reportStaffBtnClick)]) {
        [self.delegate reportStaffBtnClick];
    }
}










@end
