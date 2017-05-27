//
//  SSDBizInfoVIew.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoTexdFieldView;

@protocol SSDBizInfoVIewDelegate <NSObject>

//点击下一步按钮的代理方法
-(void)nextStepClickDictionary:(NSMutableDictionary *)dictionary;
//联系方式textField开始编辑
//-(void)textFieldBeginEdit:(UITextField *)textField;

//标记位置按钮点击代理方法
-(void)locationButtonClick;

@end
@interface SSDBizInfoVIew : UIView

@property(weak,nonatomic) id<SSDBizInfoVIewDelegate> delegate;
//真实姓名
@property (nonatomic, strong) InfoTexdFieldView * nameTextFieldView;

//身份证号
@property (nonatomic, strong) InfoTexdFieldView * idTextFieldView;

//商户名称
@property (nonatomic, strong) InfoTexdFieldView * merchantTextFieldView;

//联系方式
@property (nonatomic, strong) InfoTexdFieldView * contactTextFieldView;

//切换座机按钮
@property (nonatomic, strong) UIButton * changeButton;

//所在地址
@property (nonatomic, strong) InfoTexdFieldView * addressTextFieldView;

//标记位置
@property (nonatomic, strong) InfoTexdFieldView * locationTextFieldView;

//更多按钮
@property (nonatomic, strong) UIButton * locationmoreBtn;

//推广BD
@property (nonatomic, strong) InfoTexdFieldView * adTextFieldView;

//更多按钮
@property (nonatomic, strong) UIButton * admoreBtn;

//底部按钮
@property (nonatomic, strong) UIButton * nextStepBtn;

//真实姓名textField编辑状态记录
@property (nonatomic, assign) BOOL nameTextFieldBooL;
//身份证号textField编辑状态记录
@property (nonatomic, assign) BOOL IDTextFieldBooL;
//商户名称textField编辑状态记录
@property (nonatomic, assign) BOOL merchantTextFieldBooL;
//联系方式textField编辑状态记录
@property (nonatomic, assign) BOOL contactTextFieldBooL;
//所在地址textField编辑状态记录
@property (nonatomic, assign) BOOL addressTextFieldBooL;
//标记位置textField编辑状态记录
@property (nonatomic, assign) BOOL locationTextFieldBooL;
//推广BDtextField编辑状态记录
@property (nonatomic, assign) BOOL adTextFieldBooL;

//保存界面数据的字典
@property (nonatomic, strong) NSMutableDictionary * dataDictionary;



@end
