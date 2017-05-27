//
//  AffirmAndPayScrollerVeiw.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//



//======================底部视图 -> 跑腿服务-> 跑腿服务发单 -> 点击确认 ->确认/支付========================

#import "AffirmAndPayScrollerVeiw.h"
#import "AffirmSenderReceiverInfo.h"
#import "RechargeStyle.h"

@interface AffirmAndPayScrollerVeiw ()
@property (nonatomic, strong) UIImageView * imageViewLine;
@end

@implementation AffirmAndPayScrollerVeiw

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        
    }
    return self;
}

//界面初始化
-(void)setUpUI
{
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    
    //客户姓名
    self.guestName = [[AffirmSenderReceiverInfo alloc]init];
    self.guestName.infoLable.text = @"客户姓名";
    self.guestName.detailLable.text = @"梁山伯";
    [self addSubview:self.guestName];
    [self.guestName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageViewLine.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //客户电话
    self.guestPhone = [[AffirmSenderReceiverInfo alloc]init];
    self.guestPhone.infoLable.text = @"客户电话";
    self.guestPhone.detailLable.text = @"15896587458";
    [self addSubview:self.guestPhone];
    [self.guestPhone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.guestName.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //服务起点
    self.severiceOrign = [[AffirmSenderReceiverInfo alloc]init];
    self.severiceOrign.infoLable.text = @"服务起点";
    self.severiceOrign.detailLable.text = @"上海市浦东新区沪南公路1099号四九干洗店";
    [self addSubview:self.severiceOrign];
    [self.severiceOrign makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.guestPhone.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(50)));
    }];
    //服务终点
    self.severiceEnd = [[AffirmSenderReceiverInfo alloc]init];
    self.severiceEnd.infoLable.text = @"服务终点";
    self.severiceEnd.detailLable.text = @"上海市浦东新区沪南公路1099号四九干洗店";
    [self addSubview:self.severiceEnd];
    [self.severiceEnd makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceOrign.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(50)));
    }];
    
    //服务时间
    self.severiceTime = [[AffirmSenderReceiverInfo alloc]init];
    self.severiceTime.infoLable.text = @"服务时间";
    self.severiceTime.detailLable.text = @"实时，预计滞留0.0小时";
    [self addSubview:self.severiceTime];
    [self.severiceTime makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceEnd.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //服务内容
    self.severiceContent = [[AffirmSenderReceiverInfo alloc]init];
    self.severiceContent.infoLable.text = @"服务内容";
    self.severiceContent.detailLable.text = @"到四九干洗店取祝英台的两件外套，送到终点";
    [self addSubview:self.severiceContent];
    [self.severiceContent makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceTime.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(50)));
    }];
    //费用合计
    UILabel * costLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"费用合计"];
    [self addSubview:costLable];
    [costLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceContent.bottom).offset(H(18));
        make.left.equalTo(self).offset(W(33));
    }];
    
    //含小费5元
    UILabel * tipLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"元  (含小费5元)"];
    [self addSubview:tipLable];
    [tipLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.severiceContent.bottom).offset(H(18));
        make.right.equalTo(self).offset(W(300));//?????????????????????????????????????????????
//                make.right.equalTo(self).offset(W(-29));
    }];
    
    //具体费用
    self.moneyLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:26 text:@"15.0"];
    [self addSubview:self.moneyLable];
    [self.moneyLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(costLable);
        make.right.equalTo(tipLable.left).offset(W(-10));
    }];
    
    //支付方式
    UILabel * payStyleLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"支付方式"];
    [self addSubview:payStyleLable];
    [payStyleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(costLable.bottom).offset(H(53));
        make.left.equalTo(self.left).offset(W(33));
    }];
    
    //余额支付
    self.remainPayStyle = [[RechargeStyle alloc]init];
    self.remainPayStyle.payImage = [UIImage imageNamed:@"balance"];
    self.remainPayStyle.payLable.text = @"余额支付";
    self.remainPayStyle.chooseBtn.selected = YES;
    UITapGestureRecognizer * remainTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(remainTap)];
    [self.remainPayStyle addGestureRecognizer:remainTapGes];
    [self addSubview:self.remainPayStyle];
    [self.remainPayStyle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payStyleLable.bottom).offset(H(7));
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //支付宝
    self.aliPayStyle = [[RechargeStyle alloc]init];
    self.aliPayStyle.payImage = [UIImage imageNamed:@"alipay"];
    self.aliPayStyle.payLable.text = @"支付宝";
    UITapGestureRecognizer * aliTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aliTap)];
    [self.aliPayStyle addGestureRecognizer:aliTapGes];
    [self addSubview:self.aliPayStyle];
    [self.aliPayStyle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remainPayStyle.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    
    //微信支付
    self.wechatPayStyle = [[RechargeStyle alloc]init];
    self.wechatPayStyle.payImage = [UIImage imageNamed:@"wechat pay"];
    self.wechatPayStyle.payLable.text = @"微信支付";
    UITapGestureRecognizer * wechatTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(wechatTap)];
    [self.wechatPayStyle addGestureRecognizer:wechatTapGes];
    [self addSubview:self.wechatPayStyle];
    [self.wechatPayStyle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aliPayStyle.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    
    //下划线
    self.imageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:self.imageViewLine];
    [self.imageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wechatPayStyle.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];

}


//余额支付手势点击方法
-(void)remainTap
{
    self.remainPayStyle.chooseBtn.selected = YES;
    self.aliPayStyle.chooseBtn.selected = NO;
    self.wechatPayStyle.chooseBtn.selected = NO;
}
//支付宝手势点击方法
-(void)aliTap
{
    self.remainPayStyle.chooseBtn.selected = NO;
    self.aliPayStyle.chooseBtn.selected = YES;
    self.wechatPayStyle.chooseBtn.selected = NO;
}
//微信支付手势点击方法
-(void)wechatTap
{
    self.remainPayStyle.chooseBtn.selected = NO;
    self.aliPayStyle.chooseBtn.selected = NO;
    self.wechatPayStyle.chooseBtn.selected = YES;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
//    XXJLog(@"%f",CGRectGetMaxY(self.imageViewLine.frame))
}


@end
