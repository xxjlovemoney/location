//
//  SevericeInfoEndView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

//======================底部视图 -> 跑腿服务-> 跑腿服务发单 -> 服务终点按钮点击========================

#import "SevericeInfoEndView.h"

#import "GuessAddress.h"
#import "GuestAddressNext.h"

#import "HistoryTableViewCell.h"

@interface SevericeInfoEndView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HistoryTableViewCell * cell;
@end

@implementation SevericeInfoEndView

static NSString * const endHistoryCellID = @"endHistoryCellID";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        //注册cell
        [self.endHistoryTableView registerClass:[HistoryTableViewCell class] forCellReuseIdentifier:endHistoryCellID];
        
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //服务终点
    self.severiceEnd = [[GuessAddress alloc]init];
    self.severiceEnd.addressLable.text = @"服务终点";
    [self addSubview:self.severiceEnd];
    [self.severiceEnd makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewLine.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //下一行
    self.severiceEndNext = [[GuestAddressNext alloc]init];
    [self addSubview:self.severiceEndNext];
    [self.severiceEndNext makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceEnd.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(H(40));
    }];
    
    //历史地址
    UILabel * historyLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"历史地址"];
    [self addSubview:historyLable];
    [historyLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.severiceEndNext.bottom).offset(H(32));
    }];
    
    //tableView
    self.endHistoryTableView = [[UITableView alloc]init];
    self.endHistoryTableView.backgroundColor = [UIColor clearColor];
    self.endHistoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.endHistoryTableView.delegate = self;
    self.endHistoryTableView.dataSource =self;
    self.userInteractionEnabled = YES;
    [self addSubview:self.endHistoryTableView];
    [self.endHistoryTableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(historyLable.bottom).offset(H(15));
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(300));
    }];
    
}


#pragma mark -- UITableViewDelegate,UITableViewDataSource代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.cell = [tableView dequeueReusableCellWithIdentifier:endHistoryCellID];
    return self.cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cell.chooseButton.selected = YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
