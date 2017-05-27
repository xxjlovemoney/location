//
//  ErrandInfoViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================底部视图 -> 跑腿服务-> 跑腿服务发单==================================

#import "ErrandInfoViewController.h"
#import "ErrandInfoScrollerView.h"

#import "SevericeOriginInfoViewController.h"
#import "SevericeEndInfoViewController.h"
#import "AffirmAndPayViewController.h"
@interface ErrandInfoViewController ()<ErrandInfoScrollerViewDelegate>
@property (nonatomic, strong) ErrandInfoScrollerView * errandScroll;
@end

@implementation ErrandInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"跑腿服务信息录入";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
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
    self.errandScroll = [[ErrandInfoScrollerView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    self.errandScroll.ButtonDelegate = self;
    [self.view addSubview:self.errandScroll];
}
//设置滚动范围
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.errandScroll.contentSize = CGSizeMake(0, self.errandScroll.maxHeight);
}
#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-green"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}

#pragma mark -- 导航栏左边返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


#pragma mark -- ErrandInfoScrollerViewDelegate  代理方法
//点击服务起点更多按钮
-(void)moreButtonClick
{
    SevericeOriginInfoViewController * orignInVc = [[SevericeOriginInfoViewController alloc]init];
    [self.navigationController pushViewController:orignInVc animated:YES];
}

//点击服务服务终点按钮
-(void)endButtonClick
{
    SevericeEndInfoViewController * endInVc = [[SevericeEndInfoViewController alloc]init];
    [self.navigationController pushViewController:endInVc animated:YES];
}

//点击确认
-(void)sureButtonClick
{
    AffirmAndPayViewController * afformVc = [[AffirmAndPayViewController alloc]init];
    [self.navigationController pushViewController:afformVc animated:YES];
}



@end
