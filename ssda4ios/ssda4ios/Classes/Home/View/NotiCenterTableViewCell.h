//
//  NotiCenterTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotiCenterTableViewCell : UITableViewCell
//标题
@property (nonatomic, strong) UILabel * titleLable;
//详情
@property (nonatomic, strong) UILabel * detailLable;
//日期
@property (nonatomic, strong) UILabel * dataLable;
@end
