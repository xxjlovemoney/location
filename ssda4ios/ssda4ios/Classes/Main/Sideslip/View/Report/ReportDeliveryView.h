//
//  ReportDeliveryView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportDeliveryView : UIView
//请输入配送员名称
@property (nonatomic, strong) UITextField * deliveryNameField;
//请输入配送员联系方式
@property (nonatomic, strong) UITextField * deliveryPhoneField;
//输入原因
@property (nonatomic, strong) BRPlaceholderTextView * deliveryTextView;

@end
