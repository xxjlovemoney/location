//
//  ReportStoreView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportStoreView : UIView
//请输入商家名称
@property (nonatomic, strong) UITextField * storeNameField;
//请输入商家名联系方式
@property (nonatomic, strong) UITextField * storePhoneField;
//输入原因
@property (nonatomic, strong) BRPlaceholderTextView * storeTextView;
@end
