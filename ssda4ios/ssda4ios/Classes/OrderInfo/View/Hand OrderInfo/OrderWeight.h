//
//  OrderWeight.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderWeightDelegate <NSObject>

-(void)getField:(UITextField *)orderField;

@end

@interface OrderWeight : UIView

//订单重量
@property (nonatomic, strong) UILabel * weightLable;
//重量详情
@property (nonatomic, strong) UITextField * weightDetailField;

//➖
@property (nonatomic, strong) UIButton * minusButton;

//➕
@property (nonatomic, strong) UIButton * plusButton;

@property (nonatomic, weak) id<OrderWeightDelegate> delegate;
@end
