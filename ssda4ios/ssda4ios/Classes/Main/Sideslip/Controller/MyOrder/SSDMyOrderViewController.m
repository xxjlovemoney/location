//
//  SSDMyOrderViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/12.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDMyOrderViewController.h"
#import "MyOrderScrollView.h"
#import "SSDHomeNavTitleView.h"
@interface SSDMyOrderViewController ()<SSDHomeNavTitleViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) MyOrderScrollView * orderScrollView;
@property (nonatomic, strong) SSDHomeNavTitleView * titleView;
@end

@implementation SSDMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"refresh"] target:self action:@selector(refreshBtn)];
    
    
    
    //界面初始化
    [self setUpUI];
    
    //设置导航栏标题栏
    [self setUpNavTitleView];
}

#pragma mark -- 设置导航栏标题栏
-(void)setUpNavTitleView
{
    self.titleView = [[SSDHomeNavTitleView alloc]initWithFrame:CGRectMake(0, 0, W(160), H(30))];
    if (WIDTH == 320) {
        self.titleView.frame = CGRectMake(0, 0, W(170), H(30));
    }
//    self.titleView.backgroundColor = [UIColor redColor];
    [self.titleView.publishButton setTitle:@"今日订单(8)" forState:UIControlStateNormal];
    [self.titleView.processButton setTitle:@"历史订单" forState:UIControlStateNormal];
    self.navigationItem.titleView = self.titleView;
    self.titleView.delegate = self;
}


#pragma mark -- SSDHomeNavTitleViewDelegate
-(void)publishButtonClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.orderScrollView.contentOffset = CGPointMake(0, 0);
    }];
    
}

-(void)processButtonClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.orderScrollView.contentOffset = CGPointMake(WIDTH, 0);
    }];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //下划线需要滚动的距离
    CGFloat length = self.titleView.processButton.xxj_centerX - self.titleView.publishButton.xxj_centerX;
    
    CGFloat i = length / WIDTH;

    self.titleView.lineView.xxj_x =  scrollView.contentOffset.x * i + self.titleView.lineView.xxj_width;
}






#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.orderScrollView = [[MyOrderScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - kMarginTopHeight)];
    self.orderScrollView.pagingEnabled = YES;
    self.orderScrollView.contentSize = CGSizeMake(WIDTH * 2, 0);
    self.orderScrollView.delegate = self;
    [self.view addSubview:self.orderScrollView];

}



-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)refreshBtn
{
    
}


#pragma mark -- 视图将要显示的时候，设置导航栏背景图片和侧滑视图的位置
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}


@end
