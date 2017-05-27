//
//  SSDBizInfoStep-2View.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-2View.h"

@interface SSDBizInfoStep_2View ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation SSDBizInfoStep_2View

-(NSMutableDictionary *)data_2Dictionary
{
    if (_data_2Dictionary == nil) {
        _data_2Dictionary = [NSMutableDictionary dictionary];
        
    }
    return _data_2Dictionary;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark --界面初始化
-(void)setUpUI
{
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-2"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(313, 6));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //选择商户类型
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:14 text:@"选择商户类型"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.top.equalTo(stepImageView.bottom).offset(H(10));
        }
        else
        {
            make.top.equalTo(stepImageView.bottom).offset(H(25));
        }
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    
    
    //美食餐饮
    BizInfoButton * foodButton = [BizInfoButton buttonWithType:UIButtonTypeCustom];
    [foodButton setImage:[UIImage imageNamed:@"food"] forState:UIControlStateNormal];
    foodButton.selected = YES;
    self.preBtn = foodButton;
    
    [foodButton setTitle:@"美食餐饮" forState:UIControlStateNormal];
    [foodButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    [foodButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    foodButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [foodButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:foodButton];
    [foodButton makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.left).offset(W(31));
        if (WIDTH == 320) {
            make.top.equalTo(titleLable.bottom).offset(H(5));
            make.size.equalTo(CGSizeMake(116, 116));
        }
        else
        {
            make.top.equalTo(titleLable.bottom).offset(H(15));
            make.size.equalTo(CGSizeMake(128, 128));
        }
        
    }];
    self.buttonSelected = [NSNumber numberWithBool:foodButton.selected];
    [self.data_2Dictionary setObject:self.buttonSelected forKey:foodButton.currentTitle];
    
    self.foodButton = foodButton;
    
//
    //蔬菜生鲜
    BizInfoButton * FreshButton = [BizInfoButton buttonWithType:UIButtonTypeCustom];
    [FreshButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [FreshButton setImage:[UIImage imageNamed:@"vagetable"] forState:UIControlStateNormal];
    [FreshButton setTitle:@"蔬菜生鲜" forState:UIControlStateNormal];
    [FreshButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [FreshButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    FreshButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:FreshButton];
    [FreshButton makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.right).offset(W(-31));
        if (WIDTH == 320) {
            make.top.equalTo(titleLable.bottom).offset(H(5));
            make.size.equalTo(CGSizeMake(116, 116));
        }
        else
        {
            make.top.equalTo(titleLable.bottom).offset(H(15));
            make.size.equalTo(CGSizeMake(128, 128));
        }
    }];
    self.FreshButton = FreshButton;
    
    
    //超市商品
    BizInfoButton * marketButton = [[BizInfoButton alloc]init];
    [marketButton setImage:[UIImage imageNamed:@"supermarket"] forState:UIControlStateNormal];
    [marketButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [marketButton setTitle:@"超市商品" forState:UIControlStateNormal];
    [marketButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [marketButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    marketButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:marketButton];
    [marketButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        if (WIDTH == 320) {
            make.top.equalTo(foodButton.bottom).offset(H(5));
            make.size.equalTo(CGSizeMake(116, 116));
        }
        else
        {
            make.top.equalTo(foodButton.bottom).offset(H(10));
             make.size.equalTo(CGSizeMake(128, 128));
        }
    }];
    self.marketButton = marketButton;
    
    
    //蛋糕甜点   ???????????布局
    BizInfoButton * cakeButton = [[BizInfoButton alloc]init];
    if (WIDTH == 414 ) {
        //6p
        cakeButton.xxj_centerX = FreshButton.xxj_centerX + W(190);
        cakeButton.xxj_centerY = marketButton.xxj_centerY + H(190);
        cakeButton.xxj_width = 128;
        cakeButton.xxj_height = 128;
    }else if (WIDTH == 375) {
        //6s
        cakeButton.xxj_centerX = FreshButton.xxj_centerX + W(180);
        cakeButton.xxj_centerY = marketButton.xxj_centerY + H(200);
        cakeButton.xxj_width = 128;
        cakeButton.xxj_height = 128;
    }else if (WIDTH  == 320) {
        //5s
        cakeButton.xxj_centerX = FreshButton.xxj_centerX + W(175);
        cakeButton.xxj_centerY = marketButton.xxj_centerY + H(180);
        cakeButton.xxj_width = 116;
        cakeButton.xxj_height = 116;
    }
    
    [cakeButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cakeButton setImage:[UIImage imageNamed:@"cake"] forState:UIControlStateNormal];
    [cakeButton setTitle:@"蛋糕甜点" forState:UIControlStateNormal];
    [cakeButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];

    [cakeButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    cakeButton.titleLabel.font = [UIFont systemFontOfSize:14];

    [self addSubview:cakeButton];
    self.cakeButton = cakeButton;


//
    //鲜花
    BizInfoButton * FlowerButton = [[BizInfoButton alloc]init];
    [FlowerButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [FlowerButton setImage:[UIImage imageNamed:@"flower"] forState:UIControlStateNormal];
    [FlowerButton setTitle:@"鲜花" forState:UIControlStateNormal];
    [FlowerButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [FlowerButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    FlowerButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:FlowerButton];
    [FlowerButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(31));
        if (WIDTH == 320) {
            make.top.equalTo(marketButton.bottom).offset(H(5));
            make.size.equalTo(CGSizeMake(116, 116));
        }
        else
        {
            make.size.equalTo(CGSizeMake(128, 128));
            make.top.equalTo(marketButton.bottom).offset(H(10));
        }
    }];
    self.FlowerButton = FlowerButton;
    
    //其他
    BizInfoButton * otherButton = [[BizInfoButton alloc]init];
    [otherButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [otherButton setImage:[UIImage imageNamed:@"other"] forState:UIControlStateNormal];
    [otherButton setTitle:@"其他" forState:UIControlStateNormal];
    [otherButton setBackgroundImage:[UIImage imageNamed:@"choosed grey"] forState:UIControlStateSelected];
    
    [otherButton setTitleColor:[UIColor colorWithHexValue:0x01608a alpha:1.0] forState:UIControlStateNormal];
    otherButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self addSubview:otherButton];
    [otherButton makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.right).offset(W(-31));
        make.top.equalTo(FlowerButton.top);
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(116, 116));
        }
        else
        {
            make.size.equalTo(CGSizeMake(128, 128));
        }
    }];
    self.otherButton = otherButton;
    
    
    //底部按钮
    UIButton * nextStepSecond = [[UIButton alloc]init];
    [nextStepSecond setBackgroundImage:[UIImage imageNamed:@"button blue"] forState:UIControlStateNormal];
    [nextStepSecond setTitle:@"下一步" forState:UIControlStateNormal];
    nextStepSecond.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [nextStepSecond addTarget:self action:@selector(nextstepSecond) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextStepSecond];
    [nextStepSecond makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(H(60));
    }];
}

#pragma mark -- 下一步按钮点击
-(void)nextstepSecond
{
    XXJLog(@"22232323232")
    if ([self.delegate respondsToSelector:@selector(nextstepSecondClick:)]) {
        [self.delegate nextstepSecondClick:self.data_2Dictionary];
    }
}


#pragma mark -- 按钮 点击事件
-(void)btnClick:(UIButton *)sender
{
    [self.data_2Dictionary removeAllObjects];
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
    
    self.buttonSelected = [NSNumber numberWithBool:sender.selected];
    [self.data_2Dictionary setObject:self.buttonSelected forKey:sender.currentTitle];
}











@end
