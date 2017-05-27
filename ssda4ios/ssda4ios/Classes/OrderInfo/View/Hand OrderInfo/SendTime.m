//
//  SendTime.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 配送时间=====================

#import "SendTime.h"

@interface SendTime ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation SendTime
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
    //配送时间
    self.timeLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"配送时间"];
    [self addSubview:self.timeLable];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
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
        make.centerY.equalTo(self);
        make.left.equalTo(self.timeLable.right).offset(W(23));
    }];
    
    //预约
    self.appointTimeButton = [UIButton buttonWithTitle:@"预约(点击选择送达时间)" NormalbackImageTitle:@"trans botton 172x21" SelectedbackImageTitle:@"white botton 172x21"];
    [self.appointTimeButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.appointTimeButton];
    [self.appointTimeButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        if (WIDTH == 320) {
            make.left.equalTo(self.currentTimeButton.right).offset(W(10));
            make.size.equalTo(CGSizeMake(W(145), H(21)));
        }else
        {
            make.left.equalTo(self.currentTimeButton.right).offset(W(20));
        }
    }];
    
    
    

    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
}



#pragma mark -- 实时。预约按钮点击事件
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
