//
//  SevericeTime.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevericeTime : UIView
//实时
@property (nonatomic, strong) UIButton * currentTimeButton;
//预约
@property (nonatomic, strong) UIButton * appointTimeButton;
//小时
@property (nonatomic, strong) UILabel * hourLable;
//加号
@property (nonatomic, strong) UIButton * plusButton;
//减号
@property (nonatomic, strong) UIButton * minusButton;
@end
