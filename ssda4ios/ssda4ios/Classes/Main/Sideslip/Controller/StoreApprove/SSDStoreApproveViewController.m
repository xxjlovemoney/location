//
//  SSDStoreApproveViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面->商家认证==============================================

#import "SSDStoreApproveViewController.h"
#import "SideslipStoreApprove.h"

@interface SSDStoreApproveViewController ()
@property (nonatomic, strong) SideslipStoreApprove * approveView;
@end

@implementation SSDStoreApproveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家认证";
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
    self.approveView = [[SideslipStoreApprove alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.approveView];
}

-(void)backBtn
{

    [self.navigationController popToRootViewControllerAnimated:YES];
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

@end
