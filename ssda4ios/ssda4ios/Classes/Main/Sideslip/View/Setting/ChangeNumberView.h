//
//  ChangeNumberView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChangeNum;
@interface ChangeNumberView : UIView
//姓名
@property (nonatomic, strong) ChangeNum * name;
//身份证
@property (nonatomic, strong) ChangeNum * IDcard;
//原手机
@property (nonatomic, strong) ChangeNum * prePhoneNumber;
//新手机
@property (nonatomic, strong) ChangeNum * currentPhoneNumber;
//验证码
@property (nonatomic, strong) ChangeNum * authCode;
//获取验证码按钮
@property (nonatomic, strong) UIButton * getAuthBtn;
@end
