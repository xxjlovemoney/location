//
//  SSDBizInfoCheckView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/2.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDBizInfoCheckViewDelegate <NSObject>

-(void)OKButtonClick;

@end

@interface SSDBizInfoCheckView : UIView
@property (nonatomic, weak) id<SSDBizInfoCheckViewDelegate> delegate;
@end
