//
//  SSDBizInfoCheckNotiViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoCheckNotiViewController.h"
#import "SSDBizInfoCheckNotiView.h"
@interface SSDBizInfoCheckNotiViewController ()<SSDBizInfoCheckNotiViewDelegate>
@property (nonatomic, strong) SSDBizInfoCheckNotiView * bizInfoCheckNotiView;
@end

@implementation SSDBizInfoCheckNotiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家认证-审核通知";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //界面初始化
    [self setUpUI];
    
    //设置背景图片
    [self setUpBackImage];
}

-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --界面初始化
-(void)setUpUI
{
    self.bizInfoCheckNotiView = [[SSDBizInfoCheckNotiView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//    self.bizInfoCheckNotiView.delegate = self;
    [self.view addSubview:self.bizInfoCheckNotiView];
    
}

#pragma mark -- 代理方法
-(void)updateButtonClick
{
    XXJLog(@"dadadasdasdadasas")
}

-(void)setUpBackImage
{
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.bizInfoCheckNotiView insertSubview:backImageView atIndex:0];
}

-(void)viewWillAppear:(BOOL)animated
{
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-blue"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}







@end
