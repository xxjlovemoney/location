//
//  SevericeTime.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 服务时间======================

#import "SevericeTime.h"

@interface SevericeTime ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation SevericeTime
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //服务时间
    UILabel * severiceLabe = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"服务时间"];
    [self addSubview:severiceLabe];
    [severiceLabe makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //实时
    self.currentTimeButton = [UIButton buttonWithTitle:@"实时" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    self.currentTimeButton.selected = YES;
    self.preBtn = self.currentTimeButton;
    [self.currentTimeButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.currentTimeButton];
    [self.currentTimeButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(severiceLabe.right).offset(W(23));
        make.top.equalTo(self).offset(H(10));
        
    }];
    
    //预约
    self.appointTimeButton = [UIButton buttonWithTitle:@"预约(点击选择送达时间)" NormalbackImageTitle:@"trans botton 172x21" SelectedbackImageTitle:@"white botton 172x21"];
    [self.appointTimeButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.appointTimeButton];
    [self.appointTimeButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.currentTimeButton.right).offset(W(10));
            make.size.equalTo(CGSizeMake(W(145), H(21)));
        }else
        {
            make.left.equalTo(self.currentTimeButton.right).offset(W(20));
        }
        make.top.equalTo(self).offset(H(10));
    }];
    
    
    //加号
    self.plusButton = [[UIButton alloc]init];
    [self.plusButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [self addSubview:self.plusButton];
    [self.plusButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-26));
        make.top.equalTo(self.currentTimeButton.bottom).offset(H(16));
    }];
    
    
    //减号
    self.minusButton = [[UIButton alloc]init];
    [self.minusButton setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];
    [self addSubview:self.minusButton];
    [self.minusButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.right.equalTo(self.plusButton.left).equalTo(W(-15));
        }else
        {
            make.right.equalTo(self.plusButton.left).equalTo(W(-22));
        }
        
        make.centerY.equalTo(self.plusButton);
    }];
    
    //小时
    UILabel * hour = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:12 text:@"小时"];
    [self addSubview:hour];
    [hour makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.right.equalTo(self.minusButton.left).offset(W(-10));
        }
        else
        {
            make.right.equalTo(self.minusButton.left).offset(W(-25));
        }
        make.centerY.equalTo(self.plusButton);
    }];
    
    //多少小时
    self.hourLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:12 text:@"0.0"];
    [self addSubview:self.hourLable];
    [self.hourLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(hour.left);
        make.centerY.equalTo(self.plusButton);
    }];
    
    //预计滞留时间
    UILabel * timeLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:12 text:@"预计滞留时间"];
    [self addSubview:timeLable];
    [timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.currentTimeButton.left);
        make.centerY.equalTo(self.plusButton.centerY);
    }];
    
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(80));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
}



#pragma mark -- 性别按钮 点击事件
-(void)btnClick:(UIButton *)sender
{
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
}




























@end
