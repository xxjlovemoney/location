//
//  ReportStaffView.h
//  ssda4ios
//
//  Created by gagakj on 2017/5/3.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportStaffView : UIView
//请输入随时达工作人员名称
@property (nonatomic, strong) UITextField * staffNameField;
//请输入配送员联系方式
@property (nonatomic, strong) UITextField * staffPhoneField;
//输入原因
@property (nonatomic, strong) BRPlaceholderTextView * staffTextView;
@end
