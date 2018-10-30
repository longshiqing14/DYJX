//
//  XYAddressViewController.m
//  user
//
//  Created by liu_yakai on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYAddressViewController.h"
#import "XYAddressCell.h"
#import "XYSystemLocation.h"
#import "XYLocationModel.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

static NSString *cellID=@"cellID";
@interface XYAddressViewController ()<AMapSearchDelegate>
@property(nonatomic,strong)NSArray *cityListArray;
@property (weak, nonatomic) IBOutlet UITableView *addressTableView;
@property(nonatomic,strong)AMapLocationManager *locationManager;
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@property(nonatomic,strong)AMapSearchAPI *search;
@end

@implementation XYAddressViewController
- (IBAction)disClock:(id)sender {
    [self dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)SelfWeek=self;
    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
    [self.addressTableView registerNib:[UINib nibWithNibName:@"XYAddressCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    [self seachMap:self.xylatModel.lat longitude:self.xylatModel.lon];
    self.view.backgroundColor=XYRGBAColor(0, 0, 0, .7);
   
    
}

-(NSArray *)cityListArray{
    if (!_cityListArray) {
        _cityListArray=[[NSMutableArray alloc]init];
    }
    return _cityListArray;
}




-(void)seachMap:(CGFloat)lat longitude:(CGFloat)lon{
    [XYProgressHUD svHUDShowStyle:XYHUDStyleNone title:@"加载中···" dismissTimeInterval:1.0];
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    
    request.location            = [AMapGeoPoint locationWithLatitude:lat longitude:lon];
    request.keywords            = @"";
    /* 按照距离排序. */
    //    request.sortrule            = 0;
    //    request.requireExtension    = YES;
    
    [_search AMapPOIAroundSearch:request];
}


#pragma mark - AMapSearchDelegate
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    [XYProgressHUD svHUDDismiss];
    [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    NSLog(@"Error: %@", error);
}


/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    [XYProgressHUD svHUDDismiss];
    if (response.pois.count == 0)
    {
        return;
    }
    _cityListArray=response.pois;
    [_addressTableView reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_cityListArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    AMapPOI *aMapPOI=_cityListArray[indexPath.row];
    cell.cellTitle.text=aMapPOI.name;
    cell.cellSubtitle.text=aMapPOI.address;
//    cell.cellImageView.image=[UIImage imageNamed: ]
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AMapPOI *aMapPOI=_cityListArray[indexPath.row];
    XYLocationModel *locationModel=[[XYLocationModel alloc]init];
    locationModel.POIName=aMapPOI.name;
    locationModel.address=aMapPOI.address;
    if (self.dissSelectAddress) {
        [self dismiss];
        self.dissSelectAddress(locationModel);
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

-(void)dismiss
{
    if (self.dissViewController) {
        self.dissViewController(self);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
