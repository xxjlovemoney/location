//
//  SSDAboutViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 关于===================================

#import "SSDAboutViewController.h"
#import "AboutView.h"
@interface SSDAboutViewController ()
@property (nonatomic, strong) AboutView * aboutV;
@end

@implementation SSDAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于";
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
    self.aboutV = [[AboutView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.aboutV];
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
