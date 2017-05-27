//
//  MyOrderScrollView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/12.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "MyOrderScrollView.h"
#import "OrderTableViewCell.h"
@interface MyOrderScrollView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * todayTableView;
@property (nonatomic, strong) UITableView * historyTableView;
@end
@implementation MyOrderScrollView

static NSString * const myorderCellId = @"myorderCellId";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        [self.todayTableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier:myorderCellId];
        
        [self.historyTableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier:myorderCellId];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //今日订单
    self.todayTableView = [[UITableView alloc]init];
    self.todayTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.todayTableView.delegate = self;
    self.todayTableView.dataSource =self;
    self.userInteractionEnabled = YES;
    [self addSubview:self.todayTableView];

    
    //历史订单
    self.historyTableView = [[UITableView alloc]init];
    self.historyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource =self;
    self.userInteractionEnabled = YES;
    [self addSubview:self.historyTableView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.todayTableView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    self.historyTableView.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
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
    if ([tableView isEqual:self.todayTableView]) {
        OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:myorderCellId];
        return cell;
    }
    else
    {
        OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:myorderCellId];
        return cell;
    }

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

@end
