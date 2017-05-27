//
//  SSDStoreRuleViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/13.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDStoreRuleViewController.h"
#import "StoreRuleView.h"
@interface SSDStoreRuleViewController ()
@property (nonatomic, strong) StoreRuleView * storeRule;
@end

@implementation SSDStoreRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家管理规则";
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
    self.storeRule = [[StoreRuleView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.storeRule];
}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-wallet"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
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
