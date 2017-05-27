//
//  SSDSideslipSettingViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置==============================================

#import "SSDSideslipSettingViewController.h"
#import "SettingView.h"

#import "SSDSettingChangeNumberViewController.h"//更换登录手机号
#import "SSDQickBillViewController.h"//一键发单
#import "SSDAboutViewController.h"//关于
@interface SSDSideslipSettingViewController ()<SettingViewDelegate>
@property (nonatomic, strong) SettingView * setView;
@end

@implementation SSDSideslipSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
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
    self.setView = [[SettingView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    self.setView.delegate = self;
    [self.view addSubview:self.setView];
}

#pragma mark -- 代理方法 SettingViewDelegate
//更换登录手机号
-(void)changeNumberBtnClick
{
    SSDSettingChangeNumberViewController * changeNumberVc = [[SSDSettingChangeNumberViewController alloc]init];
    [self.navigationController pushViewController:changeNumberVc animated:YES];
}
//设置一键发单
-(void)quickBillBtnClick
{
    SSDQickBillViewController * quickBillVc = [[SSDQickBillViewController alloc]init];
    [self.navigationController pushViewController:quickBillVc animated:YES];
}
//关于
-(void)aboutBtnClick
{
    SSDAboutViewController * aboutVc = [[SSDAboutViewController alloc]init];
    [self.navigationController pushViewController:aboutVc animated:YES];
}
//退出登录
-(void)logOutBtnClick
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
    [self.navigationController popViewControllerAnimated:YES];
}


@end
