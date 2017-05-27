//
//  StatisticsTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsTableViewCell : UITableViewCell

//日期
@property (nonatomic, strong) UILabel * dataLable;
//收入
@property (nonatomic, strong) UILabel * incomeLable;
//钱（收入）
@property (nonatomic, strong) UILabel * incomeMoneyLable;
//支出
@property (nonatomic, strong) UILabel * outcomeLable;
//钱（支出）
@property (nonatomic, strong) UILabel * outcomeMoneyLable;
//余额
@property (nonatomic, strong) UILabel * remainLable;
//钱
@property (nonatomic, strong) UILabel * remainMoneyLable;



@end
