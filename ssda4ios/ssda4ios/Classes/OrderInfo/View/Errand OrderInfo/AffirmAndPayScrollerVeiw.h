//
//  AffirmAndPayScrollerVeiw.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AffirmSenderReceiverInfo,RechargeStyle;
@interface AffirmAndPayScrollerVeiw : UIScrollView

//客户姓名
@property (nonatomic, strong) AffirmSenderReceiverInfo * guestName;

//客户电话
@property (nonatomic, strong) AffirmSenderReceiverInfo * guestPhone;
//服务起点
@property (nonatomic, strong) AffirmSenderReceiverInfo * severiceOrign;

//服务终点
@property (nonatomic, strong) AffirmSenderReceiverInfo * severiceEnd;
//服务时间
@property (nonatomic, strong) AffirmSenderReceiverInfo * severiceTime;
//服务内容
@property (nonatomic, strong) AffirmSenderReceiverInfo * severiceContent;
//费用合计

//含小费5元

//具体费用
@property (nonatomic, strong) UILabel * moneyLable;
//支付方式

//余额支付
@property (nonatomic, strong) RechargeStyle * remainPayStyle;
//支付宝
@property (nonatomic, strong) RechargeStyle * aliPayStyle;
//微信支付
@property (nonatomic, strong) RechargeStyle * wechatPayStyle;


@end
