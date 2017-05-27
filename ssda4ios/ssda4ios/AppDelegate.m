//
//  AppDelegate.m
//  ssda4ios
//
//  Created by 许小军 on 2017/4/30.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "AppDelegate.h"
#import "SSDNavgationController.h"
#import "SSDLoginViewController.h"
#import "SSDHomeViewController.h"

#define AMap_Key @"941148985a21a5bf29abe21360611381"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //键盘设置
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    // 控制整个功能是否启用
    manager.enable = YES;
    // 控制点击背景是否收起键盘
    manager.shouldResignOnTouchOutside = YES;
    // 控制是否显示键盘上的工具条
    manager.enableAutoToolbar = YES;
    // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews;
    // 输入框距离键盘的距离
    manager.keyboardDistanceFromTextField = 10.0f;
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
//    SSDLoginViewController * ssdlogin = [[SSDLoginViewController alloc]init];
    
    SSDHomeViewController * ssdhome = [[SSDHomeViewController alloc]init];
    SSDNavgationController * ssdnav = [[SSDNavgationController alloc]initWithRootViewController:ssdhome];
    
    self.window.rootViewController = ssdnav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
