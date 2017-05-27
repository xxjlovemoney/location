//
//  OrderDetailRemainCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/23.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "OrderDetailRemainCell.h"

@implementation OrderDetailRemainCell

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
    //标题Lable
    UILabel * titltLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"单    号"];
    [self addSubview:titltLable];
    [titltLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(20));
        make.centerY.equalTo(self);
    }];
    self.titltLable = titltLable;
    //内容Lable
    UILabel * contentLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:14 text:@"25698456321"];
    contentLable.numberOfLines = 0;
    [self addSubview:contentLable];
    [contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titltLable.right).offset(W(14));
        make.centerY.equalTo(self);
        make.width.equalTo(W(200));
    }];
    self.contentLable = contentLable;
    
    
    UIImageView * line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator"]];
    [self addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.centerX.equalTo(self);
        make.size.equalTo(CGSizeMake(W(375), H(1)));
    }];
}
@end
