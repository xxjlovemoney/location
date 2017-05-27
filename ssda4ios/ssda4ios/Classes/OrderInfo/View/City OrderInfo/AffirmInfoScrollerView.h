//
//  AffirmInfoScrollerView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AffirmSenderReceiverInfo,RechargeStyle;
@interface AffirmInfoScrollerView : UIScrollView
//寄方
@property (nonatomic, strong) AffirmSenderReceiverInfo * senderInfo;
//收方
@property (nonatomic, strong) AffirmSenderReceiverInfo * receiverInfo;
//物品描述
@property (nonatomic, strong) AffirmSenderReceiverInfo * weightDetails;
//送达时间
@property (nonatomic, strong) AffirmSenderReceiverInfo * arriveTime;
//备注
@property (nonatomic, strong) AffirmSenderReceiverInfo * remarkInfo;
//具体费用
@property (nonatomic, strong) UILabel * moneyLable;


//余额支付
@property (nonatomic, strong) RechargeStyle * remainPayStyle;
//支付宝
@property (nonatomic, strong) RechargeStyle * aliPayStyle;
//微信支付
@property (nonatomic, strong) RechargeStyle * wechatPayStyle;

////最大滚动高度
//@property (nonatomic, assign) NSInteger maxHeight;


@end
