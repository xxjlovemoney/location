//
//  SSDHomePublishVIew.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================主界面-> 初始界面带有logo圆形标记的界面==============================================

#import "SSDHomePublishVIew.h"
#import "SSDHomePopupView.h"

#import "SSDHomePublishTableView.h"
#import "SSDHomeProcessTableView.h"

#import "SSDHomeTableViewCell.h"

@interface SSDHomePublishVIew ()<UITableViewDelegate,UITableViewDataSource>

//头像
@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, weak) UILabel * explainLableUp;
@property (nonatomic, strong) UILabel * explianLableDown;

//有数据时显示的UITableView
@property (nonatomic, weak) SSDHomePublishTableView * publishTableView;
@property (nonatomic, weak) SSDHomeProcessTableView * processtableView;




@property (nonatomic, strong) UIView * bottombackViewNew;

@property (nonatomic, weak) SSDHomeTableViewCell *cell;

@end

@implementation SSDHomePublishVIew

static NSString *cellIDPub = @"cellIDPub";

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //接面初始化
        [self setupUI];
        
        //增加点击事件
        [self addGestureClick];
        
        //注册cell
        [self.publishTableView registerClass:[SSDHomeTableViewCell class] forCellReuseIdentifier:cellIDPub];
        [self.processtableView registerClass:[SSDHomeTableViewCell class] forCellReuseIdentifier:cellIDPub];
    }
    return self;
}


#pragma mark -- 接面初始化
-(void)setupUI
{
    
//    self.publishRootView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0,0) style:UITableViewStylePlain];
//    self.publishRootView.backgroundColor = [UIColor whiteColor];
//    self.publishRootView.delegate = self;
//    self.publishRootView.dataSource = self;
//    self.publishRootView.alpha = 1;
//    [self addSubview:self.publishRootView];
    
    //增加滚动视图
    self.scrollerView = [[UIScrollView alloc]init];
    self.scrollerView.alpha = 0;
    self.scrollerView.backgroundColor = [UIColor clearColor];
    self.scrollerView.contentSize = CGSizeMake(2 * WIDTH, 0);
    self.scrollerView.pagingEnabled = YES;
    [self addSubview:self.scrollerView];
    [self.scrollerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kMarginTopHeight);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    //下划线
    UIImageView * bottomImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:bottomImageViewLine];
    [bottomImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollerView);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    //首页有数据时的展示的tableView
    //发布中
    SSDHomePublishTableView * publishTableView = [[SSDHomePublishTableView alloc]initWithFrame:CGRectMake(0, 1, WIDTH, HEIGHT - kMarginTopHeight) style:UITableViewStylePlain];
    publishTableView.backgroundColor = [UIColor clearColor];
    publishTableView.delegate = self;
    publishTableView.dataSource = self;
    publishTableView.estimatedRowHeight = 300;
    //去除cell系统的下划线
    publishTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollerView addSubview:publishTableView];
    self.publishTableView = publishTableView;
    
    //进行中
    SSDHomeProcessTableView * processTableView = [[SSDHomeProcessTableView alloc]initWithFrame:CGRectMake(WIDTH, 1, WIDTH, HEIGHT - kMarginTopHeight) style:UITableViewStylePlain];
//    processTableView.backgroundColor = [UIColor greenColor];
    [processTableView setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG-green"]]];
    processTableView.delegate = self;
    processTableView.dataSource = self;
    processTableView.estimatedRowHeight = 300;
    //去除cell系统的下划线
    processTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollerView addSubview:processTableView];
    self.processtableView = processTableView;
    

    //主界面上的LOGO头像
    self.iconView = [[UIImageView alloc]init];
    self.iconView.layer.cornerRadius = W(43);
    self.iconView.clipsToBounds = YES;
    self.iconView.image = [UIImage imageNamed:@"logo"];
    self.iconView.layer.cornerRadius = 43;
    self.iconView.clipsToBounds = YES;
    [self addSubview:self.iconView];
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(201)- kMarginTopHeight);
        make.size.equalTo(CGSizeMake(W(86), H(86)));
        make.centerX.equalTo(self);
    }];
    
    //头像下面的标签
    UILabel * explainLableUp =  [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(16) text:@"点击左下角选择发单类型"];
    explainLableUp.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explainLableUp];
    [explainLableUp makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.bottom).offset(H( 30));
        make.centerX.equalTo(self);
    }];
    self.explainLableUp = explainLableUp;
    
    UILabel * explianLableDown = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(16) text:@"随时达为您配送"];
    explianLableDown.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explianLableDown];
    [explianLableDown makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(explainLableUp.bottom).offset(H(21));
        make.centerX.equalTo(self);
    }];
    self.explianLableDown = explianLableDown;
    
    /*布局重构*/
    //1、底部背景视图
    //2、底部弹出视图
    //3、底部视图（两个按钮）设置为透明色
    //4、底部视图（切换用）设置为透明色
    
    //1、底部背景视图
    UIImageView * bottomImageNew = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"button"]];
    UIView * bottombackViewNew = [[UIView alloc]init];
    [self addSubview:bottombackViewNew];
    [bottombackViewNew makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(199));
    }];
    [bottombackViewNew addSubview:bottomImageNew];
    [bottomImageNew makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottombackViewNew);
        make.right.equalTo(bottombackViewNew);
        make.bottom.equalTo(bottombackViewNew);
        make.height.equalTo(H(199));
    }];
    self.bottombackViewNew = bottombackViewNew;
    
    //2、底部弹出视图
    self.popUpView = [[SSDHomePopupView alloc]init];
    //外卖录单按钮点击事件
    [self.popUpView.takeoutBillButton addTarget:self action:@selector(takeoutBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //饿了吗按钮点击事件
    [self.popUpView.hungryButton addTarget:self action:@selector(hungryBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //美团外卖按钮点击事件
    [self.popUpView.meituanButton addTarget:self action:@selector(meituanBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //百度外卖按钮点击事件
    [self.popUpView.baiduButton addTarget:self action:@selector(baiduBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //同城快递按钮点击
    [self.popUpView.cityButton addTarget:self action:@selector(cityBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //跑腿服务按钮点击事件
    [self.popUpView.errandButton addTarget:self action:@selector(errandBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"botton menu-big"]];
    [self.popUpView insertSubview:imageView atIndex:0];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.popUpView);
        make.bottom.equalTo(self.popUpView);
        make.right.equalTo(self.popUpView);
        make.height.equalTo(H(469));
    }];
    [self addSubview:self.popUpView];
    [self.popUpView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.bottom);
        make.height.equalTo(H(469));
    }];
    
    //3、底部视图（两个按钮）设置为透明色
    self.bottomView = [[UIView alloc]init];
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bottomView];
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);//
        make.right.equalTo(self);
        make.height.equalTo(H(75));
    }];
    
    //底部视图上的➕按钮
    UIButton * addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:addButton];
    [addButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView).offset(W(41));
        make.bottom.equalTo(self.bottomView.bottom).offset(H(-24));
        make.size.equalTo(CGSizeMake(W(32), H(32)));
    }];
    //底部视图上的“我要发单”按钮
    UIButton * publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishButton setTitle:@"我要发单" forState:UIControlStateNormal];
    [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:publishButton];
    [publishButton makeConstraints:^(MASConstraintMaker *make) {
        //        make.right.equalTo(self.bottomView).offset(W(50));
        make.centerX.equalTo(self.right).offset(W(-90));
        make.bottom.equalTo(self.bottomView.bottom).offset(H(-24));
        make.size.equalTo(CGSizeMake(W(200), H(32)));
    }];

    //4、底部视图（切换用）设置为透明色
    self.bottomChangeView = [[UIView alloc]init];
    self.bottomChangeView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bottomChangeView];
    [self.bottomChangeView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.bottom);//
        make.right.equalTo(self);
        make.height.equalTo(H(75));
    }];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"take-out botton-white"] forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addChangeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomChangeView addSubview:self.addButton];
    [self.addButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomChangeView).offset(W(29));
        make.bottom.equalTo(self.bottomChangeView.bottom).offset(H(-12));
        make.size.equalTo(CGSizeMake(W(56), H(56)));
    }];
    //底部视图上的“我要发单”按钮
    self.publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.publishButton setTitle:@"手动外卖录单" forState:UIControlStateNormal];
    [self.publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomChangeView addSubview:self.publishButton];
    [self.publishButton makeConstraints:^(MASConstraintMaker *make) {
        //        make.right.equalTo(self.bottomView).offset(W(50));
        make.centerX.equalTo(self.right).offset(W(-90));
        make.bottom.equalTo(self.bottomChangeView.bottom).offset(H(-24));
        make.size.equalTo(CGSizeMake(W(200), H(32)));
    }];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSDHomeTableViewCell *cell;
    if (tableView == self.publishTableView) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIDPub];
        cell.backgroundColor = [UIColor clearColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [cell.sourceButton setTitle:@"饿了吗" forState:UIControlStateNormal];
        self.cell = cell;
        
    }
    else if (tableView == self.processtableView)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIDPub];
        cell.backgroundColor = [UIColor clearColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.currentTimeLable.hidden = NO;
        cell.alreadyOrderButton.hidden = NO;
        cell.addTipButton.hidden = YES;
        cell.contactDeliverymanButton.hidden = NO;
        
        [cell.sourceButton setTitle:@"跑腿服务" forState:UIControlStateNormal];
        self.cell = cell;
        
    }
    return self.cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cell.maxHeight;
}






#pragma mark -- 我要发单 按钮点击事件
- (void)publishClick{
    
    
    self.iconView.hidden = YES;
    self.explainLableUp.hidden = YES;
    self.explianLableDown.hidden = YES;
    
    self.scrollerView.alpha = 1;
    [self bringSubviewToFront:self.scrollerView];
    [self bringSubviewToFront:self.bottombackViewNew];
    [self bringSubviewToFront:self.popUpView];
    [self bringSubviewToFront:self.bottomView];
    [self bringSubviewToFront:self.bottomChangeView];
}

#pragma mark -- ➕按钮点击事件
// 点击+号按钮
- (void)addClick{
    //    self.rootView.alpha = 0;
//    self.publishRootView.frame = CGRectMake(0, 0, 0, 0);
    
    if ([self.delegate respondsToSelector:@selector(addButtonClick)]) {
        [self.delegate addButtonClick];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.popUpView.xxj_y = HEIGHT - H(469)+H(35);
//        self.popUpView.xxj_y = HEIGHT - H(469);
    }];
    
}

#pragma mark -- 底部切换视图 的➕点击事件
-(void)addChangeClick
{
    if ([self.delegate respondsToSelector:@selector(addChangeClick)]) {
        [self.delegate addChangeClick];
        
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.popUpView.xxj_y = HEIGHT - H(469)+H(35);
//        self.popUpView.xxj_y = HEIGHT - H(469);
    }];
}



#pragma mark -- 底部弹出视图里面的外卖录单点击
//外卖录单点击
-(void)takeoutBtn:(UIButton *)takeout
{
    if ([self.delegate respondsToSelector:@selector(takeoutClick:)]) {
        [self.delegate takeoutClick:takeout];
    }
    [self tapClick];
}

#pragma mark -- 底部弹出视图里面的饿了吗点击
-(void)hungryBtn:(UIButton *)hungry
{
    if ([self.delegate respondsToSelector:@selector(hungryClick:)]) {
        [self.delegate hungryClick:hungry];
    }
    [self tapClick];
}

#pragma mark -- 底部弹出视图里面的美团外卖点击
-(void)meituanBtn:(UIButton *)meituan
{
    if ([self.delegate respondsToSelector:@selector(meituanClick:)]) {
        [self.delegate meituanClick:meituan];
    }
    [self tapClick];
}

#pragma mark -- 底部弹出视图里面的百度外卖点击
-(void)baiduBtn:(UIButton *)baidu
{
    if ([self.delegate respondsToSelector:@selector(baiduClick:)]) {
        [self.delegate baiduClick:baidu];
    }
    [self tapClick];
}

#pragma mark  -- 底部弹出视图里面的同城快递点击
-(void)cityBtn:(UIButton *)city
{
    if ([self.delegate respondsToSelector:@selector(cityClick:)]) {
        [self.delegate cityClick:city];
    }
    [self tapClick];
}

#pragma mark -- 底部弹出视图里面的跑腿服务点击
-(void)errandBtn:(UIButton *)errand
{
    if ([self.delegate respondsToSelector:@selector(errandClick:)]) {
        [self.delegate errandClick:errand];
    }
    [self tapClick];
}


#pragma mark -- 增加点击事件
-(void)addGestureClick
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    
    [self addGestureRecognizer:tap];
}

#pragma mark -- 底部弹出视图退出
-(void)tapClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.popUpView.xxj_y = CGRectGetMaxY(self.popUpView.frame);
    }];
}

@end



















