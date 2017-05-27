//
//  CityInfoView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SenderInfo,SettingReceiverInfo,SendTime,OrderWeight,OrderKind,RemarkInfo,TotalPrice;


@protocol CityInfoViewDelegate <NSObject>
//寄放更多按钮点击事件代理方法
-(void)senderDetailButtonClick;
//点击设置收方信息按钮点击事件代理方法
-(void)receiverInfoButtonClick;
//确认按钮点击事件
-(void)OkButtonClick;


@end

@interface CityInfoView : UIView

//寄放信息
@property (nonatomic, strong) SenderInfo * senderInfo;
//设置收方信息
@property (nonatomic, strong) SettingReceiverInfo * receiverInfo;
//配送时间
@property (nonatomic, strong) SendTime * sendtime;
//物品重量
@property (nonatomic, strong) OrderWeight * orderWeight;
//物品种类
@property (nonatomic, strong) OrderKind * orderkind;
//备注
@property (nonatomic, strong) RemarkInfo * remarkInfo;
//小费
@property (nonatomic, strong) OrderWeight * orderTip;
//配送费用
@property (nonatomic, strong) TotalPrice * totalPrice;
//点击确认
@property (nonatomic, strong) XXJLeftRightButton * OkButton;


//创建代理
@property (nonatomic, weak) id<CityInfoViewDelegate> delegate;
@end
