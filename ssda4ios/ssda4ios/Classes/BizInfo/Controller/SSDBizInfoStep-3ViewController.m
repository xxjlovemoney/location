//
//  SSDBizInfoStep-3ViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-3ViewController.h"
#import "SSDBizInfoStep-3View.h"

#import "SSDBizInfoCheckViewController.h"
@interface SSDBizInfoStep_3ViewController ()
@property(strong,nonatomic)SSDBizInfoStep_3View * bizInfoViewThird;

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) NSDictionary * photoInfo;
@end

@implementation SSDBizInfoStep_3ViewController

-(NSMutableDictionary *)data_3Dictionary
{
    if (_data_3Dictionary == nil) {
        _data_3Dictionary = [NSMutableDictionary dictionary];
    }
    return _data_3Dictionary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"back-black"] target:self action:@selector(backBtn)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    //界面初始化
    [self setUpUI];
    
    //创建底部按钮
    
}

-(void)backBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setUpUI
{
    UIScrollView * scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-60)];

    
    [self.view addSubview:scrollerView];
    self.scrollView = scrollerView;
    
    self.bizInfoViewThird = [[SSDBizInfoStep_3View alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT+ H(250))];
    self.bizInfoViewThird.userInteractionEnabled = YES;
    [scrollerView addSubview:self.bizInfoViewThird];
    
    //
    // 提交按钮
    UIButton * bottomBtn = [[UIButton alloc]init];
    [bottomBtn setTitle:@"提交" forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:W(18)];
    [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];
    
    [bottomBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(H(60));
    }];
    
//    scrollerView.contentSize = CGSizeMake(0, H(900));
    
}



-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.scrollView.contentSize = CGSizeMake(0, self.bizInfoViewThird.maxheight + 50);
}

#pragma mark -- 提交
-(void)bottomBtnClick
{
    SSDBizInfoCheckViewController * bizinfoCheck = [[SSDBizInfoCheckViewController alloc]init];
    [self.navigationController pushViewController:bizinfoCheck animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"商家认证-填写基本信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

    //设置statueBar的颜色为黑色
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}



@end

















