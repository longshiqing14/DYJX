//
//  DYJXComparePage.m
//  user
//
//  Created by longshiqing on 2019/1/29.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import "DYJXComparePage.h"
#import "JSExtension.h"
#import "XYNetWorking.h"
#import "XYAppDotNetAPIClient.h"
#import "XYBestAllNet.h"
#import "GSCCListCompareItem.h"
#import "CompareHeadView.h"


@interface DYJXComparePage ()

@property (nonatomic, strong)NSMutableArray <GSCCListCompareItem *> *listArray;
@property (nonatomic, strong)NSMutableArray <NSString *> *classes;

@property (nonatomic, strong)CompareHeadView *headView;

@end

@implementation DYJXComparePage

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    [self getCompareData];

    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self baseUI];

    self.navigationItem.title = @"比价";

    [self.view addSubview:self.headView];

    self.menuViewStyle = WMMenuViewStyleLine;
    self.automaticallyCalculatesItemWidths = YES;
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

-(void)loadData {
    if (self.headView.textField.text.length) {
        NSMutableArray *titles = [[NSMutableArray alloc] init];
        NSMutableArray *vcClasses = [[NSMutableArray alloc] init];
        for (GSCCListCompareItem *item in self.listArray) {
            [titles addObject:item.Name];
            NSString *url = [NSString stringWithFormat:@"%@",item.Link];
            NSString *changeString = [url stringByReplacingOccurrencesOfString:@"[KEYWORD]" withString:self.headView.textField.text];
            [vcClasses addObject:changeString];
        }
        self.titles = titles;
        self.classes = vcClasses;
        self.progressWidth = kScreenWidth/titles.count;
        self.progressViewIsNaughty = YES;
        self.preloadPolicy = WMPageControllerPreloadPolicyNear;
        self.progressHeight = 2.0;

        [self reloadData];
    }
    else {
        NSMutableArray *titles = [[NSMutableArray alloc] init];
        NSMutableArray *vcClasses = [[NSMutableArray alloc] init];
        for (GSCCListCompareItem *item in self.listArray) {
            [titles addObject:item.Name];
            [vcClasses addObject:item.Link];
        }
        self.titles = titles;
        self.classes = vcClasses;
        self.progressWidth = kScreenWidth/titles.count;
        self.progressViewIsNaughty = YES;
        self.preloadPolicy = WMPageControllerPreloadPolicyNear;
        self.progressHeight = 2.0;

        [self reloadData];
    }
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (self.classes[index]) {
        MyWebPage *page = [[MyWebPage alloc] init];
        page.url = self.classes[index];
        return page;
    }
    return [[UIViewController alloc] init];
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        menuView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
//        return CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
//    }
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, 64, self.view.frame.size.width - 2*leftMargin, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
//    if (self.menuViewPosition == WMMenuViewPositionBottom) {
//        return CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 44);
//    }
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    if (self.menuViewStyle == WMMenuViewStyleTriangle) {
//        originY += self.redView.frame.size.height;
    }
    return CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - originY);
}

#pragma mark - Action
-(void)searchClick {
    [self.view endEditing:YES];
    [self loadData];
}
-(void)black_controller{

    [self.navigationController popViewControllerAnimated:YES];
}



- (void)getCompareData {
    WeakSelf;
    //    [XYProgressHUD show];
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc] init];
    [requestDic setValue:[[JSExtension shared] myClientId] forKey:@"ClientId"];
    [requestDic setValue:[UserManager shared].getUserModel.MemberID forKey:@"MemberID"];
    [requestDic setValue:[UserManager shared].getUserModel.UserID forKey:@"UserID"];
    [requestDic setValue:[[JSExtension shared] myIdentityId] forKey:@"CertificateId"];
    [requestDic setValue:@"iOS" forKey:@"Device"];
    [requestDic setValue:[UserManager shared].login.ObjResult forKey:@"DeviceToken"];

    AFHTTPSessionManager *manager = [XYNetWorking managerWithBaseURL:nil sessionConfiguration:NO];
    manager.requestSerializer.timeoutInterval = 60.f;
//    NSLog(@"%@",[NSString stringWithFormat:@"\n url:%@ -----\n"]);
    [manager POST:[BEST_COMPARA stringByAppendingString:@"CompareIndex"] parameters:requestDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"ListCompareItem"]) {
            self.listArray = [[NSArray modelArrayWithClass:[GSCCListCompareItem class] json:[responseObject objectForKey:@"ListCompareItem"]] mutableCopy];
            [self loadData];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


-(NSMutableArray<GSCCListCompareItem *> *)listArray {
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}
-(CompareHeadView *)headView {
    if (!_headView) {
        _headView = [[CompareHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        _headView.textField.placeholder = @"输入...";
        [_headView.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
@end
