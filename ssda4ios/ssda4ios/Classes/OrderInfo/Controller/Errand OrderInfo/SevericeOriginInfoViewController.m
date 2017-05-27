//
//  SevericeOriginInfoViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

//======================底部视图 -> 跑腿服务-> 跑腿服务发单 -> 服务起点更多按钮点击========================

#import "SevericeOriginInfoViewController.h"
#import "SevericeInfoView.h"


@interface SevericeOriginInfoViewController ()
@property (nonatomic, strong) SevericeInfoView * severiceInfo;
@end

@implementation SevericeOriginInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务起点信息录入";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    //设置背景图片
    [self setUpBackImage];
    
    //界面初始化
    [self setUpUI];
}


#pragma mark -- 导航栏左边返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.severiceInfo = [[SevericeInfoView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:self.severiceInfo];
    
    
    
}

#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG_Bill"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}


@end
