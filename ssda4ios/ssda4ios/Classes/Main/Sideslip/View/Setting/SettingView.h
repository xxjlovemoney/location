//
//  SettingView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AboutMe;

@protocol SettingViewDelegate <NSObject>

//更换登录手机号代理方法
-(void)changeNumberBtnClick;
//设置一键发单代理方法
-(void)quickBillBtnClick;
//关于代理方法
-(void)aboutBtnClick;
//退出登录代理方法
-(void)logOutBtnClick;

@end
@interface SettingView : UIView
//更换登录手机号
@property (nonatomic, strong) AboutMe * changePhoneNumber;
//设置一键发单
@property (nonatomic, strong) AboutMe * quickBill;
//关于
@property (nonatomic, strong) AboutMe * about;
//退出登录
@property (nonatomic, strong) AboutMe * logOut;

@property (nonatomic, weak) id<SettingViewDelegate> delegate;

@end
