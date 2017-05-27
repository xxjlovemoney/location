//
//  SSDDetailViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==================================侧滑界面-> 我的钱包 -> 交易明细===================================

#import "SSDDetailViewController.h"
#import "DetailHeaderView.h"
#import "DetailTableViewCell.h"
@interface SSDDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SSDDetailViewController

static NSString * const SSDHeaderId = @"header";
 static NSString * const cellId = @"cellId";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"交易明细";
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
    UITableView * detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    detailTableView.delegate = self;
    detailTableView.dataSource = self;
    [self.view addSubview:detailTableView];
    
    //注册自定义组头视图
    [detailTableView registerClass:[DetailHeaderView class] forHeaderFooterViewReuseIdentifier:SSDHeaderId];
    
    //注册自定义cell
    [detailTableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:cellId];
    
    
    //去除cell系统的下划线
    detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-wallet"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    //    [self.publishView insertSubview:backImageView atIndex:0];
    [self.view addSubview:backImageView];
    
}

-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.dayLable.text = @"今天";
    cell.dataLable.text = @"4-15";
    cell.timeLable.text = @"12:30";
    cell.moneyLable.text = @"- 8.00";
    cell.detailLable.text = @"订单12568954268配送费";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DetailHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SSDHeaderId];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 29;
}







@end
