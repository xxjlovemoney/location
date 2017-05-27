//
//  InfoTexdFieldView.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoTexdFieldView;
@protocol InfoTexdFieldViewDelegate <NSObject>

-(void)getStr:(NSString *)str infoView:(InfoTexdFieldView *)infoView;

@end

@interface InfoTexdFieldView : UIView
//
@property(strong,nonatomic) UILabel * headLable;

@property(strong,nonatomic) UITextField * contentField;

@property(strong,nonatomic) UIImageView * lineImageView;

@property (nonatomic, weak) id<InfoTexdFieldViewDelegate> delegate;
@end
