//
//  RemarkInfo.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

//============================底部视图 -> 外卖录单 -> 手动外卖录单内容封装 -> 备注=====================

#import "RemarkInfo.h"

@implementation RemarkInfo
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
    //备注
    self.remarkLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"备        注"];
    [self addSubview:self.remarkLable];
    [self.remarkLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
    }];
    
    //捎话给配送员
    self.remarkField = [[UITextField alloc]init];
    self.remarkField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"捎话给配送员" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    [self.remarkField setTextColor:[UIColor whiteColor]];
    self.remarkField.borderStyle = UITextBorderStyleNone ;
    self.remarkField.font = [UIFont systemFontOfSize:14];
    [self.remarkField sizeToFit];
    [self addSubview: self.remarkField];
    [self.remarkField makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.remarkLable.right).offset(26);
    }];
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom);
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
    

}

@end
