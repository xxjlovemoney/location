//
//  SSDHomeNavTitleView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDHomeNavTitleViewDelegate <NSObject>

-(void)publishButtonClick;

-(void)processButtonClick;

@end

@interface SSDHomeNavTitleView : UIView
//发布中
@property (nonatomic, strong) UIButton * publishButton;
//下划线
@property (nonatomic, strong) UIView * lineView;
//进行中
@property (nonatomic, strong) UIButton * processButton;

@property (nonatomic, weak) id<SSDHomeNavTitleViewDelegate> delegate;

@end
