//
//  OrderPrice.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderPrice : UIView
//titleLabe价格
@property (nonatomic, strong) UILabel * priceLable;
//价格详情
@property (nonatomic, strong) UITextField * priceTextField;
//已付款按钮
@property (nonatomic, strong) UIButton * paymentButton;
//未付款按钮
@property (nonatomic, strong) UIButton * non_paymentButton;

@end
