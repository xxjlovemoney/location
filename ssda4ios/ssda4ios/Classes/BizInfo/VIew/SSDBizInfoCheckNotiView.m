//
//  SSDBizInfoCheckNotiView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoCheckNotiView.h"

@implementation SSDBizInfoCheckNotiView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}


#pragma mark -- 界面初始化
-(void)setUpUI
{
    //下划线
    UIImageView * line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kMarginTopHeight);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
    }];
    
    
    //时钟图片
    UIImageView * clockImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"question"]];
    [self addSubview:clockImageView];
    [clockImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(146)+kMarginTopHeight);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(29, 49));
    }];
    
    //
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(14) text:@"抱歉，您的验证未审核通过"];
    titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(clockImageView.bottom).offset(H(36));
        make.centerX.equalTo(self);
    }];
    
    
    UILabel * nexttitleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:1.0] textFont:W(14) text:@"未通过原因：\n手持身份证照片不清晰"];
    nexttitleLable.textAlignment = NSTextAlignmentCenter;
    nexttitleLable.numberOfLines = 0;
    [self addSubview:nexttitleLable];
    [nexttitleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(36));
        make.centerX.equalTo(self);
    }];
    
    UIImageView * bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"button"]];
    bottomImageView.userInteractionEnabled = YES;
    [self addSubview:bottomImageView];
    [bottomImageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(199));
    }];
    
    
    
    //底部按钮
    
    UIButton * updateBtn = [[UIButton alloc]init];
    [updateBtn setTitle:@"请点击此处进行修改" forState:UIControlStateNormal];
    [updateBtn addTarget:self action:@selector(updateClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:updateBtn];
    [updateBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(80));
    }];
    
    
}



-(void)updateClick
{
    if ([self.delegate respondsToSelector:@selector(updateButtonClick)]) {
        [self.delegate updateButtonClick];
    }
}
@end
