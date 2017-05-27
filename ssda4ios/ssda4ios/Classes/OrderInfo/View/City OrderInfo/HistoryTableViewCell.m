//
//  HistoryTableViewCell.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/9.
//  Copyright © 2017年 gaga. All rights reserved.
//

//=========底部视图 -> 外卖录单 -> 同城快递信息录入 ->寄放更多按钮点击 -> 寄放(收方)信息录入 -> cell自定义=========

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //初始化界面
        [self setUpUI];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


#pragma mark -- 初始化界面
-(void)setUpUI
{
    //选择按钮
    self.chooseButton = [[UIButton alloc]init];
    
    [self.chooseButton setImage:[UIImage imageNamed:@"not choosed"] forState:UIControlStateNormal];
    [self.chooseButton setImage:[UIImage imageNamed:@"choosed"] forState:UIControlStateSelected];
    [self addSubview:self.chooseButton];
    [self.chooseButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset(W(33));
        make.centerY.equalTo(self);
        make.size.equalTo(CGSizeMake(W(16), H(16)));
    }];
    //主标题
    self.mainTitle = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"梁山伯，18951191119\n上海市浦东新区沈梅路888弄宇宙智慧湾666666666666666"];
    self.mainTitle.numberOfLines = 2;
    [self addSubview:self.mainTitle];
    [self.mainTitle makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chooseButton.right).offset(W(12));
        make.right.equalTo(self).offset(W(-33));
        make.centerY.equalTo(self);
    }];
    
    
    //下划线
    UIImageView * topImageViewLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu separator"]];
    [self addSubview:topImageViewLine];
    [topImageViewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainTitle.bottom).offset(H(10));
        make.size.equalTo(CGSizeMake(W(370), H(1)));
        make.centerX.equalTo(self);
    }];
}
@end
