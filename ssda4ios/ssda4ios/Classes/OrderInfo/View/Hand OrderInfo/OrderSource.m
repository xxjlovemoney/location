//
//  OrderSource.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 订单来源=====================

#import "OrderSource.h"

@interface OrderSource ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation OrderSource
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
    //订单来源
    self.sourceLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"订单来源"];
    [self addSubview:self.sourceLable];
    [self.sourceLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //饿了吗
    self.hungryButton = [UIButton buttonWithTitle:@"饿了吗" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    self.hungryButton.selected = YES;
    self.preBtn = self.hungryButton;
    [self.hungryButton addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.hungryButton];
    [self.hungryButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceLable.right).offset(23);
        make.centerY.equalTo(self);
    }];
    
    //美团
    self.meituanButton = [UIButton buttonWithTitle:@"美团" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    [self.meituanButton addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.meituanButton];
    [self.meituanButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.hungryButton.right).offset(W(10));
        }else
        {
            make.left.equalTo(self.hungryButton.right).offset(W(15));
        }
        make.centerY.equalTo(self);
    }];
    
    //百度
    self.baiduButton = [UIButton buttonWithTitle:@"百度" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    [self.baiduButton addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.baiduButton];
    [self.baiduButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.meituanButton.right).offset(W(10));
        }else
        {
            make.left.equalTo(self.meituanButton.right).offset(W(15));
        }
        make.centerY.equalTo(self);
    }];
    
    //其他
    self.otherButton = [UIButton buttonWithTitle:@"其他" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    [self.otherButton addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.otherButton];
    [self.otherButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.baiduButton.right).offset(W(10));
        }else
        {
            make.left.equalTo(self.baiduButton.right).offset(W(15));
        }
        make.centerY.equalTo(self);
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

#pragma mark -- 来源按钮点击事件
-(void)buttonSelected:(UIButton *)sender
{
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
}












@end
