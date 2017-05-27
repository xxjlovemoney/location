//
//  SevericeLable.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevericeLable : UIView

//物品种类
@property (nonatomic, strong) UILabel * kindLable;

//代购
@property (nonatomic, strong) UIButton * help_BuyButton;

//代排队
@property (nonatomic, strong) UIButton * help_QueueButton;

//代办事
@property (nonatomic, strong) UIButton * help_WorkButton;

//代取物
@property (nonatomic, strong) UIButton * help_FetchButton;

//其他
@property (nonatomic, strong) UIButton * otherButton;

@end
