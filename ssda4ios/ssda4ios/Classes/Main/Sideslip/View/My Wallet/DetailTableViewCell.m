//
//  DetailTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //初始化界面
        [self setUpUI];
        
    }
    return self;
}


#pragma mark -- 初始化界面
-(void)setUpUI
{
    //今天
    self.dayLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:14 text:@"今天"];
    [self addSubview:self.dayLable];
    [self.dayLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.top.equalTo(self.top).offset(H(12));
    }];
    
    //日期
    self.dataLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:10 text:@"4-15"];
    [self addSubview:self.dataLable];
    [self.dataLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.dayLable);
        make.bottom.equalTo(self).offset(-H(10));
    }];
    
    //时间
    self.timeLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x9b9b9b alpha:1.0] textFont:10 text:@"12:30"];
    [self addSubview:self.timeLable];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(72));
        make.centerY.equalTo(self);
    }];
    
    //钱
    self.moneyLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:18 text:@"- 8.00"];
    [self addSubview:self.moneyLable];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(6));
        make.left.equalTo(self.timeLable.right).offset(W(45));
    }];
    
    //消费详情
    self.detailLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:12 text:@"订单1565869845配送费"];
    [self addSubview:self.detailLable];
    [self.detailLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLable.right).offset(W(45));
        make.bottom.equalTo(self.bottom).offset(H(-8));
    }];
    
    //下划线
    UIImageView * lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator grey"]];
    [self addSubview:lineImage];
    [lineImage makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.bottom);
        make.top.equalTo(self.detailLable.bottom).offset(H(7));
        make.centerX.equalTo(self);
    }];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
