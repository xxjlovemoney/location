//
//  SSDBizInfoCheckViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoCheckViewController.h"
#import "SSDBizInfoCheckView.h"
#import "SSDBizInfoCheckNotiViewController.h"
@interface SSDBizInfoCheckViewController ()<SSDBizInfoCheckViewDelegate>
@property (nonatomic, strong) SSDBizInfoCheckView * bizinfoCheckView;
@end

@implementation SSDBizInfoCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家认证-审核中";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //界面初始化
    [self setUpUI];
    
    //设置背景图片
    [self setUpBackImage];
}


#pragma mark -- 返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-blue"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //设置statueBar的颜色为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
}
-(void)setUpUI
{
    self.bizinfoCheckView = [[SSDBizInfoCheckView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.bizinfoCheckView.delegate = self;
    [self.view addSubview:self.bizinfoCheckView];

}

#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.bizinfoCheckView insertSubview:backImageView atIndex:0];

}

#pragma mark -- 代理方法
-(void)OKButtonClick
{
    XXJLog(@"点击测试")
    SSDBizInfoCheckNotiViewController * noti = [[SSDBizInfoCheckNotiViewController alloc]init];
    [self.navigationController pushViewController:noti animated:YES];
}

@end
