//
//  SevericeInfoView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuessAddress,GuestAddressNext;

@interface SevericeInfoView : UIView
//服务起点
@property (nonatomic, strong) GuessAddress * severiceOrign;
//下一行
@property (nonatomic, strong) GuestAddressNext * severiceOrignNext;
//tableView
@property (nonatomic, strong) UITableView * originHistoryTableView;

@end
