//
//  ReportBillView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//


//====================================侧滑界面->投诉举报->订单相关投诉=====================================

#import "ReportBillView.h"
#import "ReportBillReasonView.h"
@implementation ReportBillView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI
{
    //订单相关投诉
    UILabel * billReport = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x131313 alpha:1.0] textFont:14 text:@"订单相关投诉:"];
    [self addSubview:billReport];
    [billReport makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(H(18));
        make.left.equalTo(self.left).offset(W(35));
    }];
    
    //点击选择要投诉的订单
    UIButton * reportBillBtn = [[UIButton alloc]init];
    [reportBillBtn setTitle:@"点击选择要投诉的订单" forState:UIControlStateNormal];
    reportBillBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [reportBillBtn setBackgroundImage:[UIImage imageNamed:@"button choose complaint order"] forState:UIControlStateNormal];
    [reportBillBtn setTitleColor:[UIColor colorWithHexValue:0x005ea4 alpha:1.0] forState:UIControlStateNormal];
    [self addSubview:reportBillBtn];
    [reportBillBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(billReport.bottom).offset(H(16));
        make.centerX.equalTo(self);
        make.left.equalTo(self.left).offset(W(33));
//        make.size.equalTo(CGSizeMake(W(155), H(35)));
    }];
    
    //请选择举报原因
    UILabel * reasonReport = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x131313 alpha:1.0] textFont:14 text:@"请选择举报原因:"];
    [self addSubview:reasonReport];
    [reasonReport makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reportBillBtn.bottom).offset(H(18));
        make.left.equalTo(self.left).offset(W(35));
    }];
    
    //没有人接单/派单太晚
    ReportBillReasonView * reasonViewFirst = [[ReportBillReasonView alloc]init];
    reasonViewFirst.chooseBtn.selected  =YES;
    reasonViewFirst.reasonLable.text = @"没有人接单/派单太晚";
    reasonViewFirst.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewFirst];
    [reasonViewFirst makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonReport.bottom).offset(H(20));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    //配送人员没来取餐
    ReportBillReasonView * reasonViewSecond = [[ReportBillReasonView alloc]init];
    reasonViewSecond.reasonLable.text = @"配送人员没来取餐";
    reasonViewSecond.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewSecond];
    [reasonViewSecond makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewFirst.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    //配送员货品没送到
    ReportBillReasonView * reasonViewThird = [[ReportBillReasonView alloc]init];
    reasonViewThird.chooseBtn.selected  =YES;
    reasonViewThird.reasonLable.text = @"配送员货品没送到";
    reasonViewThird.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewThird];
    [reasonViewThird makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewSecond.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    
    //配送员不礼貌/态度恶劣
    ReportBillReasonView * reasonViewFourth = [[ReportBillReasonView alloc]init];
    reasonViewFourth.reasonLable.text = @"配送员不礼貌/态度恶劣";
    reasonViewFourth.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewFourth];
    [reasonViewFourth makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewThird.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    
    //配送员无故取消订单
    ReportBillReasonView * reasonViewFifth = [[ReportBillReasonView alloc]init];
    reasonViewFifth.reasonLable.text = @"配送员无故取消订单";
    reasonViewFifth.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewFifth];
    [reasonViewFifth makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewFourth.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    
    //配送员到店后，不愿意配送
    ReportBillReasonView * reasonViewSixth = [[ReportBillReasonView alloc]init];
    reasonViewSixth.reasonLable.text = @"配送员到店后，不愿意配送";
    reasonViewSixth.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewSixth];
    [reasonViewSixth makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewFifth.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    
    //配送费计算错误
    ReportBillReasonView * reasonViewSeventh = [[ReportBillReasonView alloc]init];
    reasonViewSeventh.reasonLable.text = @"配送费计算错误";
    reasonViewSeventh.reasonLable.alpha = 0.8;
    [self addSubview:reasonViewSeventh];
    [reasonViewSeventh makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewSixth.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(250), H(17)));
    }];
    
    
    //其他举报原因（选填）
    UITextField * otherReasonField = [[UITextField alloc]init];
    otherReasonField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"其他举报原因（选填）" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0x838383 alpha:1.0]}];
    otherReasonField.borderStyle = UITextBorderStyleNone ;
    otherReasonField.font = [UIFont systemFontOfSize:14];
    [self addSubview: otherReasonField];
    [otherReasonField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(reasonViewSeventh.bottom).offset(H(17));
        make.left.equalTo(self.left).offset(W(33));
        make.size.equalTo(CGSizeMake(W(300), H(17)));
    }];
    
    
    //下划线
    UIImageView * imageLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"input line"]];
    [self addSubview:imageLine];
    [imageLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(otherReasonField.bottom).offset(H(5));
        make.centerX.equalTo(self);

    }];
    
    
    //底部按钮
    UIButton * commitBtn = [[UIButton alloc]init];
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtn) forControlEvents:UIControlEventTouchUpInside];
    [commitBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:commitBtn];
    
    [commitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
    

}


#pragma mark -- 提交按钮
-(void)commitBtn
{
    XXJLog(@"订单相关投诉。提交。提交")
}













@end
