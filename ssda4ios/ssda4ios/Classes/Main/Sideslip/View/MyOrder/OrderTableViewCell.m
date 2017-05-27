//
//  OrderTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/12.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell
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
    //订单编号
    UILabel * number = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"订单编号："];
    [self addSubview:number];
    [number makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(10));
        make.left.equalTo(self).offset(W(20));
    }];
    
    self.numberLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"325698457"];
    [self addSubview:self.numberLable];
    [self.numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number.right).offset(W(5));
        make.centerY.equalTo(number);
    }];
    //收获地址
    UILabel * address = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"收获地址："];
    [self addSubview:address];
    [address makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number);
        make.top.equalTo(number.bottom).offset(H(10));
    }];
    
    self.receiveAddress = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"上海市闵行区七宝镇吴宝路996号8号1803室"];
    self.receiveAddress.numberOfLines = 0;
    [self addSubview:self.receiveAddress];
    [self.receiveAddress makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(address.right).offset(W(5));
        make.top.equalTo(address);
        make.width.equalTo(W(180));
    }];
    
    //订单时间
    UILabel * time = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"订单时间："];
    [self addSubview:time];
    [time makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number);
        make.top.equalTo(self.receiveAddress.bottom).offset(H(10));
    }];
    
    self.timeLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"4月12日 12:58"];
    [self addSubview:self.timeLable];
    [self.timeLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.receiveAddress.left);
        make.centerY.equalTo(time);
    }];
    
    //收获人
    UILabel * person = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"收获人："];
    [self addSubview:person];
    [person makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number);
        make.top.equalTo(time.bottom).offset(H(10));
    }];
    
    self.personLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"富强强 先生"];
    [self addSubview:self.personLable];
    [self.personLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.receiveAddress.left);
        make.centerY.equalTo(person);
    }];
    
    //订单总价
    UILabel * price = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"订单总价："];
    [self addSubview:price];
    [price makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(number);
        make.top.equalTo(person.bottom).offset(H(10));
    }];
    
    self.totalPrice = [UILabel lableWithTextColor:[UIColor blackColor] textFont:12 text:@"18元"];
    [self addSubview:self.totalPrice];
    [self.totalPrice makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.receiveAddress.left);
        make.centerY.equalTo(price);
    }];
    
    
    //#68
    self.orderNumber = [UILabel lableWithTextColor:RGBCOLOR(0, 115, 166) textFont:26 text:@"#68"];
    [self addSubview:self.orderNumber];
    [self.orderNumber makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-20));
        make.top.equalTo(number.top);
    }];
    
    //更多按钮
    self.forwardButton = [[UIButton alloc]init];
    [self.forwardButton setImage:[UIImage imageNamed:@"forward black"] forState:UIControlStateNormal];
    [self.forwardButton sizeToFit];
    [self addSubview:self.forwardButton];
    [self.forwardButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.right).offset(W(-20));
    }];
    
    //下划线
    UIImageView * lineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"separator grey"]];
    [self addSubview:lineImageView];
    [lineImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(price.bottom).offset(H(5));
        make.centerX.equalTo(self);
    }];
    
    
    
    
}




@end
