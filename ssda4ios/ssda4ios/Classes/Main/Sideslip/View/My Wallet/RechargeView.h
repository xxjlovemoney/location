//
//  RechargeView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Recharge,RechargeStyle;
@interface RechargeView : UIView
//充值账户
@property (nonatomic, strong) Recharge * rechargeView;
//账户余额
@property (nonatomic, strong) Recharge * RemainView;
//充值金额
@property (nonatomic, strong) Recharge * moneyView;
//充值金额textField
@property (nonatomic, strong) UITextField * moneyField;
//支付宝支付
@property (nonatomic, strong) RechargeStyle * alipayView;
//微信支付
@property (nonatomic, strong) RechargeStyle * wechatView;
@end
