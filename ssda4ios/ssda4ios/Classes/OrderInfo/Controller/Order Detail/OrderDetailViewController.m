//
//  OrderDetailViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

//===========底部视图 -> 外卖录单 -> 手动外卖录单 ->订单信息录入 -> 一键录入 -> 订单详情===================

#import "OrderDetailViewController.h"

#import "OrderDetailScrollView.h"
@interface OrderDetailViewController ()
@property (nonatomic, strong) OrderDetailScrollView * orderDetailView;



@end

@implementation OrderDetailViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = [UIColor colorWithHexValue:0xD8D8D8 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"top more"] target:self action:@selector(moreBtn)];
    
    //界面初始化
    [self setUpUI];

    
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.orderDetailView = [[OrderDetailScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 )];
    self.orderDetailView.bounces = NO;
    self.orderDetailView.showsVerticalScrollIndicator = NO;
    self.orderDetailView.contentSize = CGSizeMake(0, 1000);
    [self.view addSubview:self.orderDetailView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
}


#pragma mark -- 导航栏返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)moreBtn
{

}



@end
