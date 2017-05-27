//
//  OrderDetailScrollView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PublishBtnView,ReceivingBtnView,ArriveStartBtnView,ServingBtnView,EndBtnView;
@interface OrderDetailScrollView : UIScrollView
//最上面的进度view
@property (nonatomic, strong) UIImageView * processImageView;

//#68
@property (nonatomic, strong) UILabel * numberLable;
//服务Lable
@property (nonatomic, strong) UILabel * kindLable;
//进度按钮
//发布中按钮视图
@property (nonatomic, strong) PublishBtnView * publishBtnView;

//已派单按钮
@property (nonatomic, strong) ReceivingBtnView * receivingBtnView;

//到起点
@property (nonatomic, strong) ArriveStartBtnView  * arriveStartBtnView;

//服务中
@property (nonatomic, strong) ServingBtnView * servingBtnView;

//已结束
@property (nonatomic, strong) EndBtnView * endBtnView;



//中间view左边的图片
@property (nonatomic, strong) UIImageView * iconImageView;
//等待配送员接单
@property (nonatomic, strong) UILabel * iconLable;


//配送员姓名
@property (nonatomic, strong) UILabel * deliverNameLable;
//配送员电话
@property (nonatomic, strong) UILabel * deliverPhoneLable;

//电话按钮
@property (nonatomic, strong) UIButton * phoneButton;


//底部的tableView
@property (nonatomic, strong) UITableView * bottomTableView;




@end
