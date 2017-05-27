//
//  GuestAddressNext.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/6.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "GuestAddressNext.h"

@implementation GuestAddressNext
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
    //名称
//    self.nextLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0xFFFFFF alpha:0.6] textFont:14 text:@"楼层和门牌号，例9楼802"];
//    [self addSubview:self.nextLable];
//    [self.nextLable makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.left).offset(W(110));
//        make.centerY.equalTo(self);
//    }];
    
    self.nextField = [[UITextField alloc]init];
    self.nextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"楼层和门牌号，例9楼802" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexValue:0xFFFFFF alpha:0.6]}];
    [self.nextField setTextColor:[UIColor whiteColor]];
    self.nextField.borderStyle = UITextBorderStyleNone ;
    self.nextField.font = [UIFont systemFontOfSize:14];
    [self.nextField sizeToFit];
    [self addSubview: self.nextField];
    [self.nextField makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.left.equalTo(self.left).offset(W(110));
        }
        else
        {
            make.left.equalTo(self.left).offset(W(105));
        }
        make.centerY.equalTo(self);
        
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
