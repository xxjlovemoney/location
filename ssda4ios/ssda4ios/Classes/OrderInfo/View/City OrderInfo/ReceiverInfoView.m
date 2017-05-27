//
//  ReceiverInfoView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

//===============底部视图 -> 外卖录单 -> 同城快递信息录入 ->寄放更多按钮点击 -> 收方信息录入=============

#import "ReceiverInfoView.h"
#import "GuestName.h"
#import "GuestPhone.h"
#import "GuessAddress.h"
#import "GuestAddressNext.h"

#import "HistoryTableViewCell.h"

@interface ReceiverInfoView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HistoryTableViewCell * cell;

@end
@implementation ReceiverInfoView
static NSString * const historyCellID = @"historyCellID";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //界面初始化
        [self setUpUI];
        
        //注册cell
        [self.historyTableView registerClass:[HistoryTableViewCell class] forCellReuseIdentifier:historyCellID];
        
        
        //增加点击手势
        [self setUpTapGes];
    }
    return self;
}

//界面初始化
-(void)setUpUI
{
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    //收方名字
    self.receiverName = [[GuestName alloc]init];
    self.receiverName.nameLable.text = @"收方名字";
    self.receiverName.manButton.selected = YES;
    [self addSubview:self.receiverName];
    [self.receiverName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewLine.bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(40));
    }];
    //收方电话
    self.receiverPhone = [[GuestPhone alloc]init];
    self.receiverPhone.phoneLable.text = @"收方电话";
    self.receiverPhone.changeButton.selected = YES;
    [self addSubview:self.receiverPhone];
    [self.receiverPhone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiverName.bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(40));
    }];
    //收方地址
    self.receiverAddress = [[GuessAddress alloc]init];
    self.receiverAddress.addressLable.text = @"收方地址";
    [self addSubview:self.receiverAddress];
    [self.receiverAddress makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiverPhone.bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(40));
    }];
    //地址下一行
    self.receiverAddressNext = [[GuestAddressNext alloc]init];
    [self addSubview:self.receiverAddressNext];
    [self.receiverAddressNext makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiverAddress.bottom);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(40));
    }];
    //历史地址
    self.historyLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"历史地址"];
    [self addSubview:self.historyLable];
    [self.historyLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.receiverAddressNext.bottom).offset(H(22));
    }];
    
    
    //tableView
    self.historyTableView = [[UITableView alloc]init];
    self.historyTableView.backgroundColor = [UIColor clearColor];
    self.historyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.historyTableView.delegate = self;
    self.historyTableView.dataSource =self;
    self.userInteractionEnabled = YES;
    [self addSubview:self.historyTableView];
    [self.historyTableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.historyLable.bottom).offset(H(15));
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
    
    self.cell = [tableView dequeueReusableCellWithIdentifier:historyCellID];
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

#pragma mark -- 增加点击手势
-(void)setUpTapGes
{
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGes)];
    [self addGestureRecognizer:tapGes];
}

-(void)tapGes
{
    [self.receiverName.nameField resignFirstResponder];
    [self.receiverPhone.phoneField resignFirstResponder];
    
}


@end
