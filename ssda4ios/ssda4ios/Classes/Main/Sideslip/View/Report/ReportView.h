//
//  ReportView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AboutMe;

@protocol ReportViewDelegate <NSObject>
//侧滑界面->投诉举报->订单相关投诉举报代理方法
-(void)billReportBtnClick;
//侧滑界面->投诉举报->订单相关投诉商家代理方法
-(void)reportStoreBtnClick;
//侧滑界面->投诉举报->订单相关投诉配送人员代理方法
-(void)reportDeliveryBtnClick;
//侧滑界面->投诉举报->订单相关投诉随时达工作人员代理方法
-(void)reportStaffBtnClick;

@end
@interface ReportView : UIView

//订单相关投诉举报
@property (nonatomic, strong) AboutMe * billReport;
//投诉商家
@property (nonatomic, strong) AboutMe * reportStore;
//投诉配送人员
@property (nonatomic, strong) AboutMe * reportDelivery;
//投诉随时达工作人员
@property (nonatomic, strong) AboutMe * reportStaff;


@property (nonatomic, weak) id<ReportViewDelegate> delegate;

@end
