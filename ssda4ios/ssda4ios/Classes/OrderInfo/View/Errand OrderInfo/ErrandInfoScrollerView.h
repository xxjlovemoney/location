//
//  ErrandInfoScrollerView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuestName,ErrandGuestPhone,SevericeOrigin,SevericeEnd,SevericeTime,SevericeContent,SevericeLable,OrderWeight,TotalPrice;

@protocol ErrandInfoScrollerViewDelegate <NSObject>
//服务起点更多按钮点击代理方法
-(void)moreButtonClick;
//服务终点按钮点击代理方法
-(void)endButtonClick;
//点击确认
-(void)sureButtonClick;


@end

@interface ErrandInfoScrollerView : UIScrollView


//客户姓名
@property (nonatomic, strong) GuestName * guestName;
//客户电话
@property (nonatomic, strong) ErrandGuestPhone * guestPhone;
//服务起点
@property (nonatomic, strong) SevericeOrigin * severiceOrigin;
//服务终点
@property (nonatomic, strong) SevericeEnd * severiceEnd;
//服务时间
@property (nonatomic, strong) SevericeTime * severiceTime;
//服务内容
@property (nonatomic, strong) SevericeContent * severiceContent;
//服务标签
@property (nonatomic, strong) SevericeLable * severiceLable;
//小费
@property (nonatomic, strong) OrderWeight * orderTip;
//跑腿服务
@property (nonatomic, strong) TotalPrice * totalPrice;
//确认
@property (nonatomic, strong) XXJLeftRightButton * OkButton;

//滚动范围最大值
@property (nonatomic, assign) NSInteger maxHeight;

//创建代理
@property (nonatomic, weak) id<ErrandInfoScrollerViewDelegate> ButtonDelegate;

@end
