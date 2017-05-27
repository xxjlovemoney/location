//
//  OrderInfoView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuestName,GuestPhone,GuessAddress,GuestAddressNext,OrderPrice,SendTime,OrderWeight,OrderSource,RemarkInfo,TotalPrice;

@protocol OrderInfoViewDelegate <NSObject>
//一键录入按钮点击代理方法
-(void)quickBillButtonClick;

//textField编辑状态监听代理方法
//-(void)textFieldEdit:(UITextField *)textField;

@end
@interface OrderInfoView : UIView



//记录加减数
@property (nonatomic, assign) CGFloat countWeight;

@property (nonatomic, assign) CGFloat countTip;

//客人名称
@property (nonatomic, strong) GuestName * guestName;

//客人电话
@property (nonatomic, strong) GuestPhone * guestPhone;

//客人地址
@property (nonatomic, strong) GuessAddress * guestAddress;
//客人地址换行
@property (nonatomic, strong) GuestAddressNext * addressNext;

//订单价格
@property (nonatomic, strong) OrderPrice * orderPrice;

//配送时间
@property (nonatomic, strong) SendTime * sendTime;

//订单重量
@property (nonatomic, strong) OrderWeight * orderWeight;

//订单来源
@property (nonatomic, strong) OrderSource * orderSource;

//备注
@property (nonatomic, strong) RemarkInfo * remarkInfo;

//小费
@property (nonatomic, strong) OrderWeight * orderTip;

//配送费用
@property (nonatomic, strong) TotalPrice * totalPrice;

//录下一单
@property (nonatomic, strong) XXJButton * nextBill;

//一键录入
@property (nonatomic, strong) XXJButton * quickBill;


//创建代理
@property (nonatomic, weak) id<OrderInfoViewDelegate> delegate;



@end
