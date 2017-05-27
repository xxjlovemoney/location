//
//  DetailHeaderView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/4.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "DetailHeaderView.h"

@interface DetailHeaderView ()
/** 内部的label */
@property (nonatomic, weak) UILabel *label;
//背景图片
@property (nonatomic, strong) UIImageView * backImageView;
@end

@implementation DetailHeaderView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"date bar"]];
        self.backImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.backImageView];
        
        // label
        UILabel *label = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"本月"];
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.left).offset(W(33));
            make.centerY.equalTo(self);
        }];
        self.label = label;
        
    }
    return self;
}

@end
