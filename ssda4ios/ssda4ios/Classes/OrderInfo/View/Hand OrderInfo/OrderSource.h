//
//  OrderSource.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderSource : UIView

//订单来源
@property (nonatomic, strong) UILabel * sourceLable;

//饿了吗
@property (nonatomic, strong) UIButton * hungryButton;
//美团
@property (nonatomic, strong) UIButton * meituanButton;
//百度
@property (nonatomic, strong) UIButton * baiduButton;
//其他
@property (nonatomic, strong) UIButton * otherButton;
@end
