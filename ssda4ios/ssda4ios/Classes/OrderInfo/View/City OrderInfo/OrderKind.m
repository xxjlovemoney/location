//
//  OrderKind.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/8.
//  Copyright © 2017年 gaga. All rights reserved.
//

//======================底部视图 -> 同城快递 -> 同城快递发单内容封装 -> 物品种类======================

#import "OrderKind.h"

@interface OrderKind ()
//设置保存上一个按钮的状态
@property (strong,nonatomic)UIButton * preBtn;
@end

@implementation OrderKind
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}

#pragma mark -- 界面初始化
-(void)setUpUI
{
    //物品种类
    self.kindLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"物品种类"];
    [self addSubview:self.kindLable];
    [self.kindLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //文件
    self.fileButton = [UIButton buttonWithTitle:@"文件" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.fileButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.fileButton.selected = YES;
    self.preBtn = self.fileButton;
    [self addSubview:self.fileButton];
    [self.fileButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(10));
        make.left.equalTo(self.kindLable.right).offset(W(23));
    }];
    
    //数码产品??缺少白色图片
    self.digitalButton = [UIButton buttonWithTitle:@"数码产品" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.digitalButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.digitalButton];
    [self.digitalButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.fileButton.right).offset(W(6));
        }
        else
        {
            make.left.equalTo(self.fileButton.right).offset(W(20));
        }
        make.top.equalTo(self.top).offset(H(10));
        
    }];
    
    //日用品
    self.dailySuppliesButton = [UIButton buttonWithTitle:@"日用品" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.dailySuppliesButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.dailySuppliesButton];
    [self.dailySuppliesButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.digitalButton.right).offset(W(6));
        }
        else
        {
            make.left.equalTo(self.digitalButton.right).offset(W(20));
        }
        make.top.equalTo(self.top).offset(H(10));
        
    }];
    
    //服饰
    self.costumeButton = [UIButton buttonWithTitle:@"服饰" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.costumeButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.costumeButton];
    [self.costumeButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fileButton.bottom).offset(H(5));
        make.left.equalTo(self.kindLable.right).offset(W(23));
    }];
    
    //食品
    self.foodButton = [UIButton buttonWithTitle:@"食品" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.foodButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.foodButton];
    [self.foodButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.costumeButton.right).offset(W(6));
        }else
        {
            make.left.equalTo(self.costumeButton.right).offset(W(20));
        }
        make.top.equalTo(self.fileButton.bottom).offset(H(5));
        
    }];
    
    //其他
    self.otherButton = [UIButton buttonWithTitle:@"其他" NormalbackImageTitle:@"trans botton 64x21" SelectedbackImageTitle:@"errand-catagory botton"];
    [self.otherButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.otherButton];
    [self.otherButton makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.foodButton.right).offset(W(6));
        }else
        {
            make.left.equalTo(self.foodButton.right).offset(W(20));
        }
        make.top.equalTo(self.fileButton.bottom).offset(H(5));
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(H(60));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
}


#pragma mark -- 性别按钮 点击事件

-(void)btnClick:(UIButton *)sender
{
    if (self.preBtn.selected == YES) {
        self.preBtn.selected = NO;
    }
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
}



















@end
