//
//  SSDBizInfoVIew.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoVIew.h"
#import "InfoTexdFieldView.h"

@interface SSDBizInfoVIew ()<InfoTexdFieldViewDelegate>

@property (nonatomic, strong) NSArray *arr;

@end
@implementation SSDBizInfoVIew

-(NSMutableDictionary *)dataDictionary
{
    if (_dataDictionary == nil) {
        _dataDictionary = [NSMutableDictionary dictionary];
    }
    return _dataDictionary;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}


#pragma mark -- 界面初始化
-(void)setUpUI
{
    
    self.arr = @[@"1",@"hg",@"kjhkj",@"1",@"hg",@"kjhkj",@"1",@"hg",@"kjhkj"];
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-1"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(W(313), H(6)));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //提示标签
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:W(14) text:@"填写店主本人信息"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stepImageView.bottom).offset(H(28));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //真实姓名
    self.nameTextFieldView = [[InfoTexdFieldView alloc]init];
    self.nameTextFieldView.delegate = self;
    self.nameTextFieldView.headLable.text = @"真实姓名";
    self.nameTextFieldView.contentField.placeholder = @"请输入真实姓名";
    [self addSubview:self.nameTextFieldView];
    [self.nameTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(titleLable.bottom).offset(H(10));
        make.height.equalTo(H(45));
    }];
    
    //身份证号
    self.idTextFieldView = [[InfoTexdFieldView alloc]init];
    self.idTextFieldView.delegate = self;
    self.idTextFieldView.headLable.text = @"身份证号";
    self.idTextFieldView.contentField.placeholder = @"请输入身份证号";
    [self addSubview:self.idTextFieldView];
    [self.idTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.nameTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //商户名称
    self.merchantTextFieldView = [[InfoTexdFieldView alloc]init];
    self.merchantTextFieldView.delegate = self;
    self.merchantTextFieldView.headLable.text = @"商户名称";
    self.merchantTextFieldView.contentField.placeholder = @"请输入商户名称";
    [self addSubview:self.merchantTextFieldView];
    [self.merchantTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.idTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //联系方式
    self.contactTextFieldView = [[InfoTexdFieldView alloc]init];
    self.contactTextFieldView.delegate = self;
    self.contactTextFieldView.headLable.text = @"联系方式";
    self.contactTextFieldView.contentField.placeholder = @"请输入联系方式";
    [self addSubview:self.contactTextFieldView];
    [self.contactTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.merchantTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //切换座机按钮
    self.changeButton =[[UIButton alloc]init];
    //图片？？？？？？？？？
    [self.changeButton setBackgroundImage:[UIImage imageNamed:@"trans botton 64x21"] forState:UIControlStateNormal];
    [self.changeButton setBackgroundImage:[UIImage imageNamed:@"white botton 64x21"] forState:UIControlStateSelected];
    
    [self.changeButton setTitle:@"切换座机" forState:UIControlStateNormal];
    [self.changeButton setTitleColor:[UIColor colorWithHexValue:0x01608A alpha:1.0] forState:UIControlStateNormal];
    self.changeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
//    changeButton.backgroundColor = [UIColor grayColor];
    [self.changeButton sizeToFit];
    [self addSubview:self.changeButton];
    [self.changeButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.right).offset(W(-26));
        make.top.equalTo(self.contactTextFieldView.headLable.top);
        
        
    }];
    
    //所在地址
    self.addressTextFieldView = [[InfoTexdFieldView alloc]init];
    self.addressTextFieldView.delegate = self;
    self.addressTextFieldView.headLable.text = @"所在地址";
    self.addressTextFieldView.contentField.placeholder = @"请输入所在地址";
    [self addSubview:self.addressTextFieldView];
    [self.addressTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.contactTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //标记位置
    self.locationTextFieldView = [[InfoTexdFieldView alloc]init];
    self.locationTextFieldView.delegate = self;
    self.locationTextFieldView.headLable.text = @"标记位置";
    self.locationTextFieldView.contentField.placeholder = @"请输入标记位置";
    [self addSubview:self.locationTextFieldView];
    [self.locationTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.addressTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //更多按钮
    self.locationmoreBtn = [[UIButton alloc]init];
    [self.locationmoreBtn setBackgroundImage:[UIImage imageNamed:@"forward black"] forState:UIControlStateNormal];
    
    [self.locationmoreBtn addTarget:self action:@selector(locationBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.locationmoreBtn];
    [self.locationmoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locationTextFieldView);
        make.right.equalTo(self.right).offset(-W(26));
    }];
    
    //推广BD
    self.adTextFieldView = [[InfoTexdFieldView alloc]init];
    self.adTextFieldView.delegate = self;
    self.adTextFieldView.headLable.text = @"推广BD   ";
    self.adTextFieldView.contentField.placeholder = @"选填";
    [self addSubview:self.adTextFieldView];
    [self.adTextFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        make.top.equalTo(self.locationTextFieldView.bottom);
        make.height.equalTo(H(45));
    }];
    
    //更多按钮
    self.admoreBtn = [[UIButton alloc]init];
    [self.admoreBtn setBackgroundImage:[UIImage imageNamed:@"forward black"] forState:UIControlStateNormal];
    [self addSubview:self.admoreBtn];
    [self.admoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.adTextFieldView);
        make.right.equalTo(self.right).offset(-W(26));
    }];
    
  
    UILabel *attentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] textFont:W(9) text:@"请使用本人身份信息进行验证，以确保能够正常体现"];
    [self addSubview:attentionLable];
    [attentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.adTextFieldView.bottom).offset(H(29));
        make.left.equalTo(self.adTextFieldView.left);
    }];
    
    
    //底部按钮
    self.nextStepBtn = [[UIButton alloc]init];
    [self.nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextStepBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [self.nextStepBtn setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [self addSubview:self.nextStepBtn];
    
    [self.nextStepBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
}



#pragma mark -- 按钮下一步  点击事件
-(void)nextStep
{
    if ([self.delegate respondsToSelector:@selector(nextStepClickDictionary:)]) {
        [self.delegate nextStepClickDictionary:self.dataDictionary];
    }
}


#pragma mark -- InfoTexdFieldViewDelegate
-(void)getStr:(NSString *)str infoView:(InfoTexdFieldView *)infoView
{
    if ([infoView.headLable.text isEqualToString:@"111"]) {
       [self.dataDictionary setObject:str forKey:infoView.headLable.text];
    }
    
//    switch (infoView.headLable.text) {
//        case @"111":
//            <#statements#>
//            break;
//            
//        default:
//            break;
//    }
    
}



//标记位置按钮点击事件
-(void)locationBtn
{
    if ([self.delegate respondsToSelector:@selector(locationButtonClick)]) {
        [self.delegate locationButtonClick];
    }
}






@end
