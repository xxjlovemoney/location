//
//  SSDHomePublishVIew.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SSDHomePopupView;

@protocol SSDHomePublishVIewDelegate <NSObject>

//scrollerView 滚动代理方法
//-(void)getScrollView:(UIScrollView *)scrollView;

//点击➕按钮的代理方法
-(void)addButtonClick;
//底部切换视图➕按钮代理方法
-(void)addChangeClick;

//点击外卖录单按钮的代理方法
-(void)takeoutClick:(UIButton *)takeoutbtn;
//饿了吗点击代理方法
-(void)hungryClick:(UIButton *)hungrybtn;
//美团外卖点击代理方法
-(void)meituanClick:(UIButton *)meituanbtn;
//百度外卖点击代理方法
-(void)baiduClick:(UIButton *)baidubtn;
//点击同城快递按钮的代理方法
-(void)cityClick:(UIButton *)citybtn;
//点击跑腿服务按钮的点击方法
-(void)errandClick:(UIButton *)errandbtn;

@end
@interface SSDHomePublishVIew : UIView

@property(strong,nonatomic) SSDHomePopupView * popUpView;

@property (nonatomic, strong) UIScrollView * scrollerView;

@property(weak,nonatomic) id<SSDHomePublishVIewDelegate> delegate;

//底部视图
@property(strong,nonatomic) UIView *bottomView;
//底部视图（切换用）
@property (nonatomic, strong) UIView * bottomChangeView;

//底部的加号按钮
@property (nonatomic, strong) UIButton *addButton;
//我要发单按钮
@property (nonatomic, strong) UIButton *publishButton;

@end
