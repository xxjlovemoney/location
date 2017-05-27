//
//  QuickBillView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

//====================================侧滑界面-> 设置-> 一键发单设置===================================

#import "QuickBillView.h"
#import "QuickBill.h"
#import "PulldownView.h"

@interface QuickBillView ()

@end

@implementation QuickBillView
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
    //绑定饿了吗商家账号
    self.hungryAccountView = [[QuickBill alloc]init];
    self.hungryAccountView.titleLable.text = @"绑定饿了吗商家账号";
    UITapGestureRecognizer * hungryTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hungryTapClick)];
    [self.hungryAccountView addGestureRecognizer:hungryTap];
    [self addSubview:self.hungryAccountView];
    [self.hungryAccountView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(55));
    }];
    
    //饿了吗。下拉菜单
    self.hungryPull = [[PulldownView alloc]init];
    self.hungryPull.userInteractionEnabled = YES;
    self.hungryPull.titleLable.text = @"请输入您在饿了吗平台的商家账号和密码";
    [self addSubview:self.hungryPull];
    [self.hungryPull makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hungryAccountView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        if (self.hungryAccountView.spreadButton.selected == YES) {
            make.height.equalTo(0);
        }else
        {
            make.height.equalTo(H(240));
        }
    }];
    self.hungryPull.hidden = YES;
    
    //
    //绑定美团外卖商家账号
    self.meituanAccountView = [[QuickBill alloc]init];
    self.meituanAccountView.titleLable.text = @"绑定美团外卖商家账号";
    UITapGestureRecognizer * meituanTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(meituanTapClick)];
    [self.meituanAccountView addGestureRecognizer:meituanTap];
    [self addSubview:self.meituanAccountView];
    [self.meituanAccountView makeConstraints:^(MASConstraintMaker *make) {
        if (self.hungryPull.hidden == YES) {
            make.top.equalTo(self.hungryAccountView.bottom);
        }
        else
        {
            make.top.equalTo(self.hungryAccountView.bottom).offset(H(240));
        }
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(55));
    }];
    
    
    //美团外卖。下拉菜单
    self.meituanPull = [[PulldownView alloc]init];
    self.meituanPull.userInteractionEnabled = YES;
    self.meituanPull.titleLable.text = @"请输入您在美团平台的商家账号和密码";
    [self addSubview:self.meituanPull];
    
    [self.meituanPull makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.meituanAccountView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        if (self.meituanAccountView.spreadButton.selected == YES) {
            make.height.equalTo(0);
        }else
        {
            make.height.equalTo(H(240));
        }
    }];
    self.meituanPull.hidden = YES;
    
    
    //绑定百度外卖商家账号
    self.baiduAccountView = [[QuickBill alloc]init];
    self.baiduAccountView.titleLable.text = @"绑定百度外卖商家账号";
    UITapGestureRecognizer * baiduTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(baiduTapClick)];
    [self.baiduAccountView addGestureRecognizer:baiduTap];
    [self addSubview:self.baiduAccountView];
    [self.baiduAccountView makeConstraints:^(MASConstraintMaker *make) {
        if (self.meituanPull.hidden == YES) {
            make.top.equalTo(self.meituanAccountView.bottom);
        }
        else
        {
            make.top.equalTo(self.meituanAccountView.bottom).offset(H(240));
        }
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(H(55));
    }];
    
    
    
    //百度外卖。下拉菜单
    self.baiduPull = [[PulldownView alloc]init];
    self.baiduPull.userInteractionEnabled = YES;
    self.baiduPull.titleLable.text = @"请输入您在百度平台的商家账号和密码";
    [self addSubview:self.baiduPull];
    
    [self.baiduPull makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baiduAccountView.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        if (self.baiduAccountView.spreadButton.selected == YES) {
            make.height.equalTo(0);
        }else
        {
            make.height.equalTo(H(300));
        }
    }];
    self.baiduPull.hidden = YES;
}

//饿了吗账号点击
-(void)hungryTapClick
{
    self.hungryAccountView.spreadButton.selected = !self.hungryAccountView.spreadButton.selected;
    if (self.hungryAccountView.spreadButton.selected == YES) {
        self.hungryPull.hidden = NO;
        
        self.meituanAccountView.userInteractionEnabled = NO;
        self.baiduAccountView.userInteractionEnabled = NO;
        
        if (WIDTH == 320) {
            self.meituanAccountView.xxj_y = CGRectGetMaxY(self.hungryPull.frame) + 25;
        }
        else
        {
            self.meituanAccountView.xxj_y = CGRectGetMaxY(self.hungryPull.frame);
        }
        self.baiduAccountView.xxj_y = CGRectGetMaxY(self.meituanAccountView.frame);
    }
    else
    {
        self.hungryPull.hidden = YES;
        self.meituanAccountView.userInteractionEnabled = YES;
        self.baiduAccountView.userInteractionEnabled = YES;
        
        self.meituanAccountView.xxj_y = CGRectGetMaxY(self.hungryAccountView.frame);
        self.baiduAccountView.xxj_y = CGRectGetMaxY(self.meituanAccountView.frame);
    }
    
}


//美团外卖账号点击
-(void)meituanTapClick
{
    
    
    
    self.meituanAccountView.spreadButton.selected = !self.meituanAccountView.spreadButton.selected;
    
    if (self.meituanAccountView.spreadButton.selected == YES) {
        self.meituanPull.hidden = NO;
        
        self.hungryAccountView.userInteractionEnabled = NO;
        self.baiduAccountView.userInteractionEnabled = NO;
        
        if (WIDTH == 320) {
            self.baiduAccountView.xxj_y = CGRectGetMaxY(self.meituanPull.frame) + 25;
        }
        else
        {
            self.baiduAccountView.xxj_y = CGRectGetMaxY(self.meituanPull.frame);
        }
        
        
        
    }
    else
    {
        self.meituanPull.hidden = YES;
        self.hungryAccountView.userInteractionEnabled = YES;
        self.baiduAccountView.userInteractionEnabled = YES;
        
        self.baiduAccountView.xxj_y = CGRectGetMaxY(self.meituanAccountView.frame);
        
        
    }
}

//百度外卖账号点击
-(void)baiduTapClick
{
    
    
    self.baiduAccountView.spreadButton.selected = !self.baiduAccountView.spreadButton.selected;
    if (self.baiduAccountView.spreadButton.selected == YES) {
        self.baiduPull.hidden = NO;
        
        self.hungryAccountView.userInteractionEnabled = NO;
        self.meituanAccountView.userInteractionEnabled = NO;
        
        
    }
    else
    {
        self.baiduPull.hidden = YES;
        
        self.hungryAccountView.userInteractionEnabled = YES;
        self.meituanAccountView.userInteractionEnabled = YES;
    }
}








@end
