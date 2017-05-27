//
//  OrderDetailScrollView.m
//  ssda4ios
//
//  Created by gagakj on 2017/5/10.
//  Copyright © 2017年 gaga. All rights reserved.
//

#define AMap_Key @"941148985a21a5bf29abe21360611381"

#import "OrderDetailScrollView.h"



#import "PublishBtnView.h"
#import "ReceivingBtnView.h"
#import "ArriveStartBtnView.h"
#import "ServingBtnView.h"
#import "EndBtnView.h"

#import "OrderDetailFirstCell.h"
#import "OrderDetailRemainCell.h"

@interface OrderDetailScrollView ()<MAMapViewDelegate,AMapLocationManagerDelegate,AMapSearchDelegate,UITableViewDelegate,UITableViewDataSource>
//地图
@property (nonatomic, strong) MAMapView * mapView;
//定位管理者
@property (nonatomic, strong) AMapLocationManager * locationManager;

@property (nonatomic, strong) MAPointAnnotation * pointAnnotation;

//终点
@property (nonatomic, strong) MAPointAnnotation * destinationPoint;

//search
@property (nonatomic, strong) AMapSearchAPI * search;

//当前位置
@property (nonatomic, strong) CLLocation *currentLocation;

//路线数组
@property (nonatomic,retain) NSArray *pathPolylines;




@end

@implementation OrderDetailScrollView

//- (NSArray *)pathPolylines
//{
//    if (!_pathPolylines) {
//        _pathPolylines = [NSArray array];
//    }
//    return _pathPolylines;
//}
//
//- (AMapSearchAPI *)search
//{
//    if (!_search) {
//        _search = [[AMapSearchAPI alloc] init];
//        _search.delegate = self;
//    }
//    return _search;
//}


static NSString * const firstCellID = @"firstCellID";
static NSString * const remainCellID = @"remainCellID";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //界面初始化
        [self setUpUI];
        
        //增加传入的店的标志
        [self addAnnotationPoint];
        
        //调用路径规划
        [self searchWay];
        
        
        //注册cell
        [self.bottomTableView registerClass:[OrderDetailFirstCell class] forCellReuseIdentifier:firstCellID];
        [self.bottomTableView registerClass:[OrderDetailRemainCell class] forCellReuseIdentifier:remainCellID];
        
    }
    return self;
}


//界面初始化
-(void)setUpUI
{
    //添加地图
    [self addMap];
    
    
//    //增加传入的店的标志
//    [self addAnnotationPoint];
    
    //初始化search
    [self setUpSearch];

    //最上面的进度view
    self.processImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top area"]];
    [self addSubview:self.processImageView];
    [self.processImageView makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(W(320), H(138)));
            make.top.equalTo(self).offset(H(-5));
        }else
        {
            make.top.equalTo(self).offset(H(10));
        }
        make.centerX.equalTo(self);
        
    }];
    
    
    //#68
    self.numberLable = [UILabel lableWithTextColor:[UIColor blackColor] textFont:26 text:@"#68"];
    [self.processImageView addSubview:self.numberLable];
    [self.numberLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.processImageView).offset(W(20));
        make.top.equalTo(self.processImageView).offset(H(15));
    }];
    
    //服务Lable
    self.kindLable = [UILabel lableWithTextColor:RGBCOLOR(155, 155, 155) textFont:16 text:@"跑腿服务"];
    [self.processImageView addSubview:self.kindLable];
    [self.kindLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLable.right).offset(W(12));
        make.bottom.equalTo(self.numberLable.bottom);
    }];
    
    //发布中视图
    self.publishBtnView= [[PublishBtnView alloc]init];
    [self.processImageView  addSubview:self.publishBtnView];
    [self.publishBtnView makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 414) {
            make.bottom.equalTo(self.processImageView.bottom).offset(H(-30));
        }
        else
        {
            make.bottom.equalTo(self.processImageView.bottom).offset(H(-35));
        }
        
        make.left.equalTo(self.processImageView.left).offset(W(20));
        make.size.equalTo(CGSizeMake(W(60), H(40)));
    }];
    
    
    //已派单视图
    self.receivingBtnView= [[ReceivingBtnView alloc]init];
    [self.processImageView addSubview:self.receivingBtnView];
    [self.receivingBtnView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.publishBtnView);
        if (WIDTH == 414) {
            make.left.equalTo(self.publishBtnView.right).offset(W(-5));
        }
        else
        {
            make.left.equalTo(self.publishBtnView.right);
        }
        make.size.equalTo(CGSizeMake(W(60), H(40)));
    }];
    
    //到起点视图
    self.arriveStartBtnView= [[ArriveStartBtnView alloc]init];
    [self.processImageView addSubview:self.arriveStartBtnView];
    [self.arriveStartBtnView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.receivingBtnView);
        if (WIDTH == 414) {
            make.left.equalTo(self.receivingBtnView.right).offset(W(-5));
        }
        else
        {
            make.left.equalTo(self.receivingBtnView.right);
        }
        
        
        make.size.equalTo(CGSizeMake(W(60), H(40)));
    }];

    //服务中视图
    self.servingBtnView= [[ServingBtnView alloc]init];
    [self.processImageView addSubview:self.servingBtnView];
    [self.servingBtnView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.arriveStartBtnView);
        if (WIDTH == 414) {
            make.left.equalTo(self.arriveStartBtnView.right).offset(W(-5));
        }
        else
        {
            make.left.equalTo(self.arriveStartBtnView.right);
        }
        make.size.equalTo(CGSizeMake(W(60), H(40)));
    }];


    //已结束视图
    self.endBtnView= [[EndBtnView alloc]init];
    [self.processImageView addSubview:self.endBtnView];
    [self.endBtnView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.servingBtnView);
        if (WIDTH == 414) {
            make.left.equalTo(self.servingBtnView.right).offset(W(-5));
        }
        else
        {
            make.left.equalTo(self.servingBtnView.right);
        }
        
        make.size.equalTo(CGSizeMake(W(60), H(40)));
    }];

    
    
    
    
    
//    //按钮
//    UIButton * btn = [[UIButton alloc]init];
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(searchWay) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn];
//    [btn makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.processImageView.bottom).offset(H(80));
//        make.centerX.equalTo(self);
//    }];
    
    
    
    
    
    
    
    

    //中间的蓝色视图
    UIImageView * middleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"middle area"]];
    [self addSubview:middleImageView];
    [middleImageView makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 320) {
            make.size.equalTo(CGSizeMake(W(320), H(98)));
        }
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.processImageView.bottom).offset(H(140));
        
    }];
    
    //中间view左边的图片
    self.iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"time"]];
    [middleImageView addSubview:self.iconImageView];
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
        if (WIDTH == 414) {
            make.left.equalTo(self).offset(W(35));
        }
        else{
            make.left.equalTo(self).offset(W(23));
        }
        
        make.centerY.equalTo(middleImageView);
    }];
    
    
    //等待配送员接单
    self.iconLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"等待配送员接单"];
    [middleImageView addSubview:self.iconLable];
    [self.iconLable makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.right).offset(W(12));
    }];
    self.iconLable.hidden = YES;
    
    
    //配送员
    UILabel * deliverLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"配送员"];
    [middleImageView addSubview:deliverLable];
    [deliverLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.right).offset(W(16));
        if (WIDTH == 414) {
            make.top.equalTo(middleImageView.top).offset(H(17));
        }
        else if (WIDTH == 375)
        {
            make.top.equalTo(middleImageView.top).offset(H(18));
        }
        else
        {
            make.top.equalTo(middleImageView.top).offset(H(25));
        }
        
    }];
    
    //配送员的名字
    self.deliverNameLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"随时君"];
    [middleImageView addSubview:self.deliverNameLable];
    [self.deliverNameLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(deliverLable.right).offset(W(35));
        make.centerY.equalTo(deliverLable);
    }];
    
    //配送员电话Lable
    UILabel * deliverPLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"配送员电话"];
    [middleImageView addSubview:deliverPLable];
    [deliverPLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.right).offset(W(16));
        
        if (WIDTH == 414) {
            make.bottom.equalTo(middleImageView.bottom).offset(H(-17));
        }
        else if (WIDTH == 375)
        {
            make.bottom.equalTo(middleImageView.bottom).offset(H(-18));
        }
        else
        {
            make.bottom.equalTo(middleImageView.bottom).offset(H(-25));
        }
    }];
    
    //配送员电话
    self.deliverPhoneLable = [UILabel lableWithTextColor:[UIColor whiteColor] textFont:14 text:@"18698698888"];
    [middleImageView addSubview:self.deliverPhoneLable];
    [self.deliverPhoneLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.deliverNameLable.left);
        make.centerY.equalTo(deliverPLable);
    }];
    
    
    //电话按钮
    self.phoneButton = [[UIButton alloc]init];
    [self.phoneButton setImage:[UIImage imageNamed:@"deliveryman phone"] forState:UIControlStateNormal];
    [middleImageView addSubview:self.phoneButton];
    [self.phoneButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.right).offset(W(200));
        make.centerY.equalTo(middleImageView);
        make.size.equalTo(CGSizeMake(W(29), H(29)));
    }];
    
    
    //底部tableView
    self.bottomTableView = [[UITableView alloc]init];
    self.bottomTableView.scrollEnabled = NO;
    self.bottomTableView.delegate = self;
    self.bottomTableView.dataSource = self;
    self.bottomTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.bottomTableView];
    [self.bottomTableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleImageView.bottom);
        make.left.equalTo(middleImageView).offset(W(8));
        make.right.equalTo(middleImageView).offset(W(-8));
        make.height.equalTo(H(400));
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
    {
        return 20;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        OrderDetailFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:firstCellID];
        
        return cell;
    }
    else
    {
        OrderDetailRemainCell * cell = [tableView dequeueReusableCellWithIdentifier:remainCellID];
        if (indexPath.row == 1) {
            cell.titltLable.text = @"客户姓名";
            cell.contentLable.text = @"雷先生";
        }else if (indexPath.row == 2)
        {
            cell.titltLable.text = @"客户电话";
            cell.contentLable.text = @"18759685411";
        }else if (indexPath.row == 3)
        {
            cell.titltLable.text = @"客人地址";
            cell.contentLable.text = @"上海市浦东新区福山路2556号";
        }else if (indexPath.row == 4)
        {
            cell.titltLable.text=@"寄    方";
            cell.contentLable.text = @"梁山伯，18965296511  上海市浦东新区福山路556弄宇宙智慧湾66号101室";
        }
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47;
}

#pragma mark -- 添加地图
-(void)addMap
{
    
    [AMapServices sharedServices].apiKey = AMap_Key;
    
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, H(415))];
    
    self.mapView.zoomLevel = 14;
    
    self.mapView.delegate = self;
    [self addSubview:self.mapView];
    
    //定位开启，并显示小蓝点
    self.mapView.showsUserLocation = YES;
    //定位模式
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //去掉小蓝点，变成自己定位的图片
//    MAUserLocationRepresentation * present = [[MAUserLocationRepresentation alloc]init];
//    present.showsAccuracyRing = NO;
//    present.image = [UIImage imageNamed:@"biz location"];
//    [self.mapView updateUserLocationRepresentation:present];
    
    
//    [self.mapView makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.top.equalTo(self);
//        make.size.equalTo(CGSizeMake(WIDTH, H(415)));
//    }];
    
}

#pragma mark -- 初始化search
-(void)setUpSearch
{
    self.search = [[AMapSearchAPI alloc]init];
    self.search.delegate = self;
    
}




#pragma mark -- MAMapViewDelegate,实时更新位置刷新
//-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
//{
////    self.mapView.zoomLevel = 14;
//    
//    NSLog(@"userLocation : %@",userLocation.location);
//    //获取当前位置
//    self.currentLocation = userLocation.location;
//    
////    //去掉小蓝点，变成自己定位的图片
////    MAUserLocationRepresentation * present = [[MAUserLocationRepresentation alloc]init];
////    present.showsAccuracyRing = NO;
////    present.image = [UIImage imageNamed:@"biz location"];
////    [self.mapView updateUserLocationRepresentation:present];
//    
//    
//    //调用路径规划
//    [self searchWay];
//
//}

//模拟传过来的点。
-(void)addAnnotationPoint
{
    //创建大头针对象
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    
    //插入大头针的位置
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(32.00, 120.89688531);
    //大头针的标题
    pointAnnotation.title = @"第一个点";
    //大头针的子标题
    pointAnnotation.subtitle = @"测试测试测试";
    [self.mapView addAnnotation:pointAnnotation];
    
    
    
    
    //创建大头针对象
    MAPointAnnotation *pointAnnotation1 = [[MAPointAnnotation alloc] init];
    
    //插入大头针的位置
    pointAnnotation1.coordinate = CLLocationCoordinate2DMake(32.00, 120.90);
    //大头针的标题
    pointAnnotation1.title = @"第二个点";
    //大头针的子标题
    pointAnnotation1.subtitle = @"测试测试测试";
    [self.mapView addAnnotation:pointAnnotation1];
    
    self.destinationPoint = pointAnnotation1;
}


//添加大头针对应的地图代理方法实现
-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString * annotationID = @"annotationID";
        MAAnnotationView * annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationID];
        if (annotationView == nil) {
            annotationView = [[MAAnnotationView  alloc]initWithAnnotation:annotation reuseIdentifier:annotationID];
        }
        annotationView.canShowCallout= NO; //设置气泡可以弹出，默认为NO
        //大头针图片
//        annotationView.image = [UIImage imageNamed:@"customer location"];
        
        if ([annotation.title isEqualToString:@"第二个点"]) {
            annotationView.image = [UIImage imageNamed:@"deliveryman position"];
            NSLog(@"~~~~~~~~~~~~~~~~~%lf%lf",annotation.coordinate.latitude,annotation.coordinate.longitude);
        }else{
        annotationView.image = [UIImage imageNamed:@"customer location"];
        }
        
        return annotationView;
    }
    //没有合适的
    return nil;
}

//路径规划
-(void)searchWay
{
//    self.currentLocation = self.mapView.userLocation.location;
    if (self.destinationPoint == nil || self.currentLocation == nil || self.search == nil ) {
        XXJLog(@"path search failed")
        return;
    }
    
    AMapRidingRouteSearchRequest * rideSearch = [[AMapRidingRouteSearchRequest alloc]init];
    rideSearch.origin = [AMapGeoPoint locationWithLatitude:self.currentLocation.coordinate.latitude longitude:self.currentLocation.coordinate.longitude];
    
    rideSearch.destination = [AMapGeoPoint locationWithLatitude:self.destinationPoint.coordinate.latitude longitude:self.destinationPoint.coordinate.longitude];
    
    [self.search AMapRidingRouteSearch:rideSearch];
    
    
}

/* 路径规划搜索回调. */
- (void)onRouteSearchDone:(AMapRouteSearchBaseRequest *)request response:(AMapRouteSearchResponse *)response
{
    
    if(response.route == nil)
    {
        return;
    }
    
    //通过AMapNavigationSearchResponse对象处理搜索结果
    NSString *route = [NSString stringWithFormat:@"Navi: %@", response.route];
    
    NSLog(@"%@", route);
    AMapPath *path = response.route.paths[0];
    AMapStep *step = path.steps[0];
    NSLog(@"%@",step.polyline);
    NSLog(@"%@",response.route.paths[0]);
    
    
    if (response.count > 0)
    {
        //移除地图原本的遮盖
        [_mapView removeOverlays:_pathPolylines];
        _pathPolylines = nil;
        
        // 只显⽰示第⼀条 规划的路径
        _pathPolylines = [self polylinesForPath:response.route.paths[0]];
        NSLog(@"=========%@",response.route.paths[0]);
        
        //添加新的遮盖，然后会触发代理方法进行绘制
        [_mapView addOverlays:_pathPolylines];
        
        //        解析第一条返回结果
        //        搜索路线
        MAPointAnnotation *currentAnnotation = [[MAPointAnnotation alloc]init];
        currentAnnotation.coordinate = _mapView.userLocation.coordinate;
        [_mapView showAnnotations:@[_destinationPoint, currentAnnotation] animated:YES];
        [_mapView addAnnotation:currentAnnotation];
    }
}

//解析经纬度
- (CLLocationCoordinate2D *)coordinatesForString:(NSString *)string
                                 coordinateCount:(NSUInteger *)coordinateCount
                                      parseToken:(NSString *)token
{
    if (string == nil)
    {
        return NULL;
    }
    
    if (token == nil)
    {
        token = @",";
    }
    
    NSString *str = @"";
    if (![token isEqualToString:@","])
    {
        str = [string stringByReplacingOccurrencesOfString:token withString:@","];
    }
    
    else
    {
        str = [NSString stringWithString:string];
    }
    
    NSArray *components = [str componentsSeparatedByString:@","];
    NSUInteger count = [components count] / 2;
    if (coordinateCount != NULL)
    {
        *coordinateCount = count;
    }
    CLLocationCoordinate2D *coordinates = (CLLocationCoordinate2D*)malloc(count * sizeof(CLLocationCoordinate2D));
    
    for (int i = 0; i < count; i++)
    {
        coordinates[i].longitude = [[components objectAtIndex:2 * i]     doubleValue];
        coordinates[i].latitude  = [[components objectAtIndex:2 * i + 1] doubleValue];
    }
    return coordinates;
}




//路线解析
-(NSArray *)polylinesForPath:(AMapPath *)path
{
    if (path == nil || path.steps.count == 0) {
        return  nil;
    }
    NSMutableArray * polylines = [NSMutableArray array];
    [path.steps enumerateObjectsUsingBlock:^(AMapStep * step, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger count = 0;
        CLLocationCoordinate2D * coordinates = [self coordinatesForString:step.polyline coordinateCount:&count parseToken:@";"];
        MAPolyline * polyline = [MAPolyline polylineWithCoordinates:coordinates count:count];
        [polylines addObject:polyline];
        
        free(coordinates), coordinates = NULL;
        
    }];
    
    return polylines;
}
#pragma maek --MAMapViewDelegate
//每次添加路线，区域，或者大头针等都会触发下面的代理方法
//绘制遮盖时执行的代理方法
-(MAOverlayView *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]]) {
        MAPolylineView * polylineView = [[MAPolylineView alloc]initWithPolyline:overlay];
        polylineView.lineWidth = 5;
        polylineView.strokeColor = [UIColor colorWithHexValue:0x08C39D alpha:0.67];
        //连接类型
        polylineView.lineJoin = kCGLineJoinBevel;
        return polylineView;
    }
    return  nil;
}








































@end
