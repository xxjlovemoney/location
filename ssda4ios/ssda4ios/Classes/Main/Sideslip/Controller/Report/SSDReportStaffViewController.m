//
//  SSDReportStaffViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面->投诉举报->投诉随时达工作人员===================================

#import "SSDReportStaffViewController.h"
#import "ReportStaffView.h"
@interface SSDReportStaffViewController ()
@property (nonatomic, strong) ReportStaffView * reportStaffView;
@end

@implementation SSDReportStaffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"投诉随时达工作人员";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    
    //界面初始化
    [self setUpUI];
    
    
    
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.reportStaffView  = [[ReportStaffView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    [self.view addSubview:self.reportStaffView];
}



-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    //设置状态栏的颜色为黑色
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

-(void)viewWillDisappear:(BOOL)animated
{
    //设置状态栏的颜色为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}
@end
