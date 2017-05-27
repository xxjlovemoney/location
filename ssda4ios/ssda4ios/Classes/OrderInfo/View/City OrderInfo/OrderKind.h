//
//  OrderKind.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OrderKind : UIView
//物品种类
@property (nonatomic, strong) UILabel * kindLable;

//文件
@property (nonatomic, strong) UIButton * fileButton;
//数码产品
@property (nonatomic, strong) UIButton * digitalButton;
//日用品
@property (nonatomic, strong) UIButton * dailySuppliesButton;
//服饰
@property (nonatomic, strong) UIButton * costumeButton;
//食品
@property (nonatomic, strong) UIButton * foodButton;
//其他
@property (nonatomic, strong) UIButton * otherButton;

@end
