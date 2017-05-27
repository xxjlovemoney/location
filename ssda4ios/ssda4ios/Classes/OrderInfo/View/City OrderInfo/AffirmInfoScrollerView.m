//
//  AffirmInfoScrollerView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

//===============底部视图 -> 外卖录单 -> 同城快递信息录入 ->点击确认 ============

#import "AffirmInfoScrollerView.h"
#import "AffirmSenderReceiverInfo.h"
#import "RechargeStyle.h"

@interface AffirmInfoScrollerView ()
@property (nonatomic, strong) UIImageView * imageViewLine;
@end
@implementation AffirmInfoScrollerView
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
    
    //寄方
    self.senderInfo = [[AffirmSenderReceiverInfo alloc]init];
    [self addSubview:self.senderInfo];
    [self.senderInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.size.equalTo(CGSizeMake(WIDTH, H(75)));
    }];
    //收方
    self.receiverInfo = [[AffirmSenderReceiverInfo alloc]init];
    self.receiverInfo.infoLable.text = @"收      方";
    self.receiverInfo.detailLable.text = @"祝英台 女士，18965236984 上海市浦东新区沈梅路888弄宇宙智慧湾66号101室";
    [self addSubview:self.receiverInfo];
    [self.receiverInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.senderInfo.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(75)));
    }];
    
    
    //物品描述
    self.weightDetails = [[AffirmSenderReceiverInfo alloc]init];
    self.weightDetails.infoLable.text = @"物品描述";
    self.weightDetails.detailLable.text = @"文件 1KG重";
    [self addSubview:self.weightDetails];
    [self.weightDetails makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiverInfo.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    
    //送达时间
    self.arriveTime = [[AffirmSenderReceiverInfo alloc]init];
    self.arriveTime.infoLable.text = @"送达时间";
    self.arriveTime.detailLable.text = @"实时";
    [self addSubview:self.arriveTime];
    [self.arriveTime makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weightDetails.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    //备注
    self.remarkInfo = [[AffirmSenderReceiverInfo alloc]init];
    self.remarkInfo.infoLable.text = @"备        注";
    self.remarkInfo.detailLable.text = @"无";
    [self addSubview:self.remarkInfo];
    [self.remarkInfo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.arriveTime.bottom);
        make.size.equalTo(CGSizeMake(WIDTH, H(40)));
    }];
    //费用合计
    UILabel * costLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"费用合计"];
    [self addSubview:costLable];
    [costLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarkInfo.bottom).offset(H(18));
        make.left.equalTo(self).offset(W(33));
    }];
    
    //含小费5元
    UILabel * tipLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"元  (含小费5元)"];
    [self addSubview:tipLable];
    [tipLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarkInfo.bottom).offset(H(18));
        make.right.equalTo(self).offset(W(300));//?????????????????????????????????????????????
//        make.right.equalTo(self).offset(W(-29));
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


//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    self.maxHeight = CGRectGetMaxY(self.imageViewLine.frame);
//}














@end
