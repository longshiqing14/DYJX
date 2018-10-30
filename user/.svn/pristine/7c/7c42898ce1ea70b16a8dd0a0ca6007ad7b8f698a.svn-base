//
//  JXHomeViewController.m
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomeViewController.h"
#import "JXHomeHeatView.h"
#import "JXHomelDataModel.h"
#import "JXHomeRechargeCell.h"
#import "JXHomeRecommendView.h"
#import "JXHomeCommodityHeatView.h"
#import "JXHomeActivityCell.h"
#import "JXHomeRecommendCell.h"
#import "JXHomeCommodityCell.h"
#import "JXCommodityListViewController.h"
#import "JXHomeRecommendCollectionView.h"
#import "JXHomeRecommendCollectionCell.h"
#import "XYGoodsDetailVC.h"
#import "XYPreDepositVC.h"
#import "JXActivityPage.h"

static NSString *cellI=@"cell";
static NSString *cellIHeat=@"cell";
//充值
static NSString *cellID=@"cellID";
//轮播图
static NSString *heatID=@"heatID";
//活动
static NSString *cellID1=@"cellID1";
//每日推荐
static NSString *heatID2=@"heatID2";
//每日推荐cell
static NSString *cellID2=@"cellID2";
//楼层的头
static NSString *heatID3=@"heatID3";
//楼层cell
static NSString *cellID3=@"cellID3";

@interface JXHomeViewController (){
    JXHomelDataModel *homelDataModel;
    NSMutableArray *imageUrl;
    NSMutableArray *clockArray;
    NSMutableArray *MoreArray;
    NSString *recommendTitle;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heatHome;
@property(nonatomic,strong)NSMutableArray *homeListArray;
@end

@implementation JXHomeViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self getHomelData:YES];
    }
    return self;
}

//-(id)initWithCoder:(NSCoder *)aDecoder{
//    self=[super initWithCoder:aDecoder];
//    if (self) {
//        [self getHomelData];
//    }
//    return self;


- (void)viewDidLoad {
    [super viewDidLoad];
    imageUrl=[[NSMutableArray alloc]init];
    clockArray=[[NSMutableArray alloc]init];
    MoreArray=[[NSMutableArray alloc]init];
    _homeListArray=[[NSMutableArray alloc]init];
    [self homeUI];
//    NSString *version = [UIDevice currentDevice].systemVersion;
//
//    if([version rangeOfString:@"10"].location !=NSNotFound)//_roaldSearchText
//    {
//        _heatHome.constant=45;
//    }
//    else
//    {
//        NSLog(@"no");
//    }

    
    
}

-(void)homeUI{
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:SETIMAGENAME(@"ic_home_logo")];
    WeakSelf;
    _homeTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [weakSelf getHomelData:NO];
    }];
    
//    _homeTableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf getHomelData];
//    }];
    
    
    [self homeUIHeatView];
    [self homeUICellView];
//    [self getHomeAlldata];
    
    
}


-(void)homeUIHeatView{
    [_homeTableView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellIHeat];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeHeatView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:heatID];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeRecommendView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:heatID2];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeCommodityHeatView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:heatID3];
}

-(void)homeUICellView{
    [_homeTableView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellI];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeRechargeCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeActivityCell" bundle:nil] forCellWithReuseIdentifier:cellID1];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeRecommendCollectionCell" bundle:nil] forCellWithReuseIdentifier:cellID2];
    [_homeTableView registerNib:[UINib nibWithNibName:@"JXHomeCommodityCell" bundle:nil] forCellWithReuseIdentifier:cellID3];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 马上进入刷新状态
    
}

-(void)getHomeAlldata{
//    [self getHomelData];
     // 马上进入刷新状态
    [_homeTableView.header beginRefreshing];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self getHomeAlldata];
    
}

-(void)getHomelData:(BOOL)showAndDismiss{
    [_homeListArray removeAllObjects];
    [_homeTableView reloadData];
    __weak typeof(self)SelfWeak=self;
    [self network:[NSDictionary new] relativePath:kJXAPI_user_Template ShowAndDismiss:showAndDismiss  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        homelDataModel=[JXHomelDataModel modelWithJSON:responseObject];
        NSLog(@"%@",homelDataModel);
        [_homeListArray removeAllObjects];
        [SelfWeak setUpData];
        [_homeTableView.mj_header endRefreshing];
        [_homeTableView reloadData];
    } failure:^{
        [_homeTableView.mj_header endRefreshing];
        [_homeTableView reloadData];
    } UnusualFailure:^{
        [_homeTableView.mj_header endRefreshing];
        [_homeTableView reloadData];
    }];
}


-(void)setUpData{
    [XYProgressHUD show];
//    清空轮播图和点击数组
    [imageUrl removeAllObjects];
    [clockArray removeAllObjects];
    [MoreArray removeAllObjects];
//    轮播图
    if (homelDataModel.carousel.count>0) {
        NSDictionary *dic=@{@"carousel":homelDataModel.carousel,@"carouselvalue":[NSArray new]};
        [_homeListArray addObject:dic];
        for (HomelCarouselModel *model in homelDataModel.carousel) {
            if (model.imgUrl) {
                [imageUrl addObject:model.imgUrl];
                [clockArray addObject:model.url];
            }
            
        }
    }
//    充值送宽带
    if (homelDataModel.image) {
        NSDictionary *dic=@{@"image":[NSArray new],@"imagevalue":[NSArray arrayWithObjects:homelDataModel.image, nil]};
        [_homeListArray addObject:dic];
    }
    if (homelDataModel.imageList.count>0) {
        NSDictionary *dic=@{@"imageList":[NSArray new],@"imageListvalue":homelDataModel.imageList};
        [_homeListArray addObject:dic];
    }
//    每日推荐
    NSMutableDictionary *dicte=[[NSMutableDictionary alloc]init];
    if (homelDataModel.recommendList.products.count>0) {
        
        [dicte setObject:homelDataModel.recommendList.products forKey:@"catNamevalue"];
        
        
    }else{
        
        [dicte setObject:[NSArray new] forKey:@"catNamevalue"];
    }
    
    NSLog(@"%@",homelDataModel.recommendList.title); recommendTitle=homelDataModel.recommendList.title;
    if (homelDataModel.recommendList.rotatea.count>0) {


        
        [dicte setObject:homelDataModel.recommendList.rotatea forKey:@"catName"];
    }else{
        
        [dicte setObject:[NSArray new] forKey:@"catName"];
    }
    [_homeListArray addObject:dicte];
//    楼层
    for (int i=0; i<_homeListArray.count; i++) {
        [MoreArray addObject:[NSDictionary new]];
    }
    for (HomelCategoriesModel *model in homelDataModel.categories) {
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [MoreArray addObject:model.catName];
        if (model.rotatea.count>0) {
//            if (!model.catName) {
//                model.catName=@"categories";
//            }
            [dic setObject:model.rotatea forKey:@"categories" ];
        }else{
            [dic setObject:[NSArray new] forKey:@"categories"];
        }
        if (model.products.count>0) {
            [dic setObject:model.products forKey:@"categoriesvalue"];
        }else{
            [dic setObject:[NSArray new] forKey:@"categoriesvalue"];
        }
        [_homeListArray addObject:dic];
    }
    [XYProgressHUD svHUDDismiss];
}


#pragma mark - UIcolectionViewDelegate && DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return _homeListArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSDictionary *dic=_homeListArray[section];
    NSString *key=[dic allKeys][1];
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if (![self isContain:key]) {
            key=[NSString stringWithFormat:@"%@value",key];
        }
    }
    NSArray *array=[dic valueForKey:key];
    NSLog(@"%d",array.count);
    if ([key isEqualToString: @"catNamevalue"]) {
        return 1;
    }
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellI forIndexPath:indexPath];
    NSDictionary *dic=_homeListArray[indexPath.section];
    NSString *key=[dic allKeys][0];
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if (![self isContain:key]) {
            key=[NSString stringWithFormat:@"%@value",key];
        }
    }
    NSArray *array=[dic valueForKey:key];
//    充值送宽带
    if ([key isEqualToString:@"imagevalue"]) {
        JXHomeRechargeCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        [cell cell_init:[array objectAtIndex:indexPath.row]];
        return cell;
    }else if([key isEqualToString:@"catNamevalue"]){
//        每日推荐的
//        JXHomeRecommendCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID2 forIndexPath:indexPath];
//        [cell cell_init:array[indexPath.row]];
        JXHomeRecommendCollectionCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID2 forIndexPath:indexPath];
        [cell cell_init:array];
//        商品详情
        cell.ClockItem = ^(HomelRecommendListModel *model) {
            NSLog(@"%@",model.productId);
            XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
                    detailVC.productId = model.productId;
            [weakSelf.navigationController pushViewController:detailVC animated:YES];
        };
////      添加购物车
//        cell.AddShop = ^(CGRect frame, HomelRecommendListModel *ListModel,UIImage *carImage) {
//            
//            
//            NSLog(@"添加购物车");
//        };
        return cell;
    }else if([key isEqualToString:@"categoriesvalue"]){
//        楼层
        JXHomeCommodityCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID3 forIndexPath:indexPath];
        [cell cell_init:[array objectAtIndex:indexPath.row]];
        cell.AddShopCarClock = ^(CGPoint point) {
            NSLog(@"添加购物车");
            HomelRecommendListModel *model=[array objectAtIndex:indexPath.row];
            [YWDTools addCartAnimationWithStartPoint:point endPoint:CGPointMake(0, 0) goodsImage:model.logo productId:model.productId animation:YES];
        };
        return cell;
    }else if ([key isEqualToString:@"imageListvalue"]){
//        活动
        JXHomeActivityCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID1 forIndexPath:indexPath];
        [cell cell_init:[array objectAtIndex:indexPath.row]];
    
        return cell;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic=_homeListArray[indexPath.section];
    NSString *key=[dic allKeys][0];
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if (![self isContain:key]) {
            key=[NSString stringWithFormat:@"%@value",key];
        }
    }
    NSArray *array=[dic valueForKey:key];

    
    //    充值送宽带
    if ([key isEqualToString:@"imagevalue"]) {
        HomelImageModel *model=[array objectAtIndex:indexPath.row];
     
        [self pushController:model.imgLinkTo];
    }else if([key isEqualToString:@"catNamevalue"]){
        //        每日推荐的
        
        
        
        
    }else if([key isEqualToString:@"categoriesvalue"]){
        //        楼层
        HomelRecommendListModel *model=array[indexPath.row];
        XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
            detailVC.productId = model.productId;
        [self.navigationController pushViewController:detailVC animated:YES];
    }else if ([key isEqualToString:@"imageListvalue"]){
        //        活动
        HomelRotateaModel *model=array[indexPath.row];
        
        [self pushController:model.linkTo];
        
    }
 
}
#pragma mark -UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic=_homeListArray[indexPath.section];
    NSString *key=[dic allKeys][0];
    NSLog(@"%@",recommendTitle);
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if (![self isContain:key]) {
            key=[NSString stringWithFormat:@"%@value",key];
        }
    }
    NSArray *array= [dic valueForKey:key];
    if ([key isEqualToString:@"imagevalue"]) {
        //    充值送宽带
        if (array.count>0) {
            
                HomelImageModel *model = array[0];
                
                int height = (int) (kScreenWidth * [model.height intValue] * 1.0 / [model.weight intValue]);
                
                return CGSizeMake(kScreenWidth, height);
            
        }
    }else if([key isEqualToString:@"catNamevalue"]){
        //        每日推荐的
        if (array.count>0) {
            NSLog(@"%f",kScreenWidth/2.5*1.5);
            return CGSizeMake(kScreenWidth, 220);
            
        }
    }else if([key isEqualToString:@"categoriesvalue"]){
        //        楼层
        if (array.count>0) {
            return CGSizeMake(XYScreenW/2,280);
        }
    }else if ([key isEqualToString:@"imageListvalue"]){
        //        活动
        if (array.count>0) {
               HomelRotateaModel *model=array[0];
              int height = (int) (kScreenWidth/2 * [model.height intValue] * 1.0 / [model.weight intValue]);
            if (height == 0) {
                return CGSizeMake(kScreenWidth/2, 84);
            }
            return CGSizeMake(kScreenWidth/2, height);
        }
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    NSDictionary *dic=_homeListArray[section];
    NSString *key=[[dic allKeys] objectAtIndex:0];
    NSLog(@"%@",key);
    
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if ([self isContain:key]) {
            key=[key substringToIndex:key.length-5];
        }
    }
    NSLog(@"%@",key);
    NSArray *array=[dic valueForKey:key];
    
    
    //    轮播滚动图
    if ([key isEqualToString:@"carousel"]) {
        if (array.count>0) {
            
            HomelCarouselModel *carouselModel=array[0];
            int height = (int) (kScreenWidth * [carouselModel.height intValue] * 1.0 / [carouselModel.weight intValue]);
            
            return CGSizeMake(kScreenWidth, height);
        }
    }else if ([key isEqualToString:@"catName"]&&recommendTitle.length!=0){
        //  每日推荐
//        if (array.count>0) {
            return CGSizeMake(kScreenWidth, 46);
//        }
    }else if ([key isEqualToString:@"categories"]||[self IsChinese:key]){
        if (array.count>0) {
            HomelRotateaModel *rotateaModel=array[0];
           int height = (int) (kScreenWidth * [rotateaModel.height intValue] * 1.0 / [rotateaModel.weight intValue]);
            
            return CGSizeMake(kScreenWidth, height+45);
        }else{
            return CGSizeMake(kScreenWidth, 45);
        }
    }
    
    
    
    
    
    return CGSizeMake(0, 0);
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(kScreenWidth, 0);
//}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        return [self collectionView:collectionView viewForHeadViewOfKind:kind atIndexPath:indexPath];
    }
//    else
//    return [UICollectionReusableView new];
    return nil;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForHeadViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic=_homeListArray[indexPath.section];
    NSString *key=[dic allKeys][1];
    if (![self IsChinese:key]) {
        NSLog(@"%@",key);
        if ([self isContain:key]) {
            key=[key substringToIndex:key.length-5];
        }
    }
    
    NSLog(@"%@",key);
    NSArray *array=[dic valueForKey:key];
    WeakSelf;
//    UICollectionReusableView *view=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:cellIHeat forIndexPath:indexPath];
//    轮播滚动图
    if ([key isEqualToString:@"carousel"]) {
        if (array.count>0) {
            JXHomeHeatView*view = (JXHomeHeatView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:heatID forIndexPath:indexPath];
            NSLog(@"%@",homelDataModel.carouselFrame);
            [view heat_init:imageUrl CarouselTime:homelDataModel.carouselFrame];
            view.CarouselClockIndex = ^(NSInteger index) {
               NSLog(@"%@",clockArray[index]) ;
             [weakSelf pushController:clockArray[index]];
            };
            return view;
        }
    }else if ([key isEqualToString:@"catName"]&&recommendTitle.length!=0){
//  每日推荐
//        if (array.count>0) {
            JXHomeRecommendView*view = (JXHomeRecommendView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:heatID2 forIndexPath:indexPath];
        view.heatRecommend.text=recommendTitle;
//            if ([self IsChinese:key]) {
//                view.heatRecommend.text=key;
//            }else{
//                view.heatRecommend.text=@"";
//            }
        
            return view;
//        }
    }else if ([key isEqualToString:@"categories"]||[self IsChinese:key]){
        JXHomeCommodityHeatView*view = (JXHomeCommodityHeatView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:heatID3 forIndexPath:indexPath];
        if (array.count>0) {
            
            view.MoreClock = ^{
                NSLog(@"%d",indexPath.section); NSLog(@"%@",MoreArray[indexPath.section]);
                HomelCatNameModel *model=MoreArray[indexPath.section];
                [weakSelf pushController:model.linkTo];
            };
            view.CarouselClockIndex = ^(NSInteger index) {
                NSLog(@"%@",array[index]);
                HomelRotateaModel *model=array[index];
                [weakSelf pushController:model.linkTo];
            };
           
            [view heat_initTitle:MoreArray[indexPath.section]];
            [view heat_init:array CarouselTime:homelDataModel.carouselFrame];
//            if ([self IsChinese:key]) {
//                view.heatTitle.text=key;
//            }else{
//                view.heatTitle.text=@"";
//            }
            view.cycleScrollView.frame=CGRectMake(0, 0, XYScreenW, view.frame.size.height-45);
            return view;
        }else{
            view.CarouselClockIndex = ^(NSInteger index) {
                NSLog(@"%@",array[index]);
                HomelRotateaModel *model=array[index];
                [weakSelf pushController:model.linkTo];
            };
            view.MoreClock = ^{
                NSLog(@"%d",indexPath.section); NSLog(@"%@",MoreArray[indexPath.section]);
                HomelCatNameModel *model=MoreArray[indexPath.section];
                [weakSelf pushController:model.linkTo];
            };
            [view heat_initTitle:MoreArray[indexPath.section]];
            view.cycleScrollView.frame=CGRectMake(0, 0, 0, 0);
            return view;
        }
    }

    
    
    return nil;
}

-(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i]; if( a > 0x4e00 && a < 0x9fff)
    {
        return YES;
    }
}
    return NO;
}

-(BOOL)isContain:(NSString *)str{
    
    if ([str containsString:@"value"]) {
        
        return YES;
        
    } else {
        return NO;
        
    }

}




//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForFooterViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
//    view.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
//    return view;
//}



-(void)pushController:(NSString *)pushUrl{

    NSLog(@"%@",pushUrl);
    if ([pushUrl rangeOfString:@"product_details"].location != NSNotFound&&[pushUrl rangeOfString:@"productId"].location != NSNotFound) {
        NSRange range = [pushUrl rangeOfString:@"productId"];//匹配得到的下标
        NSLog(@"rang:%@",NSStringFromRange(range));
        pushUrl = [pushUrl substringFromIndex:range.location];//截取范围类的字符串
        pushUrl=[pushUrl stringByReplacingOccurrencesOfString:@"#"withString:@""];
        pushUrl=[pushUrl stringByReplacingOccurrencesOfString:@"productId="withString:@""];
         NSLog(@"rang:%@",pushUrl);
        XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
        detailVC.productId = pushUrl;//[NSString stringWithFormat:@"%@%@",BEST_H5_URL,pushUrl];
        [self.navigationController pushViewController:detailVC animated:YES];
       
        
    } else if([pushUrl rangeOfString:@"http"].location != NSNotFound||[pushUrl rangeOfString:@"https"].location != NSNotFound||[pushUrl rangeOfString:@"www"].location != NSNotFound){
        JXActivityPage * webVC = [[JXActivityPage alloc]init];
        NSString *cityID = [XYUserDefaults readAppDlegateOfUser_cityOfcityid];
        NSString *merchantID = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
        NSString *webURL = [NSString stringWithFormat:@"%@&cityId=%@&merchantId=%@&isShare=no",pushUrl,cityID,merchantID];
        webVC.webURLstr = webURL;
        [self.navigationController pushViewController:webVC animated:YES];
    }else if([pushUrl rangeOfString:@"recharge"].location != NSNotFound){
        if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请先登录" dismissTimeInterval:1.0];
            return;
        }
        XYPreDepositVC * preDepositVC = [[XYPreDepositVC alloc]init];
        preDepositVC.isProductList = @"N";
        [self.navigationController pushViewController:preDepositVC animated:YES];
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
