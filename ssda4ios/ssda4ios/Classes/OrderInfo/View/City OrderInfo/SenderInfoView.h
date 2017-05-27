//
//  SenderInfoView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuestName,GuestPhone,GuessAddress,GuestAddressNext;
@interface SenderInfoView : UIView

//寄放名字
@property (nonatomic, strong) GuestName * senderName;
//寄放电话
@property (nonatomic, strong) GuestPhone * senderPhone;
//寄放地址
@property (nonatomic, strong) GuessAddress * senderAddress;
//地址下一行
@property (nonatomic, strong) GuestAddressNext * senderAddressNext;
//历史地址
@property (nonatomic, strong) UILabel * historyLable;
//tableView
@property (nonatomic, strong) UITableView * historyTableView;
@end
