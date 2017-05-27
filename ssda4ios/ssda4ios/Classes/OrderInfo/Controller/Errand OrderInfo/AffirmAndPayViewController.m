//
//  AffirmAndPayViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

//======================底部视图 -> 跑腿服务-> 跑腿服务发单 -> 点击确认 ->确认/支付========================

#import "AffirmAndPayViewController.h"

#import "AffirmAndPayScrollerVeiw.h"
@interface AffirmAndPayViewController ()
@property (nonatomic, strong) AffirmAndPayScrollerVeiw * affirmView;
@end

@implementation AffirmAndPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认/支付";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    //设置背景图片
    [self setUpBackImage];
    
    //界面初始化
    [self setUpUI];
    
    //底部按钮增加
    [self setUpBottomView];

}


#pragma mark -- 底部按钮增加
-(void)setUpBottomView
{
    //底部图片
    UIImageView * bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"button"]];
    [self.view insertSubview:bottomImageView belowSubview:self.affirmView];
    //    [self.view addSubview:bottomImageView];
    [bottomImageView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(H(199));
    }];
    
    //二层底部图
    UIView * bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = RGBCOLOR(0, 129, 128);
    [self.view addSubview:bottomView];
    [bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(H(79));
    }];
    
    self.okPayButton = [[UIButton alloc]init];
    [self.okPayButton setTitle:@"确认并支付" forState:UIControlStateNormal];
    [self.okPayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.okPayButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [bottomView addSubview:self.okPayButton];
    [self.okPayButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomView);
        make.centerY.equalTo(bottomView);
    }];
    
}



#pragma mark -- 导航栏左边返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.affirmView = [[AffirmAndPayScrollerVeiw alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    self.affirmView.contentSize = CGSizeMake(0, H(586 + 20));
    [self.view addSubview:self.affirmView];

}

-(void)viewDidLayoutSubviews
{
//    [super viewDidLayoutSubviews];
//    self.affirmScrollerView.contentSize = CGSizeMake(0, H(584+20));
//    
}

#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-Pay"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}


@end
