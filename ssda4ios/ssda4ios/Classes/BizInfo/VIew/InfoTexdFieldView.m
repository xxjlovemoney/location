//
//  InfoTexdFieldView.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//



#import "InfoTexdFieldView.h"

@interface InfoTexdFieldView ()<UITextFieldDelegate>

@end

@implementation InfoTexdFieldView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI
{
    self.headLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x131313 alpha:1.0] textFont:W(14) text:nil];
    [self addSubview:self.headLable];
    [self.headLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    self.contentField = [[UITextField alloc]init];
    //关闭键盘上的联想功能
    self.contentField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.contentField.delegate = self;
    self.contentField.placeholder = @"请输入真实姓名";
    self.contentField.font = [UIFont systemFontOfSize:13];
    [self.contentField setPlaceholderColor:[UIColor colorWithHexValue:0x838383 alpha:1.0]];
//    self.contentField.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.contentField];
    [self.contentField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headLable.right).offset(W(25));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(120), H(30)));
    }];
    
    UIImageView * lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
    [self addSubview:lineImageView];
    [lineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
}


#pragma mark -- UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(getStr:infoView:)]) {
        [_delegate getStr:textField.text infoView:self];
    }
}



@end

















