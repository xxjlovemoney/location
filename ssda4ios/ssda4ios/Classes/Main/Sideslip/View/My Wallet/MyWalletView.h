//
//  MyWalletView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@protocol MyWalletViewDelegate <NSObject>
//冲值点击代理方法
-(void)rechargeClick;
//交易明细点击代理方法
-(void)detailClick;
//月度统计代理方法
-(void)statisticsClick;
@end

@interface MyWalletView : UIView
//钱标识
@property (nonatomic, strong) UILabel * moneyLogoLable;
//钱标签
@property (nonatomic, strong) UILabel * moneyLable;

//充值
@property (nonatomic, strong) Wallet * rechargeView;
//交易明细
@property (nonatomic, strong) Wallet * detailView;
//月度统计
@property (nonatomic, strong) Wallet * statisticsView;

@property (nonatomic, weak) id<MyWalletViewDelegate> delegate;
@end
