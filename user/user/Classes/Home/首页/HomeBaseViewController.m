//
//  HomeBaseViewController.m
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "HomeBaseViewController.h"
#import "JXHomeChannelModel.h"
#import "JXHomeViewController.h"
#import "JXHomeLifeView.h"
#import "JXCityListViewController.h"
#import "JXGetSetCityModel.h"
#import "JXCityListModel.h"
#import "JXOtherViewController.h"
#import "XYNotificationCenterWebVC.h"
#import "JXSearchHistoryPage.h"
#import "JXActivityPage.h"
#import "XYGoodsDetailVC.h"
#import "UIButton+touch.h"
#import "XYUMSocialShareView.h"
#import "XYNoticePushModel.h"
#import "XYNoticePush.h"   //
#import "AppDelegate.h"
#import "XYLocationModel.h"

//#import "XYOrderDetailSubClassOrderDetailVC.h"
#import "JXMyOrderDetailsViewController.h"
#import "JXLocationTool.h"

@interface HomeBaseViewController (){
    JXHomeChannelModel *homeBaseModel;
    JXHomeLifeView *lifeView;
    JXCityListModel *cityListModel;
    
}
/** 暂存的  通知数据 */
@property (nonatomic, strong) XYNoticePushModel * notiPushModel;
@property(nonatomic,strong)JXHomeViewController *homeViewController;
//@property(nonatomic,strong)JXOtherViewController *otherViewController;
@property(nonatomic,strong)NSMutableArray *listArray;

@property(nonatomic,strong)UIButton *messageButton;

@end

@implementation HomeBaseViewController


- (instancetype)init{
    self = [super init];
    if (self) {

[self getSetCity:@"" TheMerchantId:@""];        self.menuViewLayoutMode=WMMenuViewLayoutModeLeft;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeSelected = 14.0;
        self.titleSizeNormal = 14.0;
        self.scrollEnable=YES;
//        self.menuViewContentMargin=20;
        self.itemMargin=20;
//        self.rememberLocation=YES;
//        [self couponController];
        self.automaticallyCalculatesItemWidths=YES;
        self.titleColorSelected=XYRGBAColor(236,59,44, 1);
        self.titleColorNormal=XYRGBAColor(51, 51, 51, 1);
//        [self getSetCity:@"" TheMerchantId:@""];
    }
    return self;
}

-(void)locationManager{
    WeakSelf;
    JXLocationTool *locationTool=[JXLocationTool shar];
    locationTool.Location = ^(XYLocationModel *locationModel) {
        if (locationModel) {
//            定位成功
            [weakSelf lactionCity:locationModel.city];

        }else{
//           定位失败
            [weakSelf getCityList:nil];
        }
    };
    
    
//    [location configLocationManager];
//    location.Location = ^(XYLocationModel *locationModel) {
//        if (locationModel) {
////            定位成功
//            [weakSelf lactionCity:locationModel.city];
//
//        }else{
////           定位失败
//            [weakSelf getCityList:nil];
//        }
//
////
//    };
}


//
-(void)lactionCity:(NSString *)lactionCityTitle{
    //字条串是否包含有某字符串
    if ([lactionCityTitle rangeOfString:@"市"].location == NSNotFound) {
        NSLog(@"string 不存在 martin");
    } else {

        lactionCityTitle=[lactionCityTitle stringByReplacingOccurrencesOfString:@"市"withString:@""];
        NSLog(@"string 包含 martin");
    }
    NSLog(@"%@",lactionCityTitle);
    [self getCityList:lactionCityTitle];
}

//获取城市列表
-(void)getCityList:(NSString *)city{
    WeakSelf;
    [self network:@{} relativePath:kJXAPI_user_commuityList ShowAndDismiss:YES success:^(id responseObject) {
        cityListModel=[JXCityListModel modelWithJSON:responseObject];
        if (city) {
// 成功分两种一种是登录账号一种是没有登录账号
//            登录账号需要调用设置城市接口来获取之前设置的城市
//            未登录要获取当前城市
            if ([XYUserDefaults readAppDlegateOfUser_city]) {
                XYSelectCommuityModel *cityModel=[XYUserDefaults readAppDlegateOfUser_city];
                [weakSelf getSetCity:cityModel.cityId TheMerchantId:cityModel.merchantId];
            }else{
                for (JXValueModel *valueModel in cityListModel.communityList) {
                    //                    NSLog(@"%@",valueModel.value);
                    //
                    for (JXCommunityListModel *communityListModel in valueModel.value) {
                        if ([communityListModel.cityName isEqualToString:city]) {
                            [weakSelf getSetCity:communityListModel.cityId TheMerchantId:communityListModel.theMerchantId];
                            return;
                    
                        }
                    }
                }
            }
        }else{
//            定位失败后的处理
            JXValueModel *valueModel=cityListModel.communityList[0];
            //            NSLog(@"%@",valueModel.value);
            if (valueModel.value.count>0) {
                JXCommunityListModel *model=valueModel.value[0];
                [weakSelf getSetCity:model.cityId TheMerchantId:model.theMerchantId];
            }
        }
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}

//是否设置城市
-(void)getSetCity:(NSString *)cityId TheMerchantId:(NSString *)theMerchantId{
    WeakSelf;
        NSDictionary *dic;
        if ([cityId isEqualToString:@""]) {
            dic=[NSDictionary new];
        }else{
            dic=@{@"cityId":cityId,@"theMerchantId":theMerchantId};
        }
    [self network:dic relativePath:kJXAPI_user_selectCommuity ShowAndDismiss:YES success:^(id responseObject) {
        JXGetSetCityModel *cityModel=[JXGetSetCityModel modelWithJSON:responseObject];
        if ([cityModel.cityId isEqualToString:@""]) {
            [weakSelf locationManager];
        }else{
            [XYUserDefaults writeAppDlegateOfOrderMerchantId:[XYCommon removeNull:responseObject]];
            [weakSelf upshopNumberCartType:@"common" theMerchantId:theMerchantId];
            [weakSelf getHomeChannelData];
            [weakSelf setButtonTitle:cityModel.cityName];
        }
        
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
    
}

//获取购物车数量
-(void)upshopNumberCartType:(NSString*)cartType theMerchantId:(NSString*)theMerchantId{
    [self network:@{@"cartType":cartType,@"theMerchantId":theMerchantId} relativePath:kJXAPI_user_cartCount ShowAndDismiss:YES success:^(id responseObject) {
            NSDictionary * countDict = responseObject;
             if (countDict[@"count"] != nil) {
                 if ([countDict[@"count"] isKindOfClass:[NSString class]]) {
                    [XYUserDefaults writeAppDlegateOfCartCountStr:countDict[@"count"]];
                }else if ([countDict[@"count"] isKindOfClass:[NSNumber class]]){
                    [XYUserDefaults writeAppDlegateOfCartCountStr:[countDict[@"count"] stringValue]];
                }
                [[NSNotificationCenter defaultCenter] postNotificationName:XY_notification_ItemsBadge object:countDict[@"count"]];
             }
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}






-(void)setButtonTitle:(NSString *)title{
    [lifeView.lifeButton setTitle:title forState:(UIControlStateNormal)];

}

- (void)viewDidLoad {
    [super viewDidLoad];
//   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSessionId) name:@"LOGIN_SUCCESS" object:nil];
//    [self getSessionId];
    
    [self homeBaseNaviUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushJump) name:@"pushJump" object:nil];
    [self pushJump];

}




//
//
-(void)pushJump{
    AppDelegate *deleagate=(AppDelegate *)[[UIApplication sharedApplication]delegate];

    if (deleagate.pushJumpDic) {
        NSDictionary *dic=deleagate.pushJumpDic;
        NSString *str = deleagate.pushJumpStr;

//        [self.navigationController popToRootViewControllerAnimated:YES];
//        self.tabBarController.selectedIndex=0;
        if (![[dic valueForKey:@"cityId"] isEqualToString:@"null"]) {
            [self getSetCity:[dic valueForKey:@"cityId"] TheMerchantId:[dic valueForKey:@"merchant"]];
            JXHomeViewController *homeViewController=(JXHomeViewController *)self.currentViewController;
            [homeViewController getHomeAlldata];
        }


        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
            if ([view isKindOfClass:[XYUMSocialShareView class]]) {
                [view hide];
            }
        }

        if ([[dic valueForKey:@"type"] isEqualToString:@"product_detail"]) {
            if (![self.navigationController.topViewController isKindOfClass:[XYGoodsDetailVC class]]) {
                self.tabBarController.selectedIndex=0;
                //        商详
                XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
                detailVC.productId = [ dic valueForKey:@"product_id"];//[NSString stringWithFormat:@"%@%@",BEST_H5_URL,pushUrl];
                [self.navigationController pushViewController:detailVC animated:YES];
            }


        }else if([[dic valueForKey:@"type"] isEqualToString:@"activity"]){
             if (![self.navigationController.topViewController isKindOfClass:[JXActivityPage class]]) {
                 self.tabBarController.selectedIndex=0;
            //                活动
            JXActivityPage * webVC = [[JXActivityPage alloc]init];
            NSMutableString *urlStr = [NSMutableString stringWithFormat:@"&url=%@",[dic valueForKey:@"url"]];
            [str stringByReplacingOccurrencesOfString:urlStr withString:@""];

            webVC.webURLstr = [NSString stringWithFormat:@"%@%@?%@",BEST_H5_URL,[dic valueForKey:@"url"],str];
            NSLog(@"%@",webVC.webURLstr );
            [self.navigationController pushViewController:webVC animated:YES];
             }
        }else if([[dic valueForKey:@"type"] isEqualToString:@"orderapp"]){
            if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
                        [XYCommon setPresentViewControllerWithLoginView];
                return;
            }else{
                NSString *tel=[dic valueForKey:@"tel"];
                NSDictionary *mobile=[XYUserDefaults readUserDefaultsRegistered];
                if ([tel isEqualToString:[mobile valueForKey:@"mobile"]]) {
                    if (![self.navigationController.topViewController isKindOfClass:[JXMyOrderDetailsViewController class]]) {
                        //                唤醒app进入订单详情
                        self.tabBarController.selectedIndex=0;
                        JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
                        myOrderDetailsViewController.orderID = [dic valueForKey:@"orderAliasCode"];
                        [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
                    }
                }else{
                    [YDBAlertView showToast:@"当前订单不存在" dismissDelay:1.0];
                }
            }
        }
    }

}
//
//
-(void)homeBaseNaviUI{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticePushData:) name:XY_notification_notice object:nil];
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage:SETIMAGENAME(@"ic_home_logo")];

    WeakSelf;
    lifeView=[[[NSBundle mainBundle]loadNibNamed:@"JXHomeLifeView" owner:self options:nil] lastObject];
    lifeView.Clock = ^{
        UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //这个字符串是你要跳转面板的名字
        JXCityListViewController *main =[board instantiateViewControllerWithIdentifier:@"JXCityListID"];
        main.SelectCity = ^(JXCommunityListModel *model) {
            [weakSelf setButtonTitle:model.cityName];
            [weakSelf getSetCity:model.cityId TheMerchantId:model.theMerchantId];
//            [weakSelf getHomeChannelData];

            NSLog(@"%@",weakSelf.currentViewController);
            if ([weakSelf.currentViewController isKindOfClass:[JXHomeViewController class]]) {
                JXHomeViewController *homeViewController=(JXHomeViewController *)weakSelf.currentViewController;
                [homeViewController getHomeAlldata];
            }else if([weakSelf.currentViewController isKindOfClass:[JXOtherViewController class]]){
                JXOtherViewController *otherViewController=(JXOtherViewController *)weakSelf.currentViewController;
                [otherViewController.otherTableView.header beginRefreshing];
            }



            //发送一个通知
            [[NSNotificationCenter defaultCenter] postNotificationName:@"cityIDNotification" object:[NSNumber numberWithBool:YES]];
        };
        main.cityListModel=cityListModel;
        [weakSelf.navigationController pushViewController:main animated:YES];

    };
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:lifeView];
    UIBarButtonItem *seachItem=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"ic_new_search") style:(UIBarButtonItemStylePlain) target:self action:@selector(seachClock)];
//    UIBarButtonItem *messageItem=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"nav_btn_imessage") style:(UIBarButtonItemStylePlain) target:self action:@selector(messageClock)];

    UIBarButtonItem *messageItem=[[UIBarButtonItem alloc]initWithCustomView:self.messageButton];


    self.navigationItem.rightBarButtonItems=@[messageItem,seachItem];
}
//
//
-(UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_messageButton addTarget:self action:@selector(messageClock) forControlEvents:(UIControlEventTouchUpInside)];
        _messageButton.frame=CGRectMake(0, 0, 30, 30);
        [_messageButton setImage:SETIMAGENAME(@"nav_btn_imessage") forState:(UIControlStateNormal)];
    }
//     _messageButton.frame=CGRectMake(0, 0, 30, 30);
    return _messageButton;
}
//
//
-(void)seachClock{
    JXSearchHistoryPage *seachPage=[[JXSearchHistoryPage alloc]init];
    [self.navigationController pushViewController:seachPage animated:YES];
}
//
-(void)messageClock{
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }

    XYNotificationCenterWebVC *noteWebVC = [[XYNotificationCenterWebVC alloc] init];

    [self.navigationController pushViewController:noteWebVC animated:YES];
}
//
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


//        [_listArray removeAllObjects];
    if ([XYUserDefaults readUserDefaultsRegistered] == nil) {//未登录状态跳转到登录页面
//        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    [self netMsgUnread];
}
//#pragma mark -
//
- (void)noticePushData:(NSNotification*)noti
{
    if (![[noti object] isKindOfClass:[NSDictionary class]]) {
        return;
    }

    NSDictionary * dict = [noti object];

    NSDictionary * butesdict = [XYCommon removeNull:dict];
    self.notiPushModel = [XYNoticePushModel mj_objectWithKeyValues:butesdict];
    if (self.notiPushModel != nil) {
        [XYNoticePush noticePushWithNoticeModel:self.notiPushModel PushNavi:self];
        self.notiPushModel = nil;
    }
}
//
//#pragma mark - data
///** 消息 红点 */
-(void)netMsgUnread{
    WeakSelf;
    [self network:[NSDictionary new] relativePath:kJXAPI_user_messageUnreadCount ShowAndDismiss:NO  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSString *msgNum = [responseObject objectForKey:@"totalCount"];
        if ([msgNum integerValue] <= 0) {
//             _messageButton.badgeValue=@" ";
            weakSelf.messageButton.badgeValue = @"";
        }else
        {
            weakSelf.messageButton.badgeValue = @" ";
        }
    } failure:^{

    } UnusualFailure:^{

    }];

}

//
-(void)couponController{

    _listArray=[[NSMutableArray alloc]initWithObjects:@{@"1":self.homeViewController}, nil];

}

-(JXHomeViewController *)homeViewController{
    if (!_homeViewController) {
        _homeViewController=[[JXHomeViewController alloc]initWithNibName:@"JXHomeViewController" bundle:nil];
        _homeViewController.type=@"1";
    }

    return _homeViewController;
}
//
//
#pragma mark - WMPageController DataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    if (homeBaseModel.columnList.count<=0) {
        [pageController.menuView removeFromSuperview];
    }

    return homeBaseModel.columnList.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
   JXHomeColumnListModel *model= [homeBaseModel.columnList objectAtIndex:index];
    NSLog(@"%@",model);
    return model.content;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    NSLog(@"%@",_listArray[index]);
    NSDictionary *dic=_listArray[index];
    NSString *key=[dic allKeys][0];
    JXOtherViewController *vc=[dic objectForKey:key];
    vc.type=key;

    return vc;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, 0, self.view.frame.size.width, 37);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY =  37;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}
//
-(void)getHomeChannelData{
    NSNotification *notification =[NSNotification  notificationWithName:@"SwitchCity" object:self userInfo:nil];

    //通过通知中心发送通知

    [[NSNotificationCenter defaultCenter] postNotification:notification];

    [_listArray removeAllObjects];
    homeBaseModel=nil;
    __weak typeof(self)SelfWeek=self;
    [self network:[NSDictionary new] relativePath:kJXAPI_user_Channels ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        homeBaseModel=[JXHomeChannelModel modelWithJSON:responseObject];
//        NSLog(@"%@",[homeBaseModel.columnList objectAtIndex:0]);
        for (int i=0; i<homeBaseModel.columnList.count; i++) {
            JXHomeColumnListModel *Model =homeBaseModel.columnList[i];
            if (i==0) {
                [SelfWeek couponController];
            }else{
                if (Model.linkTo.length==0) {
                    Model.linkTo=@"linkTo";

                }
                JXOtherViewController *vc=[[JXOtherViewController alloc]initWithNibName:@"JXOtherViewController" bundle:nil];
                vc.type=Model.linkTo;
                [_listArray addObject:@{Model.linkTo:vc}];
            }

        }

        SelfWeek.selectIndex=0;
        [SelfWeek reloadData];
    } failure:^{

    } UnusualFailure:^{

    }];
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
