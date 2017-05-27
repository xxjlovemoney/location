//
//  SevericeContent.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//==============================底部视图 -> 跑腿服务-> 跑腿服务发单内容封装 -> 服务内容======================

#import "SevericeContent.h"

@implementation SevericeContent
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
    //服务内容
    UILabel * severiceLabe = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"服务内容"];
    [self addSubview:severiceLabe];
    [severiceLabe makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //服务内容详情
    //输入原因
    self.staffTextView = [[BRPlaceholderTextView alloc]init];
    self.staffTextView.layer.borderColor = [UIColor colorWithHexValue:0xFFFFFF alpha:0.6].CGColor;
    [self.staffTextView setTextColor:[UIColor whiteColor]];
    self.staffTextView.layer.borderWidth = 0.5;
    self.staffTextView.layer.cornerRadius = 2;
    self.staffTextView.backgroundColor = RGBCOLOR(0, 101, 90);
    [self.staffTextView setPlaceholderColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.6]];
    [self.staffTextView setPlaceholderFont:[UIFont systemFontOfSize:11]];
    self.staffTextView.placeholder = @"请输入需要跑腿的服务内容，尽量详细";
    [self addSubview:self.staffTextView];
    [self.staffTextView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(12));
        make.left.equalTo(severiceLabe.right).offset(W(23));
        make.right.equalTo(self.right).offset(W(-26));
//        make.size.equalTo(CGSizeMake(W(236), H(100)));
        make.height.equalTo(H(100));
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(124));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
  
}
     
     
@end
