//
//  SSDSideslipMyWalletViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 我的钱包==============================================

#import "SSDSideslipMyWalletViewController.h"
#import "MyWalletView.h"

#import "SSDRechargeViewController.h"//充值界面
#import "SSDDetailViewController.h"//交易明细
#import "SSDStatisticsViewController.h"//月度统计
@interface SSDSideslipMyWalletViewController ()<MyWalletViewDelegate>
@property (nonatomic, strong) MyWalletView * myWallet;
@end

@implementation SSDSideslipMyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的钱包";
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
    self.myWallet = [[MyWalletView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    self.myWallet.delegate  = self;
    [self.view addSubview:self.myWallet];
}

#pragma mark -- MyWalletViewDelegate代理方法
//充值
-(void)rechargeClick
{
    SSDRechargeViewController * rechargeVc = [[SSDRechargeViewController alloc]init];
    [self.navigationController pushViewController:rechargeVc animated:YES];
}
//交易明细
-(void)detailClick
{
    SSDDetailViewController * detailVc = [[SSDDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVc animated:YES];
}
//月度统计
-(void)statisticsClick
{
    SSDStatisticsViewController * statisticsVc = [[SSDStatisticsViewController alloc]init];
    [self.navigationController pushViewController:statisticsVc animated:YES];
}




#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-wallet"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    //    [self.publishView insertSubview:backImageView atIndex:0];
    [self.view addSubview:backImageView];
    
}
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
















@end
