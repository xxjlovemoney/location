//
//  ReceiverInfoView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuestName,GuestPhone,GuessAddress,GuestAddressNext;
@interface ReceiverInfoView : UIView
//收方名字
@property (nonatomic, strong) GuestName * receiverName;
//收方电话
@property (nonatomic, strong) GuestPhone * receiverPhone;
//收方地址
@property (nonatomic, strong) GuessAddress * receiverAddress;
//地址下一行
@property (nonatomic, strong) GuestAddressNext * receiverAddressNext;
//历史地址
@property (nonatomic, strong) UILabel * historyLable;
//tableView
@property (nonatomic, strong) UITableView * historyTableView;
@end
