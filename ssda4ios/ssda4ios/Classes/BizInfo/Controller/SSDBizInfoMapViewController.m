//
//  SSDBizInfoMapViewController.m
//  ssda4ios
//
//  Created by 许小军 on 2017/5/26.
//  Copyright © 2017年 gaga. All rights reserved.
//
#define AMap_Key @"941148985a21a5bf29abe21360611381"
#import "SSDBizInfoMapViewController.h"

@interface SSDBizInfoMapViewController ()<MAMapViewDelegate,AMapSearchDelegate,UITableViewDelegate,UITableViewDataSource>
//创建一个私有地图属性
@property(strong,nonatomic)MAMapView * mapView;

@property(strong,nonatomic) AMapSearchAPI * search;

//所有的兴趣点
@property(strong,nonatomic) NSArray * pois;

//地图中间的大头针
@property(strong,nonatomic) MAPointAnnotation *pointAnnotation;

@property(strong,nonatomic) UITableView * tableView;
@end

@implementation SSDBizInfoMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //1、初始化地图
    [self setUpMapView];
    
    //地图中心点的大头针
    [self addCenterAnnotation];
    
    //初始化search
    [self setUpSearch];
    
    //数组初始化
    [self arrayInit];
    
    //tableView初始化
    [self setUpTableView];
}
-(void)setUpTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) * 0.5, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) * 0.5) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


-(void)arrayInit
{
    self.pois = nil;
}

#pragma mark -- 初始化地图
-(void)setUpMapView
{
    [AMapServices sharedServices].apiKey = AMap_Key;
    
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) * 0.5)];
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    
    self.mapView.zoomLevel = 14;
    //定位开启，并显示小蓝点
    self.mapView.showsUserLocation = YES;
    //定位模式
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}

#pragma mark -- 初始化search
-(void)setUpSearch
{
    self.search = [[AMapSearchAPI alloc]init];
    self.search.delegate = self;
    
}

#pragma mark -- MAMapViewDelegate,实时更新位置刷新
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    NSLog(@"userLocation : %@",userLocation.location);
    //获取当前位置
    
}

-(void)addCenterAnnotation
{
    //创建大头针对象
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    
    //插入大头针的位置
//    pointAnnotation.coordinate = self.mapView.centerCoordinate;
    pointAnnotation.lockedScreenPoint = CGPointMake(WIDTH/2, (HEIGHT- kMarginTopHeight) / 4);
    pointAnnotation.lockedToScreen = YES;
    //大头针的标题
    pointAnnotation.title = @"第一个点";
    //大头针的子标题
    pointAnnotation.subtitle = @"测试测试测试";
    [self.mapView addAnnotation:pointAnnotation];
    
    self.pointAnnotation = pointAnnotation;
}

//- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    self.pointAnnotation.coordinate = mapView.centerCoordinate;
//}
//
//- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated
//{
//    self.pointAnnotation.coordinate = mapView.centerCoordinate;
//}

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
        annotationView.image = [UIImage imageNamed:@"deliveryman position"];
        NSLog(@"~~~~~~~~~~~~~~~~~%lf%lf",annotation.coordinate.latitude,annotation.coordinate.longitude);
        return annotationView;
    }
    //没有合适的
    return nil;
}


- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%f=====%f",self.pointAnnotation.coordinate.longitude,self.pointAnnotation.coordinate.latitude);
    
    //周边搜索
    AMapPOIAroundSearchRequest * request = [[AMapPOIAroundSearchRequest alloc]init];
    //以当前位置为中心
    request.location = [AMapGeoPoint locationWithLatitude:self.pointAnnotation.coordinate.latitude longitude:self.pointAnnotation.coordinate.longitude];
    request.keywords = @"餐饮";
    //开始周边搜索
    [self.search AMapPOIAroundSearch:request];
    
}


//搜索结果的回调方法
//搜索失败的回调和上面的逆地理编码失败回调方法是同一个
-(void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    NSLog(@"request : %@",request);
    NSLog(@"response : %@",response);
    
    //
    if (response.pois.count > 0) {
        self.pois = response.pois;
        XXJLog(@"%@",self.pois);
        [self.tableView reloadData];
//        //清空标注(大头针)
//        [self.mapView removeAnnotations:self.annotations];
//        //获得了回调结果将之前的点击添加的标记删除
//        [self.annotations removeAllObjects];
    }
}
//查询失败
-(void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    NSLog(@"request : %@  error: %@",request,error);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pois.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    AMapPOI * poi = self.pois[indexPath.row];
    cell.textLabel.text = poi.name;
    cell.detailTextLabel.text = poi.address;
    return cell;
}


////选中tableView的某一行时 添加大头针
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //为点击poi点添加标记
//    AMapPOI * poi = self.pois[indexPath.row];
//    //添加大头针 之前的MAUserLocation也是大头针，就是小蓝点，还有一个就是下面的MAPointAnnotation
//    MAPointAnnotation * annotation = [[MAPointAnnotation alloc]init];
//    annotation.coordinate = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
//    annotation.title = poi.name;
//    annotation.subtitle = poi.address;
//    
//    [self.mapView addAnnotation:annotation];
//    //记录一下点击了哪些标记
////    [self.annotations addObject:annotation];
//    
//}






























@end
