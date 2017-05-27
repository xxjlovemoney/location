//
//  GuestName.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 客人名称=====================

#import "GuestName.h"

@interface GuestName ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation GuestName
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    //名称
    self.nameLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"客人名字"];
    [self addSubview:self.nameLable];
    [self.nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
        
    }];
    
    
    //输入textField
    self.nameField = [[UITextField alloc]init];
    self.nameField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"输入名字" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    [self.nameField setTextColor:[UIColor whiteColor]];
    self.nameField.borderStyle = UITextBorderStyleNone ;
    self.nameField.font = [UIFont systemFontOfSize:14];
    [self.nameField sizeToFit];
    [self addSubview: self.nameField];
    [self.nameField makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.nameLable.right).offset(23);
        
    }];
    
    //性别按钮
    self.womanButton = [UIButton buttonWithTitle:@"女士" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    [self.womanButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.womanButton];
    [self.womanButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-33));
        make.centerY.equalTo(self);
    }];
    
    
    self.manButton = [UIButton buttonWithTitle:@"先生" NormalbackImageTitle:@"trans botton 44x21" SelectedbackImageTitle:@"white botton 44x21"];
    self.manButton.selected = YES;
    self.preBtn = self.manButton;
    [self.manButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.manButton sizeToFit];
    [self addSubview:self.manButton];
    [self.manButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        if (WIDTH == 320) {
            make.right.equalTo(self.womanButton.left).offset(W(-10));
        }else{
            make.right.equalTo(self.womanButton.left).offset(W(-20));
        }
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    
    
}


#pragma mark -- 性别按钮 点击事件
-(void)btnClick:(UIButton *)sender
{
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
}



























@end
