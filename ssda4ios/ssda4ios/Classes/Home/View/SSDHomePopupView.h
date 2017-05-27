//
//  SSDHomePopupView.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SSDHomePopupView : UIView
//外卖录单按钮
@property(strong,nonatomic) XXJButton * takeoutBillButton;
//饿了吗按钮
@property(strong,nonatomic) XXJButton * hungryButton;
//美团按钮
@property(strong,nonatomic) XXJButton * meituanButton;
//百度按钮
@property(strong,nonatomic) XXJButton * baiduButton;
//同城快递按钮
@property(strong,nonatomic) XXJButton * cityButton;
//跑腿服务按钮
@property(strong,nonatomic) XXJButton * errandButton;


@end
