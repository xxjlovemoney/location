//
//  StatisticsTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "StatisticsTableViewCell.h"

@implementation StatisticsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //初始化界面
        [self setUpUI];
        
    }
    return self;
}


-(void)setUpUI
{
    //日期
    self.dataLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:12 text:@"2017年6月"];
    [self addSubview:self.dataLable];
    [self.dataLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(6));
        make.left.equalTo(self).offset(W(33));
    }];
    
    
    //收入
    self.incomeLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:12 text:@"收入"];
    [self addSubview:self.incomeLable];
    [self.incomeLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dataLable.bottom).offset(H(17));
        make.left.equalTo(self).offset(W(33));
    }];
    
    //收入（钱）
    self.incomeMoneyLable =[UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:14 text:@"68.0"];
    [self addSubview:self.incomeMoneyLable];
    [self.incomeMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.incomeLable.bottom).offset(H(7));
        make.left.equalTo(self).offset(W(33));
    }];
    
    
    //支出
    self.outcomeLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:12 text:@"支出"];
    [self addSubview:self.outcomeLable];
    [self.outcomeLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.incomeLable.top);
        make.left.equalTo(self.incomeLable.right).offset(W(95));
    }];
    
    //支出（钱）
    self.outcomeMoneyLable =[UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:14 text:@"1680.0"];
    [self addSubview:self.outcomeMoneyLable];
    [self.outcomeMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.outcomeLable.bottom).offset(H(7));
        make.centerX.equalTo(self.outcomeLable);
    }];
    
    
    //余额
    self.remainLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:12 text:@"余额"];
    [self addSubview:self.remainLable];
    [self.remainLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.incomeLable.top);
        make.left.equalTo(self.outcomeLable.right).offset(W(95));
    }];
    
    //余额（钱）
    self.remainMoneyLable =[UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:14 text:@"98.0"];
    [self addSubview:self.remainMoneyLable];
    [self.remainMoneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.outcomeMoneyLable.top);
        make.centerX.equalTo(self.remainLable);
    }];
    
    
    //下划线
    UIImageView * lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator grey"]];
    [self addSubview:lineImage];
    [lineImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.incomeMoneyLable.bottom).offset(H(7));
        make.centerX.equalTo(self);
    }];
    
    
    
    
    
}
@end
