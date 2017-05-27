//
//  PulldownView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PulldownView : UIView
//titleLable
@property (nonatomic, strong) UILabel * titleLable;
//账号
@property (nonatomic, strong) UITextField * accountField;
//密码
@property (nonatomic, strong) UITextField * passwordField;
//确认按钮
@property (nonatomic, strong) UIButton * sureButton;
//取消按钮
@property (nonatomic, strong) UIButton * cancelButton;

@property (nonatomic, strong) UIImageView * bottomImageViewLine;
@end
