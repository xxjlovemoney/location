//
//  ErrandGuestPhone.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ErrandGuestPhone : UIView

//titleLabe
@property (nonatomic, strong) UILabel * phoneLable;
//textField
@property (nonatomic, strong) UITextField * phoneField;
//切换座机按钮
@property (nonatomic, strong) UIButton * changeButton;
//注意：
@property (nonatomic, strong) UILabel * attentionLable;
@end
