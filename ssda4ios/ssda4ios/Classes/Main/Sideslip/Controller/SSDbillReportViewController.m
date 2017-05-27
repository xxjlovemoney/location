//
//  SSDbillReportViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面->投诉举报->订单相关投诉举报=======================================

#import "SSDbillReportViewController.h"
#import "ReportBillView.h"
@interface SSDbillReportViewController ()
@property (nonatomic, strong) ReportBillView * billView;
@end

@implementation SSDbillReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"投诉举报";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    
    //界面初始化
    [self setUpUI];
    
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.billView = [[ReportBillView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.billView];
}


-(void)backBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
//    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];

}

@end
