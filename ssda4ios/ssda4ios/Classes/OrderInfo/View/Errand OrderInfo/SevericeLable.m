//
//  SevericeLable.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 服务标签======================

#import "SevericeLable.h"

@interface SevericeLable ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation SevericeLable
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
    //物品种类
    self.kindLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"服务标签\n(可多选)"];
    self.kindLable.numberOfLines = 0;
    [self addSubview:self.kindLable];
    [self.kindLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //代购
    self.help_BuyButton = [UIButton buttonWithTitle:@"代购" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    self.help_BuyButton.selected = YES;
    self.preBtn = self.help_BuyButton;
    [self.help_BuyButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.help_BuyButton];
    [self.help_BuyButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(14));
        make.left.equalTo(self.kindLable.right).offset(W(23));
    }];
    
    //待排队
    self.help_QueueButton = [UIButton buttonWithTitle:@"代排队" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.help_QueueButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.help_QueueButton];
    [self.help_QueueButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.help_BuyButton.right).offset(W(6));
        }else
        {
            make.left.equalTo(self.help_BuyButton.right).offset(W(20));
        }
        make.top.equalTo(self.top).offset(H(14));
        
    }];
    
    //代办事
    self.help_WorkButton = [UIButton buttonWithTitle:@"带办事" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.help_WorkButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.help_WorkButton];
    [self.help_WorkButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.help_QueueButton.right).offset(W(6));
        }else
        {
            make.left.equalTo(self.help_QueueButton.right).offset(W(20));
        }
        make.top.equalTo(self.top).offset(H(14));
        
    }];
    
    //代取物
    self.help_FetchButton = [UIButton buttonWithTitle:@"代取物" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.help_FetchButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.help_FetchButton];
    [self.help_FetchButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.help_BuyButton.bottom).offset(H(14));
        make.left.equalTo(self.kindLable.right).offset(W(23));
    }];
    
    
    //其他
    self.otherButton = [UIButton buttonWithTitle:@"其他" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.otherButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.otherButton];
    [self.otherButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.help_FetchButton.right).offset(W(6));
        }
        else
        {
            make.left.equalTo(self.help_FetchButton.right).offset(W(20));
        }
        make.top.equalTo(self.help_BuyButton.bottom).offset(H(14));
        
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(85));
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
