//
//  SSDHomeTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/18.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SSDHomeTableViewCell : UITableViewCell

//预约图片
@property (nonatomic, weak) UIImageView * reserveImageView;
//#号
@property (nonatomic, weak) UILabel * numberLable;
//订单来源按钮
@property (nonatomic, weak) UIButton * sourceButton;

//实时lable
@property (nonatomic, weak) UILabel * currentTimeLable;

//已派单
@property (nonatomic, strong) UIButton * alreadyOrderButton;
//到起点
@property (nonatomic, weak) UIButton * originButton;
//运输中
@property (nonatomic, weak) UIButton * sendingButton;


//寄图片
@property (nonatomic, weak) UIImageView * expressImageView;
//寄 地址详情
@property (nonatomic, weak) UILabel * expressAddressLable;
//寄 联系人
@property (nonatomic, weak) UILabel * expressContactLabe;
//寄 距离
@property (nonatomic, weak) UILabel * lengthExpressLable;

//送图片
@property (nonatomic, weak) UIImageView * sendImageView;
//送 地址详情
@property (nonatomic, weak) UILabel * sendAddresslable;
//送 联系人
@property (nonatomic, weak) UILabel * sendContactLable;

//送 Lable
@property (nonatomic, weak) UILabel * sendLable;
//送 距离
@property (nonatomic, weak) UILabel * lengthSendLable;


//联系客户。   饿了吗 -->>联系客户
@property (nonatomic, weak) UIButton * contactGuestButton;
//物品描述。  同城快递 -->>物品描述
@property (nonatomic, weak) UILabel * goodsDetailLable;
//代取物。    跑腿服务 -->>代取物
@property (nonatomic, weak) UIButton * help_FetchButton;

//增加小费
@property (nonatomic, weak) UIButton * addTipButton;

//联系配送员
@property (nonatomic, weak) UIButton * contactDeliverymanButton;




//下划线
@property (nonatomic, weak) UIImageView * bottomImageViewLine;

@property (nonatomic, assign) CGFloat maxHeight;






@end
