//
//  SSDSettingChangeNumberViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 更换登录手机号===================================

#import "SSDSettingChangeNumberViewController.h"
#import "ChangeNumberView.h"
@interface SSDSettingChangeNumberViewController ()
@property (nonatomic, strong) ChangeNumberView * changeNum;
@end

@implementation SSDSettingChangeNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"更换登录手机号";
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
    self.changeNum = [[ChangeNumberView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.changeNum addGestureRecognizer:tap];
    [self.view addSubview:self.changeNum];
}
#pragma mark -- 点击手势。 键盘退出
-(void)tapClick
{
    [self.changeNum endEditing:YES];
    
    
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
