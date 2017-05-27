//
//  SSDBizInfoCheckNotiView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDBizInfoCheckNotiViewDelegate <NSObject>

-(void)updateButtonClick;

@end

@interface SSDBizInfoCheckNotiView : UIView
@property (nonatomic, weak) id<SSDBizInfoCheckNotiViewDelegate> delegate;
@end
