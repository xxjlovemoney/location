//
//  SendTime.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendTime : UIView

//配送时间
@property (nonatomic, strong) UILabel * timeLable;

//实时
@property (nonatomic, strong) UIButton * currentTimeButton;

//预约
@property (nonatomic, strong) UIButton * appointTimeButton;
@end
