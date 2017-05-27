//
//  SSDHomeTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/18.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================主界面-> tableView -> 自定义cell=================================


#import "SSDHomeTableViewCell.h"

@implementation SSDHomeTableViewCell

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
    //左上角预约图片
    UIImageView * reserveImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"reserve"]];
    [self addSubview:reserveImageView];
    [reserveImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(W(10));
    }];
    self.reserveImageView = reserveImageView;
    
    //编号 #号
    UILabel * numberLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:20 text:@"#86"];
    [self addSubview:numberLable];
    [numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(52));
        make.top.equalTo(self).offset(H(16));
    }];
    self.numberLable = numberLable;
    
    //订单来源按钮
    UIButton * sourceButton = [[UIButton alloc]init];
    [sourceButton setBackgroundImage:[UIImage imageNamed:@"catagory label"] forState:UIControlStateNormal];
    [sourceButton setTitle:@"跑腿服务" forState:UIControlStateNormal];
    [sourceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sourceButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:sourceButton];
    [sourceButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLable.right).offset(W(10));
        make.bottom.equalTo(self.numberLable.bottom);
    }];
    self.sourceButton = sourceButton;
    
    //实时lable
    UILabel * currentTimeLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:12 text:@"实时"];
    [self addSubview:currentTimeLable];
    [currentTimeLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(W(-24));
        make.centerY.equalTo(self.sourceButton);
    }];
    self.currentTimeLable = currentTimeLable;
    
    
    //已派单
    UIButton * alreadyOrderButton = [[UIButton alloc]init];
    [alreadyOrderButton setTitle:@"已派单" forState:UIControlStateNormal];
    alreadyOrderButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [alreadyOrderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [alreadyOrderButton setBackgroundImage:[UIImage imageNamed:@"step label"] forState:UIControlStateNormal];
    [self addSubview:alreadyOrderButton];
    [alreadyOrderButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self.sourceButton);
    }];
    self.alreadyOrderButton = alreadyOrderButton;
    self.alreadyOrderButton.hidden = YES;
    
    //到起点
    UIButton * originButton = [[UIButton alloc]init];
    [originButton setTitle:@"到起点" forState:UIControlStateNormal];
    originButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [originButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [originButton setBackgroundImage:[UIImage imageNamed:@"step label"] forState:UIControlStateNormal];
    [self addSubview:originButton];
    [originButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self.sourceButton);
    }];
    self.originButton = originButton;
    self.originButton.hidden = YES;
    
    //运输中
    UIButton * sendingButton = [[UIButton alloc]init];
    [sendingButton setTitle:@"运输中" forState:UIControlStateNormal];
    sendingButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [sendingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendingButton setBackgroundImage:[UIImage imageNamed:@"step label"] forState:UIControlStateNormal];
    [self addSubview:sendingButton];
    [sendingButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self.sourceButton);
    }];
    self.sendingButton = sendingButton;
    self.sendingButton.hidden = YES;
    
    
    
    
    //寄图片
    UIImageView * expressImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"express start"]];
    [self addSubview:expressImageView];
    [expressImageView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.left).offset(W(42));
        make.top.equalTo(self.numberLable.bottom).offset(H(10));
    }];
    self.expressImageView = expressImageView;
    
    
    
    //寄 地址详情
    UILabel * expressAddressLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"上海市浦东新区沈梅路888弄宇宙智慧湾66号101室"];
    expressAddressLable.numberOfLines = 0;
    [self addSubview:expressAddressLable];
    [expressAddressLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.expressImageView.right).offset(W(10));
        make.top.equalTo(self.expressImageView);
        make.width.equalTo(W(200));
    }];
    self.expressAddressLable = expressAddressLable;
    
    //寄 联系人
    UILabel * expressContactLabe = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"雷先生，15896521244"];
    [self addSubview:expressContactLabe];
    [expressContactLabe makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.expressImageView.right).offset(W(10));
        make.top.equalTo(self.expressAddressLable.bottom).offset(H(5));
        make.width.equalTo(W(150));
    }];
    self.expressContactLabe = expressContactLabe;
    
    //寄 距离
    UILabel * lengthExpressLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x4DADFF alpha:1.0] textFont:11 text:@"0.0km"];
    [self addSubview:lengthExpressLable];
    [lengthExpressLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(W(-24));
        make.centerY.equalTo(self.expressAddressLable);
    }];
    self.lengthExpressLable = lengthExpressLable;
    
    
    //送图片
    UIImageView * sendImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"send to"]];
    [self addSubview:sendImageView];
    [sendImageView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.left).offset(W(42));
        make.top.equalTo(self.expressContactLabe.bottom).offset(H(10));
    }];
    self.sendImageView = sendImageView;
    
    //送 地址详情
    UILabel * sendAddresslable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"上海市浦东新区沪南公路666弄银河奇迹湾18号1601室"];
    sendAddresslable.numberOfLines = 0;
    [self addSubview:sendAddresslable];
    [sendAddresslable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sendImageView.right).offset(W(10));
        make.top.equalTo(self.sendImageView);
        make.width.equalTo(W(200));
    }];
    self.sendAddresslable = sendAddresslable;
    
    //送 联系人
    UILabel * sendContactLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"祝英台，13652587459"];
    [self addSubview:sendContactLable];
    [sendContactLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sendImageView.right).offset(W(10));
        make.top.equalTo(self.sendAddresslable.bottom).offset(H(5));
        make.width.equalTo(W(150));
    }];
    self.sendContactLable = sendContactLable;
    
    //送 距离
    UILabel * lengthSendLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x4DADFF alpha:1.0] textFont:11 text:@"2.6km"];
    [self addSubview:lengthSendLable];
    [lengthSendLable makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(W(-24));
        make.centerY.equalTo(self.sendAddresslable);
    }];
    self.lengthSendLable = lengthSendLable;
    
    
    
    //联系客户。   饿了吗 -->>联系客户
    UIButton * contactGuestButton = [[UIButton alloc]init];
    [contactGuestButton setTitle:@"联系客户" forState:UIControlStateNormal];
    contactGuestButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [contactGuestButton setImage:[UIImage imageNamed:@"phone-blue edge"] forState:UIControlStateNormal];
    contactGuestButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    [contactGuestButton sizeToFit];
    [self addSubview:contactGuestButton];
    [contactGuestButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(45));
        make.top.equalTo(self.sendContactLable.bottom).offset(H(10));
    }];
    self.contactGuestButton = contactGuestButton;
    self.contactGuestButton.hidden = YES;
    
    //物品描述。   同城快递 -->>物品描述
    UILabel * goodsDetailLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"物品描述\n文件 1KG重"];
    goodsDetailLable.numberOfLines = 0;
    [self addSubview:goodsDetailLable];
    [goodsDetailLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(52));
        make.top.equalTo(self.sendContactLable.bottom).offset(H(16));
    }];
    self.goodsDetailLable = goodsDetailLable;
    self.goodsDetailLable.hidden = YES;
    
    
    //代取物。    跑腿服务 -->>代取物
    UIButton * help_FetchButton = [UIButton buttonWithTitle:@"代取物" NormalbackImageTitle:@"errand-catagory botton" SelectedbackImageTitle:@"errand-catagory botton"];
    [help_FetchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    UIButton * help_FetchButton = [[UIButton alloc]init];
//    [help_FetchButton setBackgroundColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.3]];
//    help_FetchButton.titleLabel.font = [UIFont systemFontOfSize:12];
//    [help_FetchButton setTitle:@"代取物" forState:UIControlStateNormal];
//    [help_FetchButton setImage:[UIImage imageNamed:@"errand-catagory botton"] forState:UIControlStateNormal];
//    [help_FetchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:help_FetchButton];
    [help_FetchButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContactLable.bottom).offset(H(28));
        make.left.equalTo(self).offset(W(52));
    }];
    self.help_FetchButton = help_FetchButton;
    
    
    //增加小费
    UIButton * addTipButton = [[UIButton alloc]init];
    [addTipButton setImage:[UIImage imageNamed:@"tip botton"] forState:UIControlStateNormal];
    [addTipButton setTitle:@"增加小费" forState:UIControlStateNormal];
    addTipButton.titleLabel.font = [UIFont systemFontOfSize:14];
    addTipButton.titleEdgeInsets = UIEdgeInsetsMake(-10, 5, 10, -5);
    [addTipButton sizeToFit];
    [self addSubview:addTipButton];
    [addTipButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContactLable.bottom).offset(H(10));
        make.right.equalTo(self.right).offset(W(-45));
    }];
    self.addTipButton = addTipButton;
    
    //已加小费
    UIButton * alreadyAddTipButton = [[UIButton alloc]init];
    [alreadyAddTipButton setTitle:@"已加小费" forState:UIControlStateNormal];
    [alreadyAddTipButton setBackgroundImage:[UIImage imageNamed:@"tip already bar"] forState:UIControlStateNormal];
    alreadyAddTipButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [alreadyAddTipButton setTitleColor:[UIColor colorWithHexValue:0x005390 alpha:1.0] forState:UIControlStateNormal];
    [addTipButton addSubview:alreadyAddTipButton];
    [alreadyAddTipButton makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.addTipButton.titleLabel.centerX);
        make.top.equalTo(self.addTipButton.titleLabel.bottom).offset(H(2));
    }];
    
    
    //联系配送员 UIButton * contactDeliverymanButton
    UIButton * contactDeliverymanButton = [[UIButton alloc]init];
    [contactDeliverymanButton setImage:[UIImage imageNamed:@"connect deliveryman-green edge"] forState:UIControlStateNormal];
    [contactDeliverymanButton setTitle:@"联系配送员" forState:UIControlStateNormal];
    contactDeliverymanButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    contactDeliverymanButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [contactDeliverymanButton sizeToFit];
    [self addSubview:contactDeliverymanButton];
    [contactDeliverymanButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContactLable.bottom).offset(H(10));
        make.right.equalTo(self.right).offset(W(-45));
    }];
    self.contactDeliverymanButton = contactDeliverymanButton;
    self.contactDeliverymanButton.hidden = YES;
    
    
    //下划线
    UIImageView * bottomImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:bottomImageViewLine];
    [bottomImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sendContactLable.bottom).offset(H(76));
        make.size.equalTo(CGSizeMake(W(375), H(1)));
        make.centerX.equalTo(self);
    }];
    self.bottomImageViewLine = bottomImageViewLine;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.alreadyOrderButton.hidden == NO || self.sendingButton.hidden == NO || self.originButton.hidden == NO) {
        self.currentTimeLable.xxj_x = CGRectGetMaxX(self.sourceButton.frame) + W(10);
    }
    
    if ([self.sourceButton.titleLabel.text isEqualToString:@"跑腿服务"])
    {
        self.expressImageView.image = [UIImage imageNamed:@"errand-start"];
        self.sendImageView.image = [UIImage imageNamed:@"errand-end"];
        
        self.goodsDetailLable.hidden = YES;
        self.help_FetchButton.hidden = NO;
        self.contactGuestButton.hidden = YES;
    }
    else if ([self.sourceButton.titleLabel.text isEqualToString:@"同城快递"])
    {
        self.expressImageView.image = [UIImage imageNamed:@"express start"];
        self.sendImageView.image = [UIImage imageNamed:@"send to"];
        self.goodsDetailLable.hidden = NO;
        self.help_FetchButton.hidden = YES;
        self.contactGuestButton.hidden = YES;
        
    }else if ([self.sourceButton.titleLabel.text isEqualToString:@"饿了吗"])
    {
        self.sendImageView.image = [UIImage imageNamed:@"send to"];
        
        self.expressImageView.hidden = YES;
        self.expressAddressLable.hidden = YES;
        self.expressContactLabe.hidden = YES;
        self.lengthExpressLable.hidden = YES;
        
        self.goodsDetailLable.hidden = YES;
        self.help_FetchButton.hidden = YES;
        self.contactGuestButton.hidden = NO;
        
        self.sendImageView.xxj_y = CGRectGetMaxY(self.numberLable.frame)+ H(10);
        self.sendAddresslable.xxj_y = CGRectGetMaxY(self.numberLable.frame)+ H(10);
        self.sendContactLable.xxj_y = CGRectGetMaxY(self.sendAddresslable.frame)+ H(10);
        self.lengthSendLable.xxj_centerY = self.sendAddresslable.xxj_centerY;
        
        self.contactGuestButton.xxj_y = CGRectGetMaxY(self.sendContactLable.frame) + H(10);
        self.addTipButton.xxj_centerY = self.contactGuestButton.xxj_centerY;
        self.contactDeliverymanButton.xxj_centerY = self.contactGuestButton.xxj_centerY;
        
        self.bottomImageViewLine.xxj_y  = CGRectGetMaxY(self.sendContactLable.frame) + H(76);
    }
    
    
//    self.maxHeight = CGRectGetMaxY(self.bottomImageViewLine.frame);
}

-(CGFloat)maxHeight
{
    //  强制布局之前，需要先手动设置下cell的真实宽度，以便于准确计算
    CGRect rect = self.frame;
    rect.size.width = [[UIScreen mainScreen] bounds].size.width;
    self.frame = rect;
    [self layoutIfNeeded];    //  一定要强制布局下，否则拿到的高度不准确
    return CGRectGetMaxY(self.bottomImageViewLine.frame);
}

@end

















