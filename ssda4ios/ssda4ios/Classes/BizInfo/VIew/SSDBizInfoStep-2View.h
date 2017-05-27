//
//  SSDBizInfoStep-2View.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BizInfoButton;
@protocol SSDBizInfoStep_2ViewDelegate <NSObject>
//下一步按钮点击
-(void)nextstepSecondClick:(NSMutableDictionary *)dictionary;

//-(void)getButton:(UIButton *)button;

@end
@interface SSDBizInfoStep_2View : UIView

//美食餐饮
@property (nonatomic, strong) BizInfoButton * foodButton;
//蔬菜生鲜
@property (nonatomic, strong) BizInfoButton * FreshButton;
//超市商品
@property (nonatomic, strong) BizInfoButton * marketButton;
//蛋糕甜点 
@property (nonatomic, strong) BizInfoButton * cakeButton;
//鲜花
@property (nonatomic, strong) BizInfoButton * FlowerButton;
//其他
@property (nonatomic, strong) BizInfoButton * otherButton;
//底部按钮
@property (nonatomic, strong) UIButton * nextStepSecond;

//存储界面内容的字典
@property (nonatomic, strong) NSMutableDictionary * data_2Dictionary;
//按钮点击状态转换
@property (nonatomic, strong) NSNumber * buttonSelected;


@property(weak,nonatomic) id<SSDBizInfoStep_2ViewDelegate> delegate;
@end
