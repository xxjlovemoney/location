//
//  OrderInfoViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

//===========================底部视图 -> 外卖录单 -> 手动外卖录单 ->订单信息录入===================



#import "OrderInfoViewController.h"

#import "OrderInfoView.h"
#import "OrderDetailViewController.h"
@interface OrderInfoViewController ()<OrderInfoViewDelegate>

@property (nonatomic, strong) OrderInfoView * infoView;
@property (nonatomic, assign) BOOL textFieldBooL;
@end

@implementation OrderInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单信息录入";
    
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    //右边文字按钮
    UIButton * rightBtn = [[UIButton alloc]init];
    [rightBtn setTitle:@"收费规则" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    //设置背景图片
    [self setUpBackImage];
    
    //界面初始化
    [self setUpUI];
    
}



#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.infoView = [[OrderInfoView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    self.infoView.delegate = self;
    [self.view addSubview:self.infoView];
    
}

#pragma mark -- OrderInfoViewDelegate代理方法
//一键录入按钮点击代理方法
-(void)quickBillButtonClick
{
    OrderDetailViewController * orderDetailVc = [[OrderDetailViewController alloc]init];
    [self.navigationController pushViewController:orderDetailVc animated:YES];
}

#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG_Bill"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}

#pragma mark -- 导航栏右边规则按钮
-(void)ruleBtn
{
    
}

#pragma mark -- 导航栏左边返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


@end
