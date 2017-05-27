//
//  OrderTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/12.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

//订单编号(数据)
@property (nonatomic, strong) UILabel * numberLable;
//收获地址(数据)
@property (nonatomic, strong) UILabel * receiveAddress;
//订单时间(数据)
@property (nonatomic, strong) UILabel * timeLable;
//收获人(数据)
@property (nonatomic, strong) UILabel * personLable;
//订单总价(数据)
@property (nonatomic, strong) UILabel * totalPrice;
//#68
@property (nonatomic, strong) UILabel * orderNumber;
//箭头
@property (nonatomic, strong) UIButton * forwardButton;



@end
