//
//  ErrandGuestPhone.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//


//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 客户电话======================
#import "ErrandGuestPhone.h"

@implementation ErrandGuestPhone

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
    self.phoneLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"客人电话"];
    [self addSubview:self.phoneLable];
    [self.phoneLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.top.equalTo(self.top).offset(H(14));
        
    }];
    
    
    //输入textField
    self.phoneField = [[UITextField alloc]init];
    self.phoneField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"输入客户电话" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    [self.phoneField setTextColor:[UIColor whiteColor]];
    self.phoneField.borderStyle = UITextBorderStyleNone ;
    self.phoneField.font = [UIFont systemFontOfSize:14];
    [self.phoneField sizeToFit];
    [self addSubview: self.phoneField];
    [self.phoneField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(14));
        make.left.equalTo(self.phoneLable.right).offset(23);
    }];
    
    //切换座机按钮
    self.changeButton = [UIButton buttonWithTitle:@"切换座机" NormalbackImageTitle:@"trans botton 56x21" SelectedbackImageTitle:@"white botton 56x21"];
    self.changeButton.selected = YES;
    [self.changeButton addTarget:self action:@selector(changeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeButton];
    [self.changeButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-33));
        make.top.equalTo(self.top).offset(H(14));
    }];
    
    
    //注意
    self.attentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.6] textFont:11 text:@"注：若您填写的客户电话不是本账号注册电话则本账号注册电话将登记为备用电话"];
    self.attentionLable.numberOfLines = 0;
    [self addSubview:self.attentionLable];
    [self.attentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneField.left);
        make.top.equalTo(self.phoneField.bottom).offset(H(15));
        make.right.equalTo(self).offset(W(-26));
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

#pragma mark -- 客人电话。切换座机 按钮点击事件
-(void)changeBtn
{
    self.changeButton.selected = !self.changeButton.selected;
}



@end
