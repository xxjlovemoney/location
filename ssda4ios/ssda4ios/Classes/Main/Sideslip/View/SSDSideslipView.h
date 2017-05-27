//
//  SSDSideslipView.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SSDSideslipViewDelegate <NSObject>

//侧滑界面顶部更多按钮点击代理方法
-(void)moreBtnClick;
//侧滑界面商家认证按钮点击代理方法
-(void)storeApproveBtnClick;
//侧滑界面投诉举报按钮点击代理方法
-(void)reportBtnClick;
//侧滑界面设置按钮点击代理方法
-(void)settingBtnClick;
//侧滑界面我的钱包按钮点击代理方法
-(void)walletBtnClick;
//侧滑界面我的订单按钮点击代理方法
-(void)orderBtnClick;
//侧滑界面商家管理规则按钮点击代理方法
-(void)storeRuleBtnClick;
@end

@class SideslipView;
@interface SSDSideslipView : UIView

//顶部更多按钮
@property (nonatomic, strong) UIButton *  moreButton;

//我的订单
@property (nonatomic, strong) SideslipView * myBillView;
//我的钱包
@property (nonatomic, strong) SideslipView * walletView;
//联系客服
@property (nonatomic, strong) SideslipView * contactView;
//投诉举报
@property (nonatomic, strong) SideslipView * reportView;
//商家认证
@property (nonatomic, strong) SideslipView * bizInfoView;
//商家管理规则
@property (nonatomic, strong) SideslipView * rollView;
//设置
@property (nonatomic, strong) SideslipView * settingView;

@property (nonatomic, weak) id<SSDSideslipViewDelegate> delegate;
@end
