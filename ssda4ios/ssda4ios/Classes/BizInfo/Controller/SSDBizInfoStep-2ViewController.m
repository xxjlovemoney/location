//
//  SSDBizInfoStep-2ViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-2ViewController.h"
#import "SSDBizInfoStep-2View.h"
#import "SSDBizInfoStep-3ViewController.h"
@interface SSDBizInfoStep_2ViewController ()<SSDBizInfoStep_2ViewDelegate>
@property(nonatomic,strong)SSDBizInfoStep_2View * bizInfoViewSecond;
@end

@implementation SSDBizInfoStep_2ViewController
-(NSMutableDictionary *)data_2Dictionary
{
    if (_data_2Dictionary == nil) {
        _data_2Dictionary = [NSMutableDictionary dictionary];
        
    }
    return _data_2Dictionary;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    XXJLog(@"%@",self.Step_2DataDict)
    
    //设置导航条按钮和标题
    [self setUpNavItemImage];
    //界面初始化
    [self setUpUI];
}

#pragma mark -- 导航条按钮和标题
-(void)setUpNavItemImage
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
}

#pragma mark --界面初始化
-(void)setUpUI
{
    self.bizInfoViewSecond = [[SSDBizInfoStep_2View alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    self.bizInfoViewSecond.delegate = self;
    
    
    [self.view addSubview:self.bizInfoViewSecond];
}


#pragma mark --  返回按钮
-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"商家认证-填写基本信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-white"] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark -- 代理方法
-(void)nextstepSecondClick:(NSMutableDictionary *)dictionary
{
    [self.data_2Dictionary addEntriesFromDictionary:dictionary];
    SSDBizInfoStep_3ViewController * stepthird = [[SSDBizInfoStep_3ViewController alloc]init];
    [stepthird.data_3Dictionary addEntriesFromDictionary:self.data_2Dictionary];
    [self.navigationController pushViewController:stepthird animated:YES];
}




@end
