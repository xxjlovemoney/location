//
//  SSDBizInfoViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoViewController.h"
#import "SSDBizInfoVIew.h"
#import "SSDBizInfoStep-2ViewController.h"

#import "SSDBizInfoMapViewController.h"
@interface SSDBizInfoViewController ()<SSDBizInfoVIewDelegate>
@property(nonatomic,strong)SSDBizInfoVIew * bizInfoView;

@property (nonatomic, strong) UIAlertController *alert;
@end

@implementation SSDBizInfoViewController
//-(NSDictionary *)dataDictionary
//{
//    if (self.dataDictionary == nil) {
//        self.dataDictionary = [[NSDictionary alloc]init];
//    }
//    return self.dataDictionary;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"商家认证-填写基本信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    //界面初始化
    [self setUPUI];
    
    
    
}


#pragma mark -- 界面初始化
-(void)setUPUI
{
    self.bizInfoView = [[SSDBizInfoVIew alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    self.bizInfoView.delegate = self;
    [self.view addSubview:self.bizInfoView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
    
    //设置statueBar的颜色为heis
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


#pragma mark -- 导航栏返回按钮
-(void)backBtn
{
    //
//    if (self.bizInfoView.nameStr.length != 0 || self.bizInfoView.idStr.length != 0 || self.bizInfoView.merchantStr.length != 0 || self.bizInfoView.contactStr.length != 0 || self.bizInfoView.addressStr.length != 0 || self.bizInfoView.locationStr.length != 0 || self.bizInfoView.adStr.length != 0 || self.bizInfoView.nameTextFieldBooL == YES || self.bizInfoView.IDTextFieldBooL == YES || self.bizInfoView.merchantTextFieldBooL == YES || self.bizInfoView.contactTextFieldBooL == YES || self.bizInfoView.addressTextFieldBooL == YES || self.bizInfoView.locationTextFieldBooL == YES || self.bizInfoView.adTextFieldBooL == YES ) {
//        [self backAttention];
//    }
//    else
//    {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
    
    [self backAttention];
    
}

-(void)backAttention
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请注意" message:@"退出界面信息无法保存" preferredStyle:UIAlertControllerStyleAlert];
    
    // 按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        [self cancelBtn];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开照相机
        [self sureBtn];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    self.alert = alert;
}

-(void)cancelBtn
{
    [self dismissViewControllerAnimated:self.alert completion:nil];
}

-(void)sureBtn
{
    [self dismissViewControllerAnimated:self.alert completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 代理方法实现
//点击下一步按钮
-(void)nextStepClickDictionary:(NSMutableDictionary *)dictionary
{
    
    XXJLog(@"xiayibu")
    SSDBizInfoStep_2ViewController * bizinfoStep2 = [[SSDBizInfoStep_2ViewController alloc]init];
    [bizinfoStep2.data_2Dictionary addEntriesFromDictionary:dictionary];
//    bizinfoStep2.Step_2DataDict = [NSDictionary dictionaryWithDictionary:self.bizInfoView.dataDictionary];
    [self.navigationController pushViewController:bizinfoStep2 animated:YES];
    XXJLog(@"width===%f,height===%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
    
    
}


-(void)locationButtonClick
{
    SSDBizInfoMapViewController * mapVc = [[SSDBizInfoMapViewController alloc]init];
    [self.navigationController pushViewController:mapVc animated:YES];
}


@end

















