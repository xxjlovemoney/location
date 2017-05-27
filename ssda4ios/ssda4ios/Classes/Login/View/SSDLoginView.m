//
//  SSDLoginView.m
//  ssda4ios
//
//  Created by 许小军 on 2017/4/30.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDLoginView.h"

@interface SSDLoginView ()
//设置登陆按钮
@property(strong,nonatomic) UIButton * ssdLoginButton;


@end
@implementation SSDLoginView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置内容
        [self setUpUI];
    }
    return self;
}


//设置内容
-(void)setUpUI
{
    //设置头像
    self.iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    self.iconView.layer.cornerRadius = W(43);
    self.iconView.clipsToBounds = YES;
//    self.iconView.backgroundColor = [UIColor redColor];
    [self addSubview:self.iconView];
    
    [self.iconView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(57));
        make.size.equalTo(CGSizeMake(W(86), H(86)));
        make.centerX.equalTo(self.centerX);
    }];
    
    //设置电话texdField
    self.phoneTextField = [[UITextField alloc]init];
    self.phoneTextField.placeholder = @"请输入手机号";
    self.phoneTextField.tintColor = [UIColor colorWithHexValue:0x01608A alpha:1.0];
    self.phoneTextField.font = [UIFont systemFontOfSize:H(14)];
    self.phoneTextField.textColor = [UIColor blackColor];
    self.phoneTextField.placeholderColor = [UIColor colorWithHexValue:0x838383 alpha:1.0];
    [self addSubview:self.phoneTextField];
    [self.phoneTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.bottom).offset(H(100));
        make.size.equalTo(CGSizeMake(W(250), H(30)));
        make.centerX.equalTo(self);
    }];
    
    //设置电话下面的线
    self.phoneLineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
    [self addSubview:self.phoneLineImageView];
    [self.phoneLineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(W(250), H(1)));
        make.left.equalTo(self.phoneTextField);
        make.top.equalTo(self.phoneTextField.bottom);
    }];
    
    
    //设置验证码textfield
    self.authTextField = [[UITextField alloc]init];
    self.authTextField.font = [UIFont systemFontOfSize:W(14)];
    self.authTextField.textColor = [UIColor blackColor];
    self.authTextField.placeholderColor = [UIColor colorWithHexValue:0x838383 alpha:1.0];
    self.authTextField.placeholder = @"请输入验证码";
    [self addSubview:self.authTextField];
    [self.authTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.bottom).offset(H(24));
        make.size.equalTo(CGSizeMake(W(100), H(30)));
        make.left.equalTo(self.phoneTextField.left);
    }];
    
    
    //设置验证码下面的线
    self.authLineImageView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
    [self addSubview:self.authLineImageView];
    [self.authLineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authTextField.bottom);
        make.size.equalTo(CGSizeMake(W(250), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //设置获取验证码按钮
    self.authButton = [[UIButton alloc]init];
    [self.authButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.authButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.authButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    [self.authButton addTarget:self action:@selector(authButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.authButton];
    [self.authButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authTextField);
        make.size.equalTo(CGSizeMake(W(150), H(30)));
        make.right.equalTo(self);
    }];
    
    
    
    //设置最下面的按钮
    self.ssdLoginButton = [[UIButton alloc]init];
    [self.ssdLoginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.ssdLoginButton setBackgroundImage:[UIImage imageNamed:@"buttom"] forState:UIControlStateNormal];
    [self.ssdLoginButton setTitleColor:[UIColor colorWithHexValue:0xffffff alpha:1.0] forState:UIControlStateNormal];
    self.ssdLoginButton.titleLabel.font = [UIFont systemFontOfSize:W(18)];
    [self addSubview:self.ssdLoginButton];
    [self.ssdLoginButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(58));
    }];
    
    //设置按钮上面的服务条款
    UILabel *clauseLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x0072a2 alpha:1.0] textFont:W(12) text:@"《随时达服务条款》"];
    clauseLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:clauseLable];
    [clauseLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.ssdLoginButton.top).offset(- H(22));
        make.size.equalTo(CGSizeMake(W(130), H(13)));
        make.centerX.equalTo(self);
    }];
    
    //设置上面的说明标签
    UILabel *explainLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:W(12) text:@"本APP无需注册,首次登陆自动完成注册"];
    explainLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:explainLable];
    [explainLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(clauseLable.top).offset( -H(6));
        make.size.equalTo(CGSizeMake(W(250), H(13)));
    }];
}





-(void)authButtonClick
{
    XXJLog(@"点击了验证码按钮");
    if ([self.delegate respondsToSelector:@selector(authButtonClick)]) {
        [self.delegate authButtonClick];
    }
    
    //按钮内容改变
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.authButton setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.authButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
                self.authButton.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.authButton setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.authButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
                self.authButton.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}



































@end
