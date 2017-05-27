//
//  NotiCenterTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/5.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "NotiCenterTableViewCell.h"

@implementation NotiCenterTableViewCell

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
    //titleLable
    self.titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x282828 alpha:1.0] textFont:14 text:@"取消手续费收取更新通知"];
    [self addSubview:self.titleLable];
    [self.titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(19));
        make.top.equalTo(self).offset(H(9));
    }];
    //详情
    self.detailLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:12 text:@"取消手续费收取更新通知取消手续费收取更新通知取消手续费收取更新通知取消手续费收取更新通知取消手续费收取更新通知"];
    [self addSubview:self.detailLable];
    [self.detailLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(19));
        make.top.equalTo(self.titleLable.bottom).offset(H(12));
        make.right.equalTo(self.right).offset(W(-19));
    }];
    
    //日期
    self.dataLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:12 text:@"2017年4月15日"];
    [self addSubview:self.dataLable];
    [self.dataLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLable);
        make.right.equalTo(self.right).offset(W(-19));
    }];
    
    //下划线
    UIImageView * lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator grey"]];
    [self addSubview:lineImage];
    [lineImage makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.detailLable.bottom).offset(H(10));
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self);
    }];
    
}


@end
