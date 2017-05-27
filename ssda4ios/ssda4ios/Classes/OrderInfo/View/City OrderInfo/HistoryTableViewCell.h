//
//  HistoryTableViewCell.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewCell : UITableViewCell
//选择按钮
@property (nonatomic, strong) UIButton * chooseButton;
//主标题
@property (nonatomic, strong) UILabel * mainTitle;
//副标题
@property (nonatomic, strong) UILabel * subTitle;
@end
