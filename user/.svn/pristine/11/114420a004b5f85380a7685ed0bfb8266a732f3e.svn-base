//
//  XYMineAboutUsVC.m
//  user
//
//  Created by xingyun on 2017/10/18.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineAboutUsVC.h"
#import "UpdateVersionModel.h"

@interface XYMineAboutUsVC ()

@property (nonatomic, strong) UIImageView * iconImageView;
/** 说明 */
@property (nonatomic, strong) UILabel * explainLB;
/** 应用名 */
@property (nonatomic, strong) UILabel * nameLB;
/** 版本 */
@property (nonatomic, strong) UILabel * titleLB;
/** 版权 */
@property (nonatomic, strong) UILabel *  copyrightLB;
/** 版权 信息 */
@property (nonatomic, strong) UILabel *  copyrightTitleLB;
/** 升级最新版本 */
@property (nonatomic, strong) UIButton *GoToAppStoreBtn;
@end

@implementation XYMineAboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = XYGlobalBg;


    [self addViewAndLayout];
    
    [self updateViewData];
    
    [self CheckAndUpgradeVersion];
}


- (void)updateViewData
{
    
    NSString * version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSString * build = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    NSString * debugOruat ;
    
    if ([BEST_URL hasPrefix:@"http://bisdevapi"]) {
        debugOruat = @"dev";
    }else if ([BEST_URL hasPrefix:@"http://bisuatapi"]){
        debugOruat = @"uat";
    }else if ([BEST_URL hasPrefix:@"https://bisapi"]){
        debugOruat = @"";
    }
    
    self.explainLB.text = @"小朋精选以“居家生活少花钱”为品牌理念,为用户提供好商品.好价格.好服务,和你一起为美好生活努力。";
    
    self.titleLB.text = [NSString stringWithFormat:@"v %@  build %@  %@",version,build,debugOruat];
    
    self.nameLB.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    
    self.copyrightLB.text = @"Copyright@2017-2024";
    
    self.copyrightTitleLB.text = @"深圳市小朋互联科技信息有限公司";
}





/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.iconImageView];
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.centerX.mas_equalTo(supperView.mas_centerX);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(120);
    }];

    
    [self.view addSubview:self.nameLB];
    [self.nameLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(20);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    
    [self.view addSubview:self.explainLB];
    [self.explainLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLB.mas_bottom).offset(20);
        make.left.mas_equalTo(XY_Left_Margin*2);
        make.right.mas_equalTo(XY_Right_Margin*2);
    }];
    
    
    [self.view addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_explainLB.mas_bottom).offset(18);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    

    
    [self.view addSubview:self.copyrightTitleLB];
    [self.copyrightTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-44);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    
    [self.view addSubview:self.copyrightLB];
    [self.copyrightLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_copyrightTitleLB.mas_top).offset(-5);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
}







#pragma mark - 懒加载

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
        
        
        _iconImageView.image = [UIImage imageNamed:@"aboutus_logo"];
    }
    return _iconImageView;
}

- (UILabel*)explainLB
{
    if (_explainLB == nil) {
        
        _explainLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _explainLB.textAlignment = NSTextAlignmentCenter;
        _explainLB.textColor = XYFontTitleColor;
        _explainLB.font = XYFont_14;
        
        _explainLB.numberOfLines = 0;
    }
    
    return _explainLB;
}

- (UILabel*)nameLB
{
    if (_nameLB == nil) {
        
        _nameLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _nameLB.textAlignment = NSTextAlignmentCenter;
        _nameLB.textColor = XYFontTitleColor;
        _nameLB.font = XYFont_16;
    }
    
    return _nameLB;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
    
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        _titleLB.font = XYFont_16;
    }
    
    return _titleLB;
}

- (UILabel*)copyrightLB
{
    if (_copyrightLB == nil) {
        
        _copyrightLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _copyrightLB.textAlignment = NSTextAlignmentCenter;
        _copyrightLB.textColor = XYGrayColor;
        _copyrightLB.font = XYFont_12;
    }
    
    return _copyrightLB;
}

- (UILabel*)copyrightTitleLB
{
    if (_copyrightTitleLB == nil) {
        
        _copyrightTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _copyrightTitleLB.textAlignment = NSTextAlignmentCenter;
        _copyrightTitleLB.textColor = XYGrayColor;
        _copyrightTitleLB.font = XYFont_12;
    }
    
    return _copyrightTitleLB;
}

- (void)CheckAndUpgradeVersion{
    /**获取程序的版本号*/
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSMutableDictionary *requestDic = [NSMutableDictionary dictionary];
    
    //    requestDic[@"App_ID"] = App_ID;// 程序的apple ID号
    requestDic[@"appType"] = @"1";
    requestDic[@"os"] = @"ios";
    requestDic[@"appCode"] = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSMutableDictionary * dict = [XYBestRequest requestAllDataWithApi_ID:kJXAPI_user_infrastructureCheckUpdate request_data:requestDic];
    
    [XYNetWorking XYPOST:@"" params:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [XYProgressHUD svHUDDismiss];
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            if ([[responseObject objectForKey:RETURN_CODE_] isEqualToString:ERROR_NUM_STRING_] ) {
                
                UpdateVersionModel *model = [UpdateVersionModel modelWithJSON: [responseObject objectForKey:RETURN_DATA_]];
                if ([model.update isEqualToString:@"0"]) {
                    return ;
                }else{
                    [self.view addSubview:self.GoToAppStoreBtn];
                    [self.GoToAppStoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.mas_equalTo(0);
                    make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(25);
                        make.size.mas_equalTo(CGSizeMake(140, 38));
                    }];
                    
                }
 
                
            }else{
                
                [YDBAlertView showToast:[responseObject objectForKey:RETURN_DESC_] dismissDelay:1.0];

            }
            
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

        }
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];

    }];
}

-(UIButton *)GoToAppStoreBtn
{
    if (!_GoToAppStoreBtn) {
        _GoToAppStoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_GoToAppStoreBtn setTitle:@"升级最新版本" forState:UIControlStateNormal];
        _GoToAppStoreBtn.titleLabel.font = XYFont_14;
        [_GoToAppStoreBtn setTitleColor:[UIColor colorWithHexString:@"#EC3B2C"] forState:UIControlStateNormal];
        [_GoToAppStoreBtn setBackgroundColor:XYGlobalBg];
        _GoToAppStoreBtn.layer.cornerRadius = 5;
        _GoToAppStoreBtn.layer.masksToBounds = YES;
        _GoToAppStoreBtn.layer.borderWidth = 1.0;
         _GoToAppStoreBtn.layer.borderColor = [UIColor colorWithHexString:@"#EC3B2C"].CGColor;
        [_GoToAppStoreBtn addTarget:self action:@selector(GoToAppStore:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _GoToAppStoreBtn;
}

- (void)GoToAppStore:(UIButton*)button{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/jie-zou-da-shi/id1308191405?mt=8"]];
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
