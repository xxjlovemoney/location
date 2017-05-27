//
//  SSDQickBillViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 一键发单设置===================================

#import "SSDQickBillViewController.h"
#import "QuickBillView.h"
@interface SSDQickBillViewController ()
@property (nonatomic, strong) QuickBillView * quickBill;
@end

@implementation SSDQickBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"一键发单设置";
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
    self.quickBill = [[QuickBillView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.quickBill addGestureRecognizer:tap];
    [self.view addSubview:self.quickBill];
}
#pragma mark -- 点击手势。 键盘退出
-(void)tapClick
{
    [self.quickBill endEditing:YES];
    
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
