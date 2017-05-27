//
//  SSDLoginView.h
//  ssda4ios
//
//  Created by 许小军 on 2017/4/30.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDLoginViewDelegate <NSObject>

- (void)authButtonClick;


@end
@interface SSDLoginView : UIView

//头像
@property (nonatomic, strong) UIImageView *iconView;


//phoneTextField
@property (nonatomic, strong) UITextField *phoneTextField;

//phoneTextField下面的额线
@property(strong,nonatomic) UIImageView * phoneLineImageView;

//验证码extField
@property (nonatomic, strong) UITextField *authTextField;

//验证码extField下面的额线
@property(strong,nonatomic) UIImageView * authLineImageView;

//验证码按钮
@property (nonatomic, strong) UIButton *authButton;

//设置代理
@property(weak,nonatomic) id<SSDLoginViewDelegate> delegate;



//






@end
