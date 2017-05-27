//
//  SSDReportViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面->投诉举报==============================================



#import "SSDReportViewController.h"
#import "ReportView.h"
#import "SSDbillReportViewController.h"//订单相关投诉举报
#import "SSDReportStoreViewController.h"//投诉商家
#import "SSDReportDeliveryViewController.h"//投诉配送员
#import "SSDReportStaffViewController.h"
@interface SSDReportViewController ()<ReportViewDelegate>
@property (nonatomic, strong) ReportView * reportView;
@end

@implementation SSDReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"投诉举报";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    //设置背景图片
    [self setUpBackImage];
    //界面初始化
    [self setUpUI];
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.reportView = [[ReportView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    self.reportView.delegate = self;
    [self.view addSubview:self.reportView];
}


#pragma mark -- ReportViewDelegate  代理方法
//点击订单相关投诉代理方法
-(void)billReportBtnClick
{
    SSDbillReportViewController * billreportVc = [[SSDbillReportViewController alloc]init];
    [self.navigationController pushViewController:billreportVc animated:YES];
}
//点击投诉商家代理方法
-(void)reportStoreBtnClick
{
    SSDReportStoreViewController * storeReportVc = [[SSDReportStoreViewController alloc]init];
    [self.navigationController pushViewController:storeReportVc animated:YES];
}
//点击投诉配送员代理方法
-(void)reportDeliveryBtnClick
{
    SSDReportDeliveryViewController * deliveryReportVc = [[SSDReportDeliveryViewController alloc]init];
    [self.navigationController pushViewController:deliveryReportVc animated:YES];
}
//点击投诉随时达工作人员代理方法
-(void)reportStaffBtnClick
{
    SSDReportStaffViewController * staffReportVc = [[SSDReportStaffViewController alloc]init];
    [self.navigationController pushViewController:staffReportVc animated:YES];
}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

-(void)backBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
