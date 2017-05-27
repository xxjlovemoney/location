//
//  OrderDetailFirstCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/23.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "OrderDetailFirstCell.h"

@implementation OrderDetailFirstCell

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
    //服务费
    UILabel * serveLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"服务费"];
    [self addSubview:serveLable];
    [serveLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(20));
        make.centerY.equalTo(self);
    }];
    self.serveLable = serveLable;
    
    //服务费详情
    UILabel * severDetailLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"¥15.0"];
    [self addSubview:severDetailLable];
    [severDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serveLable.right).offset(W(28));
        make.centerY.equalTo(self);
    }];
    self.severDetailLable = severDetailLable;
    
    
    //小费
    UILabel * tipLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"小  费"];
    [self addSubview:tipLable];
    [tipLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.severDetailLable.right).offset(W(50));
        make.centerY.equalTo(self);
    }];
    //小费详情
    UILabel * tipDetailLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"¥10.0"];
    [self addSubview:tipDetailLable];
    [tipDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipLable.right).offset(W(28));
        make.centerY.equalTo(self);
    }];
    
    UIImageView * line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
    }];
    
    
    
}
@end
