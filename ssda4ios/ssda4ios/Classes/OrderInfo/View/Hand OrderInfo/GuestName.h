//
//  GuestName.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestName : UIView
//titleLabe
@property (nonatomic, strong) UILabel * nameLable;
//textField
@property (nonatomic, strong) UITextField * nameField;
//性别按钮
//先生
@property (nonatomic, strong) UIButton * manButton;
//女士
@property (nonatomic, strong) UIButton * womanButton;
@end
