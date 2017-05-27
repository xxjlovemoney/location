//
//  SSDSideslipAboutMeViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面->顶部（关于我）==============================================

#import "SSDSideslipAboutMeViewController.h"
#import "SideslpiAboutMe.h"
#import "AboutMe.h"
@interface SSDSideslipAboutMeViewController ()
@property (nonatomic, strong) SideslpiAboutMe * sideslipaboutV;
@end

@implementation SSDSideslipAboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"关于我";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-blue"] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置背景图片
    [self setUpBackImage];
    
    //界面初始化
    [self setUpUI];
    

}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.sideslipaboutV = [[SideslpiAboutMe alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.sideslipaboutV];
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
