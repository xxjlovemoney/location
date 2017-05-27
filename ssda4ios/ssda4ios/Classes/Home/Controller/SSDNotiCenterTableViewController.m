//
//  SSDNotiCenterTableViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================主界面-> 导航栏右边通知按钮 -> 通知界面=================================

#import "SSDNotiCenterTableViewController.h"
#import "NotiCenterTableViewCell.h"
@interface SSDNotiCenterTableViewController ()

@end

@implementation SSDNotiCenterTableViewController

static NSString * const NotiCellID = @"NotiCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通知中心";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"refresh"] target:self action:@selector(refreshBtn)];
    
    //注册自定义cell
    [self.tableView registerClass:[NotiCenterTableViewCell class] forCellReuseIdentifier:NotiCellID];
    
    //去除cell系统的下划线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)refreshBtn
{
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NotiCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NotiCellID];
    cell.titleLable.text = @"取消单手续费收取更新通知";
    cell.detailLable.text = @"取消单手续费收取更新通知取消单手续费收取更新通知取消单手续费收取更新通知取消单手续费收取更新通知取消单手续费收取更新通知";
    cell.dataLable.text = @"2017年4月15日";
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top"] forBarMetrics:UIBarMetricsDefault];
    
}


@end
