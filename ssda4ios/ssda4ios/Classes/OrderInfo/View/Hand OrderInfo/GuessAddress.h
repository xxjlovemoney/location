//
//  GuessAddress.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessAddress : UIView
//titleLabe
@property (nonatomic, strong) UILabel * addressLable;
//地址详情
@property (nonatomic, strong) UILabel * detailAddressLable;
//详情按钮
@property (nonatomic, strong) UIButton * detailButton;

@end
