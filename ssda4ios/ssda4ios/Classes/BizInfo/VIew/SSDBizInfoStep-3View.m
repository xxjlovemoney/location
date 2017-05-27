//
//  SSDBizInfoStep-3View.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/1.
//  Copyright © 2017年 gaga. All rights reserved.
//

#import "SSDBizInfoStep-3View.h"

@interface SSDBizInfoStep_3View ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation SSDBizInfoStep_3View

-(NSMutableDictionary *)data_3Dictionary
{
    if (_data_3Dictionary == nil) {
        _data_3Dictionary = [NSMutableDictionary dictionary];
        
    }
    return _data_3Dictionary;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //界面初始化
        [self setUpUI];
    }
    return self;
}


#pragma mark -- 界面初始化
-(void)setUpUI
{
    //进度图片
    UIImageView * stepImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"step-3"]];
    [self addSubview:stepImageView];
    [stepImageView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).offset(H(20));
        make.size.equalTo(CGSizeMake(W(313), H(6)));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //上传身份照片标签
    UILabel * titleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:14 text:@"上传身份照片"];
    [self addSubview:titleLable];
    [titleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stepImageView.bottom).offset(H(15));
        make.left.equalTo(self.left).offset(W(31));
    }];
    
    //
    UILabel * attentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"请保证身份证文字清晰可见"];
    [self addSubview:attentionLable];
    [attentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(titleLable.bottom);
        make.left.equalTo(titleLable.right).offset(W(15));
    }];
    
    
    
    //参考正面照片ImageView
    UIImageView * referencefrontPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    referencefrontPhoto.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:referencefrontPhoto];
    [referencefrontPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(12));
        make.left.equalTo(self).offset(W(32));
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(120, 90));
        }else
        {
            make.size.equalTo(CGSizeMake(144, 110));
        }
    }];
    self.referencefrontPhoto = referencefrontPhoto;
    
    //参考正面照片标签
    UILabel * referencefrontLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"参考正面照片"];
    [referencefrontPhoto addSubview:referencefrontLable];
    [referencefrontLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(referencefrontPhoto.bottom).offset(-10);
        make.centerX.equalTo(referencefrontPhoto);
    }];
    
    //点击上传身份证正面照片ImageView
    UIImageView * frontPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    frontPhoto.contentMode = UIViewContentModeScaleAspectFill;
    frontPhoto.clipsToBounds = YES;
    frontPhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer * frontTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(frontPhotoClick:)];
    [frontPhoto addGestureRecognizer:frontTap];
    frontPhoto.tag =400;
    [self addSubview:frontPhoto];
    [frontPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLable.bottom).offset(H(12));
        make.right.equalTo(self).offset(W(-32));
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(120, 90));
        }else
        {
            make.size.equalTo(CGSizeMake(144, 110));
        }
    }];
    self.frontPhoto = frontPhoto;
    
    //点击上传身份证正面照片标签
    UILabel * frontLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"点击上传\n身份证正面照片"];
    frontLable.textAlignment = NSTextAlignmentCenter;
    frontLable.numberOfLines = 0;
    [frontPhoto addSubview:frontLable];
    [frontLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(frontPhoto);
        make.centerY.equalTo(frontPhoto);
    }];
    self.frontLable = frontLable;
    
    
    //参考反面照片ImageView
    UIImageView * referencebackPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    [self addSubview:referencebackPhoto];
    [referencebackPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(referencefrontPhoto.bottom).offset(H(11));
        make.left.equalTo(referencefrontPhoto.left);
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(120, 90));
        }else
        {
            make.size.equalTo(CGSizeMake(144, 110));
        }
    }];
    self.referencebackPhoto = referencebackPhoto;
    
    
    //参考反面照片标签
    UILabel * referencebackLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"参考反面照片"];
    [referencebackPhoto addSubview:referencebackLable];
    [referencebackLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(referencebackPhoto.bottom).offset(-10);
        make.centerX.equalTo(referencebackPhoto);
    }];


    
    //点击上传身份证反面照片
    UIImageView * backPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"small grey area"]];
    backPhoto.contentMode = UIViewContentModeScaleAspectFill;
    backPhoto.clipsToBounds = YES;
    backPhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer * backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backPhotoClick:)];
    [backPhoto addGestureRecognizer:backTap];
    backPhoto.tag = 401;
    [self addSubview:backPhoto];
    [backPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(frontPhoto.bottom).offset(H(11));
        make.right.equalTo(frontPhoto);
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(120, 90));
        }else
        {
            make.size.equalTo(CGSizeMake(144, 110));
        }
    }];
    self.backPhoto = backPhoto;
    
    
    UILabel * backLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"点击上传\n身份证反面照片"];
    backLable.textAlignment = NSTextAlignmentCenter;
    backLable.numberOfLines = 0;
    [backPhoto addSubview:backLable];
    [backLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backPhoto);
        make.centerY.equalTo(backPhoto);
    }];
    self.backLable = backLable;
    
    //上传手持身份照片Lable
    UILabel * middleLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:14 text:@"上传手持身份照片"];
    [self addSubview:middleLable];
    [middleLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backPhoto.bottom).offset(H(39));
        make.left.equalTo(self.left).offset(W(32));
    }];
    
    //请保证身份证正面文字清晰可见Lable
    UILabel * middleattentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"请保证身份证正面文字清晰可见"];
    [self addSubview:middleattentionLable];
    [middleattentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(middleLable.bottom);
        make.left.equalTo(middleLable.right).offset(W(15));
    }];
    
    //点击上传手持身份证正面照片ImageView
    UIImageView * handIDPhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"big grey area"]];
    handIDPhoto.contentMode = UIViewContentModeScaleAspectFill;
    handIDPhoto.clipsToBounds = YES;
    handIDPhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer * handTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handIDPhotoClick:)];
    [handIDPhoto addGestureRecognizer:handTap];
    handIDPhoto.tag = 402;
    [self addSubview:handIDPhoto];
    [handIDPhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleLable.bottom).offset(H(12));
        make.left.equalTo(self).offset(W(32));
        make.right.equalTo(self).offset(W(-32));
        make.height.equalTo(H(200));
    }];
    self.handIDPhoto = handIDPhoto;
    
    //点击上传手持身份证正面照片Lable
    UILabel * handIDLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"点击上传\n手持身份证正面照片"];
    handIDLable.textAlignment = NSTextAlignmentCenter;
    handIDLable.numberOfLines = 0;
    [handIDPhoto addSubview:handIDLable];
    [handIDLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(handIDPhoto);
        make.centerY.equalTo(handIDPhoto);
    }];
    self.handIDLable = handIDLable;
    
    //上传店主与店铺合照Lable
    UILabel * bottomLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x13131313 alpha:1.0] textFont:14 text:@"上传店主与店铺合照"];
    [self addSubview:bottomLable];
    [bottomLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(handIDPhoto.bottom).offset(H(39));
        make.left.equalTo(self.left).offset(W(32));
    }];
    
    //请保证店铺门头清晰完整Lable
    UILabel * bottomattentionLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"请保证店铺门头清晰完整"];
    [self addSubview:bottomattentionLable];
    [bottomattentionLable makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bottomLable.bottom);
        make.left.equalTo(bottomLable.right).offset(W(15));
    }];
    
    
    //点击上传店铺与店主合照ImageView
    UIImageView * storePhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"big grey area"]];
    storePhoto.contentMode = UIViewContentModeScaleAspectFill;
    storePhoto.clipsToBounds = YES;
    storePhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer * storeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(storePhotoClick:)];
    [storePhoto addGestureRecognizer:storeTap];
    storePhoto.tag = 403;
    [self addSubview:storePhoto];
    [storePhoto makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomLable.bottom).offset(H(12));
        make.left.equalTo(self).offset(W(32));
        make.right.equalTo(self).offset(W(-32));
        make.height.equalTo(H(200));
    }];
    self.storePhoto = storePhoto;
    
    //点击上传店铺与店主合照Lable
    UILabel * storeLable = [UILabel lableWithTextColor:[UIColor colorWithHexValue:0x838383 alpha:1.0] textFont:9 text:@"点击上传\n店铺与店主合照"];
    storeLable.textAlignment = NSTextAlignmentCenter;
    storeLable.numberOfLines = 0;
    [self.storePhoto addSubview:storeLable];
    [storeLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.storePhoto);
        make.centerY.equalTo(self.storePhoto);
    }];
    self.storeLable = storeLable;
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.maxheight = CGRectGetMaxY(_storePhoto.frame);
    
}


#pragma mark -- 点击上传身份证正面照片
-(void)frontPhotoClick:(UITapGestureRecognizer *)gesture
{
    
    [self choosePhoteStyle:gesture.view];
    
    
    
}


#pragma mark -- 点击上传身份证反面照片
-(void)backPhotoClick:(UITapGestureRecognizer *)gesture
{
    [self choosePhoteStyle:gesture.view];

}


#pragma mark -- 点击上传手持身份证正面照片
-(void)handIDPhotoClick:(UITapGestureRecognizer *)gesture
{
    [self choosePhoteStyle:gesture.view];

}


#pragma mark -- 点击上传店铺与店主合照
-(void)storePhotoClick:(UITapGestureRecognizer *)gesture
{
    [self choosePhoteStyle:gesture.view];
}


//照片选择方式
-(void)choosePhoteStyle:(UIView *)imageView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        [self openAlbum:imageView];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开照相机
        [self openCamera:imageView];
    }]];
    
    //取消
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //取消选择
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
}


/**
 *
 打开相册
 
 */
//- (void)openAlbum:(UIView *)imageView
//{
//    // UIImagePickerControllerSourceTypeSavedPhotosAlbum : 从Moments相册中选一张图片
//    // UIImagePickerControllerSourceTypePhotoLibrary : 从所有相册中选一张图片
//    // UIImagePickerControllerSourceTypeCamera : 利用照相机中拍一张图片
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.view.tag = imageView.tag;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    picker.delegate = self;
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
//}


// 选择相册照片
- (void)openAlbum:(UIView *)imageView
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.view.tag = imageView.tag;
    // 获取支持的媒体格式
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    // 判断是否支持需要设置的sourceType
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        // 1、设置图片拾取器上的sourceType
//        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 2、设置支持的媒体格式
        picker.mediaTypes = @[mediaTypes[0]];
        // 3、其他设置
        picker.allowsEditing = YES; // 如果设置为NO，当用户选择了图片之后不会进入图像编辑界面。
        // 4、推送图片拾取器控制器
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
    }
}


/**
 *
 打开照相机
 
 */
//- (void)openCamera:(UIView *)imageView
//{
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.view.tag = imageView.tag;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    picker.delegate = self;
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
//}


/**
 *
 打开照相机
 
 */
- (void)openCamera:(UIView *)imageView
{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.view.tag = imageView.tag;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;

    // 获取支持的媒体格式
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    // 判断是否支持需要设置的sourceType
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        // 1、设置图片拾取器上的sourceType
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // 2、设置支持的媒体格式
        picker.mediaTypes = @[mediaTypes[0]];
        // 3、其他设置
        // 设置相机模式
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        // 设置摄像头：前置/后置
        picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        // 设置闪光模式
        picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        
        
        // 4、推送图片拾取器控制器
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
        
    }
}





#pragma mark - <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    // 关闭图片选择界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 显示选择的图片
    if (picker.view.tag == 400) {
        self.frontPhoto.image = info[UIImagePickerControllerEditedImage];
        self.frontLable.hidden = YES;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
            
        });
        
        
    }else if (picker.view.tag == 401)
    {
        self.backPhoto.image = info[UIImagePickerControllerEditedImage];
        self.backLable.hidden = YES;
    }else if (picker.view.tag == 402)
    {
        self.handIDPhoto.image = info[UIImagePickerControllerEditedImage];
        self.handIDLable.hidden = YES;
    }else if (picker.view.tag == 403)
    {
        self.storePhoto.image = info[UIImagePickerControllerEditedImage];;
        self.storeLable.hidden = YES;
    }
    
    
}




@end
