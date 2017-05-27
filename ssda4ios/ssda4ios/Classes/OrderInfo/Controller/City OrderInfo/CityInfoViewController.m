//
//  CityInfoViewController.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=======================底部视图 -> 同城快递 -> 同城快递发单 ->同城信息快递录入=====================


#import "CityInfoViewController.h"
#import "CityInfoView.h"

#import "SenderInfoViewController.h"//寄放信息录入
#import "ReceiverInfoViewController.h"//设置收方信息
#import "AffirmViewController.h"//确认
@interface CityInfoViewController ()<CityInfoViewDelegate>
@property (nonatomic, strong) CityInfoView * cityInfo;


@end

@implementation CityInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"同城信息快递录入";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back"] target:self action:@selector(backBtn)];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //设置背景图片
    [self setUpBackImage];
    
    //界面初始化
    [self setUpUI];

}



#pragma mark -- 界面初始化
-(void)setUpUI
{
    self.cityInfo = [[CityInfoView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    self.cityInfo.delegate = self;
    [self.view addSubview:self.cityInfo];
    

    
}

#pragma mark -- CityInfoViewDelegate代理方法
//寄放更多按钮点击代理方法
-(void)senderDetailButtonClick
{
    SenderInfoViewController * senderInfoVc = [[SenderInfoViewController alloc]init];
    [self.navigationController pushViewController:senderInfoVc animated:YES];
}
//点击设置收方信息代理方法
-(void)receiverInfoButtonClick
{
    ReceiverInfoViewController * receiverInfoVc = [[ReceiverInfoViewController alloc]init];
    [self.navigationController pushViewController:receiverInfoVc animated:YES];
}

//确认按钮代理方法
-(void)OkButtonClick
{
    AffirmViewController * affirmVc = [[AffirmViewController alloc]init];
    [self.navigationController pushViewController:affirmVc animated:YES];
}




#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG_Bill"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self.view addSubview:backImageView];
    
}

#pragma mark -- 导航栏左边返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    
}


@end
