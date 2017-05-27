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
#import "SSDbillReportViewController.h"
@interface SSDReportViewController ()<ReportViewDelegate>
@property (nonatomic, strong) ReportView * reportView;
@end

@implementation SSDReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"投诉举报";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
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

}
//点击投诉配送员代理方法
-(void)reportDeliveryBtnClick
{

}
//点击投诉随时达工作人员代理方法
-(void)reportStaffBtnClick
{

}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    //    [self.publishView insertSubview:backImageView atIndex:0];
    [self.view addSubview:backImageView];
    
}

-(void)backBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
