//
//  SSDStatisticsViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDStatisticsViewController.h"
#import "DetailHeaderView.h"
#import "StatisticsTableViewCell.h"
@interface SSDStatisticsViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SSDStatisticsViewController

static NSString * const HeaderId = @"HeaderId";
static NSString * const cellID = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"月度统计";
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
    UITableView * statictisTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    statictisTableView.delegate = self;
    statictisTableView.dataSource = self;
    [self.view addSubview:statictisTableView];
    
    //注册自定义组头视图
    [statictisTableView registerClass:[DetailHeaderView class] forHeaderFooterViewReuseIdentifier:HeaderId];

    //注册自定义cell
    [statictisTableView registerClass:[StatisticsTableViewCell class] forCellReuseIdentifier:cellID];
    
    
    //去除cell系统的下划线
    statictisTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    StatisticsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.dataLable.text = @"2017年6月";
    cell.incomeMoneyLable.text = @"68.0";
    cell.outcomeMoneyLable.text = @"1680.0";
    cell.remainMoneyLable.text = @"98.0";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DetailHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderId];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 29;
}



@end
