//
//  SSDHomeViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDHomeViewController.h"
#import "SSDHomePublishVIew.h"
#import "SSDHomeNavTitleView.h"

#import "SSDBizInfoViewController.h"

#import "SSDNotiCenterTableViewController.h"//导航栏右侧通知按钮点击。通知中心

#import "SSDSideslipView.h"//侧滑视图
#import "SSDSideslipAboutMeViewController.h"//侧滑视图点击弹出界面  关于我
#import "SSDStoreApproveViewController.h"//侧滑视图点击弹出界面  商户认证
#import "SSDReportViewController.h"//侧滑视图点击弹出界面  投诉举报
#import "SSDSideslipSettingViewController.h"//侧滑视图点击弹出界面  设置
#import "SSDSideslipMyWalletViewController.h"//侧滑界面点击弹出界面 我的钱包
#import "SSDMyOrderViewController.h"//侧滑界面点击我的订单弹出界面。 我的的订单
#import "SSDStoreRuleViewController.h"//侧滑界面点击商家管理规则弹出界面。商家管理规则

#import "OrderInfoViewController.h"//底部视图。 点击手动外卖录单
#import "CityInfoViewController.h"//同城信息快递录入
#import "ErrandInfoViewController.h"//跑腿服务信息录入
@interface SSDHomeViewController ()<SSDHomePublishVIewDelegate,SSDSideslipViewDelegate,SSDHomeNavTitleViewDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)SSDHomePublishVIew * publishView;

@property(strong,nonatomic) SSDSideslipView * sideslipView;

@property(strong,nonatomic) UIView * coverView;

@property (nonatomic, strong) UIView * bottomViewNew;
@property (nonatomic, strong) UIButton * addbuttonNew;
@property (nonatomic, strong) UIButton * sendBillButtonNew;

@property (nonatomic, strong) UIImageView * greenbackImageView;
@property (nonatomic, strong) UIImageView * backImageView;
@end

@implementation SSDHomeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //设置导航栏下面的黑线隐藏
    [self setNavLine];
    
    //设置导航栏标题栏
    [self setUpNavTitleView];
    
    //界面初始化
    [self setUpUI];
    
    //设置背景图片
    [self setUpBackImage];
    
    //设置导航栏设置导航栏左右按钮图片
    [self setUpNavItem];
    
    //设置覆盖层
    [self setUpCoverLayer];
    
    //设置侧滑视图
    [self setUpSideslip];
    
    

    
    
}


#pragma mark -- 设置导航栏标题栏
-(void)setUpNavTitleView
{
    self.titleView = [[SSDHomeNavTitleView alloc]initWithFrame:CGRectMake(0, 0, W(160), H(30))];
    self.navigationItem.titleView = self.titleView;
    self.titleView.delegate = self;
}


#pragma mark -- SSDHomeNavTitleViewDelegate
-(void)publishButtonClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.publishView.scrollerView.contentOffset = CGPointMake(0, 0);
    }];
    
}

-(void)processButtonClick
{
    [UIView animateWithDuration:0.2 animations:^{
        self.publishView.scrollerView.contentOffset = CGPointMake(WIDTH, 0);
    }];
    
}

#pragma mark -- 设置覆盖层
-(void)setUpCoverLayer
{
    self.coverView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.coverView.backgroundColor = [UIColor blackColor];
    self.coverView.alpha = 0;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.coverView addGestureRecognizer:tap];
    [[UIApplication sharedApplication].keyWindow addSubview:self.coverView];
}

#pragma mark -- 覆盖层手势点击
-(void)tapClick
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = -self.sideslipView.xxj_width;
        self.coverView.alpha = 0;
    }];
    
}

#pragma mark -- 设置侧滑视图
-(void)setUpSideslip
{
    self.sideslipView = [[SSDSideslipView alloc]init];
    self.sideslipView.delegate = self;
   
    if (WIDTH == 414) { //6P
        self.sideslipView.frame = CGRectMake(-339, 0, 339, HEIGHT );
    }else if (WIDTH == 375){ // 6
        self.sideslipView.frame = CGRectMake(-307, 0, 307, HEIGHT);
    }else if (WIDTH == 320){ // 5
        self.sideslipView.frame = CGRectMake(-262, 0, 262, HEIGHT );
    }

    [[UIApplication sharedApplication].keyWindow addSubview:self.sideslipView];
}


#pragma mark -- 设置导航栏左右按钮图片
-(void)setUpNavItem
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] target:self action:@selector(leftBarClick)];
    
    UIBarButtonItem * rightSearch = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"search"] target:self action:@selector(searchClick)];
    
    UIBarButtonItem * rightNoti = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"notification"] target:self action:@selector(notiClick)];
    
    self.navigationItem.rightBarButtonItems = @[rightNoti,rightSearch];
}

#pragma mark -- 导航栏左边按钮点击事件
-(void)leftBarClick
{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = 0;
        self.coverView.alpha = 0.5;
    }];
    
}

#pragma mark -- 导航栏右边查找按钮点击事件
-(void)searchClick
{
    
}

#pragma mark -- 导航栏右边通知按钮点击事件通知中心
-(void)notiClick
{
    SSDNotiCenterTableViewController * notiCenterVc = [[SSDNotiCenterTableViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:notiCenterVc animated:YES];
}


#pragma mark --设置导航栏下面的黑线隐藏
-(void)setNavLine
{
    //设置导航栏下面的黑线隐藏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    self.publishView = [[SSDHomePublishVIew alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];// - H(80))
    self.publishView.delegate = self;
    self.publishView.scrollerView.delegate = self;
    [self.view addSubview:self.publishView];
    
}


#pragma mark -- 设置背景图片
-(void)setUpBackImage
{
    
    UIImageView * greenbackImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-green"]];
    greenbackImageView.contentMode = UIViewContentModeScaleAspectFill;
    greenbackImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.publishView insertSubview:greenbackImageView atIndex:0];
    self.greenbackImageView = greenbackImageView;
    
    
    UIImageView * backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG"]];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.publishView insertSubview:backImageView atIndex:1];
    self.backImageView = backImageView;
    
    
}


#pragma mark --SSDHomePublishVIewDelegate地步弹出视图代理方法
-(void)addButtonClick
{
    XXJLog(@"点击了+号")
}
#pragma mark --SSDHomePublishVIewDelegate地步弹出切换视图代理方法
-(void)addChangeClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.publishView.bottomChangeView.xxj_y = HEIGHT;
        self.publishView.bottomView.xxj_y = HEIGHT  - self.publishView.bottomChangeView.xxj_height;
        
    }];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //下划线需要滚动的距离
    CGFloat length = self.titleView.processButton.xxj_centerX - self.titleView.publishButton.xxj_centerX;
    
    CGFloat i = length / WIDTH;
    
    self.titleView.lineView.xxj_centerX =  scrollView.contentOffset.x * i + self.titleView.lineView.xxj_width - W(3);
    
    if (scrollView.contentOffset.x == WIDTH) {
        [self.publishView sendSubviewToBack:self.backImageView];
    }
    else if (scrollView.contentOffset.x == 0)
    {
        [self.publishView sendSubviewToBack:self.greenbackImageView];
    }
    
}




//==========================================以下底部弹出界面按钮点击代理方法================================
#pragma mark -- 底部视图 外卖录单点击
-(void)takeoutClick:(UIButton *)takeoutbtn
{
//    XXJLog(@"点击啊了外卖")
//    //认证不通过 进入信息输入界面
    SSDBizInfoViewController * biz = [[SSDBizInfoViewController alloc]init];
    [self.navigationController pushViewController:biz animated:YES];
    
    //认证通过
    //底部内容的修改
//    [self updateBottomView:takeoutbtn];

 
}

#pragma mark -- 底部视图 饿了吗点击
-(void)hungryClick:(UIButton *)hungrybtn
{

    [self updateBottomView:hungrybtn];

}

#pragma mark -- 底部视图 美团点击
-(void)meituanClick:(UIButton *)meituanbtn
{
    [self updateBottomView:meituanbtn];
    
    
}

#pragma mark -- 底部视图 百度点击
-(void)baiduClick:(UIButton *)baidubtn
{
    [self updateBottomView:baidubtn];
}

#pragma mark -- 底部视图 同城快递点击
-(void)cityClick:(UIButton *)citybtn
{
    
    [self updateBottomView:citybtn];
}

#pragma mark -- 底部视图。跑腿服务点击
-(void)errandClick:(UIButton *)errandbtn
{
    
    [self updateBottomView:errandbtn];
}


//底部视图外卖录单 认证通过 的点击事件
-(void)updateBottomView:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        
        if (button.tag == 100){
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"take-out botton-white"] title:@"手动外卖录单"];
            //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
            //发单按钮增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            
            
        }else if (button.tag == 101)
        {
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"eleme botton-white"] title:@"一键发单（饿了吗）"];
            //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
            //增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            
            
        }else if (button.tag == 102)
        {
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"meituan botton-white"] title:@"一键发单（美团）"];
            //        //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
            //增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            
            
        }else if (button.tag == 103)
        {
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"baidu botton-white"] title:@"一键发单（百度）"];
            
            //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
            //增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (button.tag == 104)
        {
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"city express botton-white"] title:@"同城快递发单"];
            
            //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
            //增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            
            
        }else if (button.tag == 105)
        {
            [self UpdateaddButtonAddpublishButtonImage:[UIImage imageNamed:@"errand botton-white"] title:@"跑腿服务发单"];
            
            //移除之前已添加的点击事件
            [self.publishView.publishButton removeTarget:self action:@selector(handBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(hungryBillBtn) forControlEvents:UIControlEventTouchUpInside];
            [self.publishView.publishButton removeTarget:self action:@selector(cityBtn) forControlEvents:UIControlEventTouchUpInside];
            //增加点击事件
            [self.publishView.publishButton addTarget:self action:@selector(errandBtn) forControlEvents:UIControlEventTouchUpInside];
        
        }
        
        self.publishView.bottomView.xxj_y = HEIGHT;
        self.publishView.bottomChangeView.xxj_y = HEIGHT - self.publishView.bottomChangeView.xxj_height;
    }];
}


//底部切换视图 内容的修改
-(void)UpdateaddButtonAddpublishButtonImage:(UIImage *)image title:(NSString *)title
{
    [self.publishView.addButton setImage:image forState:UIControlStateNormal];
    [self.publishView.publishButton setTitle:title forState:UIControlStateNormal];
}

//==========================================以上底部弹出界面按钮点击代理方法================================

#pragma mark -- 点击外卖录单。 底部视图 按钮手动外卖录单 点击事件
-(void)handBillBtn
{
    XXJLog(@"==================手动外卖录单")
    OrderInfoViewController * orderInfo = [[OrderInfoViewController alloc]init];
    [self.navigationController pushViewController:orderInfo animated:YES];
}

#pragma mark -- 点击饿了吗。 底部视图 按钮一键发单（饿了吗,美团，百度） 点击事件
-(void)hungryBillBtn
{
    XXJLog(@"==================饿了吗，美团，百度外卖录单")
    
}

#pragma mark -- 点击同城快递。 底部视图 按钮同城快递发单 点击事件
-(void)cityBtn
{
    XXJLog(@"==================同城外卖订单")
    CityInfoViewController * cityInfo = [[CityInfoViewController alloc]init];
    [self.navigationController pushViewController:cityInfo animated:YES];
    
}
#pragma mark -- 点击跑腿服务    底部视图 按钮跑腿服务发单 点击事件
-(void)errandBtn
{
    XXJLog(@"==================跑腿外卖订单")
    ErrandInfoViewController * errandInfo = [[ErrandInfoViewController alloc]init];
    [self.navigationController pushViewController:errandInfo animated:YES];
}




//==========================================以下侧滑界面代理方法=======================================

#pragma mark -- 代理方法SSDSideslipViewDelegate
#pragma mark -- 侧滑界面 顶部更多按钮点击
-(void)moreBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDSideslipAboutMeViewController * aboutMeVc = [[SSDSideslipAboutMeViewController alloc]init];
    [self.navigationController pushViewController:aboutMeVc animated:YES];
}

#pragma mark -- 侧滑界面 商家认证 点击
-(void)storeApproveBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDStoreApproveViewController * apporveVc = [[SSDStoreApproveViewController alloc]init];
    [self.navigationController pushViewController:apporveVc animated:YES];
}


#pragma mark -- 侧滑界面 投诉举报 点击
-(void)reportBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDReportViewController * reportVc = [[SSDReportViewController alloc]init];
    [self.navigationController pushViewController:reportVc animated:YES];
}

#pragma mark -- 侧滑界面 设置 点击
-(void)settingBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDSideslipSettingViewController * setVc = [[SSDSideslipSettingViewController alloc]init];
    [self.navigationController pushViewController:setVc animated:YES];
    
}

#pragma mark -- 侧滑界面 我的钱包 点击
-(void)walletBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDSideslipMyWalletViewController * walletVc = [[SSDSideslipMyWalletViewController alloc]init];
    [self.navigationController pushViewController:walletVc animated:YES];
}

#pragma mark -- 侧滑界面 我的订单 点击
-(void)orderBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDMyOrderViewController * orderVc = [[SSDMyOrderViewController alloc]init];
    [self.navigationController pushViewController:orderVc animated:YES];
}


#pragma mark -- 侧滑界面 商家管理规则 点击
-(void)storeRuleBtnClick
{
    //侧滑退出
    //覆盖层消失
    [self sideNeed];
    
    //push到下一界面
    SSDStoreRuleViewController * ruleVc = [[SSDStoreRuleViewController alloc]init];
    [self.navigationController pushViewController:ruleVc animated:YES];
}



//==========================================以上侧滑界面代理方法=======================================



#pragma mark --侧滑退出  覆盖层消失
-(void)sideNeed
{
    //侧滑退出
    //覆盖层消失
    [UIView animateWithDuration:0.5 animations:^{
        self.sideslipView.xxj_x = -self.sideslipView.xxj_width-500;
        self.coverView.alpha = 0;
    }];
}

#pragma mark -- 视图将要显示的时候，设置导航栏背景图片和侧滑视图的位置
-(void)viewWillAppear:(BOOL)animated
{
    self.sideslipView.xxj_x = -self.sideslipView.xxj_width-50;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BG-top-home"] forBarMetrics:UIBarMetricsDefault];

    //设置statueBar的颜色为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}


-(void)addPlusBtn
{
    

}





@end
