//
//  DetailTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell
//哪天
@property (nonatomic, strong) UILabel * dayLable;
//日期
@property (nonatomic, strong) UILabel * dataLable;
//时间
@property (nonatomic, strong) UILabel * timeLable;
//钱
@property (nonatomic, strong) UILabel * moneyLable;
//详细费用说明
@property (nonatomic, strong) UILabel * detailLable;


@end
