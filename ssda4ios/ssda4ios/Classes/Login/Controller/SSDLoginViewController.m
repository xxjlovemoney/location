//
//  SSDLoginViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/4/30.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDLoginViewController.h"
#import "SSDLoginView.h"

@interface SSDLoginViewController ()<SSDLoginViewDelegate>

@property(strong,nonatomic)SSDLoginView * loginView;
@end

@implementation SSDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化控件
    [self setUpUI];
    
    //键盘弹出
    [self keyBoardManage];
    
    //增加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self.view addGestureRecognizer:tap];
    
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

#pragma mark -- 手势点击事件
//手势点击事件
- (void)click{
    [self.loginView.authTextField resignFirstResponder];
    [self.loginView.phoneTextField resignFirstResponder];
}
#pragma mark -- 初始化控件
-(void)setUpUI
{
    self.loginView = [[SSDLoginView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.loginView.delegate = self;

    [self.view addSubview:self.loginView];
}

#pragma mark --键盘弹出
- (void)keyBoardManage{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}


#pragma mark ---- 根据键盘高度将当前视图向上滚动同样高度
///键盘显示事件
- (void)keyboardWillShow:(NSNotification *)notification {
    //下划线变颜色
    if ([self.loginView.phoneTextField isEditing]) {
        self.loginView.phoneLineImageView.image = [UIImage imageNamed:@"input line-active"];
    }
    
    if ([self.loginView.authTextField isEditing]) {
        self.loginView.authLineImageView.image = [UIImage imageNamed:@"input line-active"];
    }
    
    
    //获取键盘高度，在不同设备上，以及中英文下是不同的
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    //计算出键盘顶端到inputTextView panel底端的距离(加上自定义的缓冲距离INTERVAL_KEYBOARD)
    CGFloat offset = kbHeight;
    
    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //将视图上移计算好的偏移
    if(offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
            
            self.loginView.iconView.frame = CGRectMake(WIDTH/2.0 - W(43), offset + H(57), W(86), H(86));
            
            self.loginView.phoneTextField.frame = CGRectMake(WIDTH/2.0-W(125), CGRectGetMaxY(self.loginView.iconView.frame) , W(250), H(30));
            
            self.loginView.phoneLineImageView.frame = CGRectMake(WIDTH/2.0-W(125),CGRectGetMaxY(self.loginView.phoneTextField.frame), W(250), H(1));
            
            self.loginView.authTextField.frame = CGRectMake(self.loginView.phoneTextField.xxj_x, CGRectGetMaxY(self.loginView.phoneLineImageView.frame) + H(24), W(100), H(30));
            
            self.loginView.authLineImageView.frame =CGRectMake(self.loginView.authTextField.xxj_x, CGRectGetMaxY(self.loginView.authTextField.frame), W(250), H(1));
            
            self.loginView.authButton.frame = CGRectMake(WIDTH - 150, CGRectGetMinY(self.loginView.authTextField.frame), W(150), H(30));
        }];
    }
}


#pragma mark ---- 当键盘消失后，视图需要恢复原状
///键盘消失事件
- (void)keyboardWillHide:(NSNotification *)notify {
    //下划线变颜色
    if ([self.loginView.phoneTextField isEditing]) {
        self.loginView.phoneLineImageView.image = [UIImage imageNamed:@"separator"];
    }
    
    if ([self.loginView.authTextField isEditing]) {
        self.loginView.authLineImageView.image = [UIImage imageNamed:@"separator"];
    }
    
    // 键盘动画时间
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //视图下沉恢复原状
    [UIView animateWithDuration:duration animations:^{
        
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        self.loginView.iconView.frame = CGRectMake(WIDTH/2.0 - W(43), H(57), W(86), H(86));
        
        self.loginView.phoneTextField.frame = CGRectMake(WIDTH/2.0-W(125), CGRectGetMaxY(self.loginView.iconView.frame) + H(100) , W(250), H(30));
        
        self.loginView.phoneLineImageView.frame = CGRectMake(WIDTH/2.0-W(125),CGRectGetMaxY(self.loginView.phoneTextField.frame), W(250), H(1));
        
        self.loginView.authTextField.frame = CGRectMake(self.loginView.phoneTextField.xxj_x, CGRectGetMaxY(self.loginView.phoneLineImageView.frame) + H(24), W(100), H(30));
        
        self.loginView.authLineImageView.frame =CGRectMake(self.loginView.authTextField.xxj_x, CGRectGetMaxY(self.loginView.authTextField.frame), W(250), H(1));
        
        self.loginView.authButton.frame = CGRectMake(WIDTH - 150, CGRectGetMinY(self.loginView.authTextField.frame), W(150), H(30));
        
        
    }];
}
//移除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark -- 监听获取验证码按钮点击
//实现代理方法：监听获取验证码按钮点击
-(void)authButtonClick
{
    XXJLog(@"监听到点击了");
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [IQKeyboardManager sharedManager].enable = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
}


@end












