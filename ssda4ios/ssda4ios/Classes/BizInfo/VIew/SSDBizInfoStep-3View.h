//
//  SSDBizInfoStep-3View.h
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSDBizInfoStep_3ViewDelegate <NSObject>
//正面照片点击代理方法
-(void)frontPhotoBtnClick;

-(void)backPhotoBtnClick;

@end
@interface SSDBizInfoStep_3View : UIView

//参考正面照片ImageView
@property (nonatomic, strong) UIImageView * referencefrontPhoto;
//上传身份证正面照片ImageView
@property (nonatomic, strong) UIImageView * frontPhoto;
//上传身份证正面照片Lable
@property (nonatomic, strong) UILabel * frontLable;


//参考反面照片ImageView
@property (nonatomic, strong) UIImageView * referencebackPhoto;
//上传身份证反面照片ImageView
@property (nonatomic, strong) UIImageView * backPhoto;
//上传身份证反面照片Lable
@property (nonatomic, strong) UILabel * backLable;


//上传手持身份证正面照片ImageView
@property (nonatomic, strong) UIImageView * handIDPhoto;
//上传手持身份证正面照片Lable
@property (nonatomic, strong) UILabel * handIDLable;


//上传店铺与店主合照ImageView
@property(strong,nonatomic) UIImageView * storePhoto;
//上传店铺与店主合照Lable
@property (nonatomic, strong) UILabel * storeLable;


//最大的内容高度值
@property (nonatomic, assign) NSInteger maxheight;


//代理
@property (nonatomic, weak) id<SSDBizInfoStep_3ViewDelegate> delegate;


//存储界面内容的字典
@property (nonatomic, strong) NSMutableDictionary * data_3Dictionary;




@end
