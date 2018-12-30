//
//  DYJXConversionPage.m
//  user
//
//  Created by 岩  熊 on 2018/11/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXConversionPage.h"
#import "NaviViewController.h"
#import "DYJXIdentitySwitchingPage.h"
#import "AppDelegate.h"
#import "DYJXConversionViewModel.h"
#import "DYJXIdentitySwitchingCell.h"

@interface DYJXConversionPage ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)DYJXConversionViewModel *viewModel;
@end

static NSString *cellID=@"cellID";
@implementation DYJXConversionPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"最近会话";
    [self initNavigation];
    [self initSubViews];
    [self getConversionData];
}

- (void)getConversionData{
    NSString *certificateId = [XYUserDefaults readAppDlegateOfCertificateId];
    [self.viewModel.requestDic setObject:certificateId forKey:@"CertificateId"];
    [self.viewModel getMyConversionDataSuccess:^{
        
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (void)initNavigation{
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F2A73B"],
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    
    UIImage *image = [UIImage imageNamed:@"btn_home"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    
    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [iconImage setContentMode:UIViewContentModeScaleAspectFill];
    iconImage.clipsToBounds = YES;
    [iconImage setImageWithURL:[NSURL URLWithString:self.iconUrl] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.navigationItem.rightBarButtonItem.width = 30;
    
    UIView *rightCustomView = [[UIView alloc] initWithFrame: iconImage.frame];
    [rightCustomView addGestureRecognizer:self.tapGestureRecognizer];
    [rightCustomView addSubview: iconImage];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightCustomView];
}

- (void)initSubViews{
    _searchTextField.delegate = self;
    _searchTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search"]];
    iconView.center = _searchTextField.leftView.center;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    _searchTextField.tintColor = [UIColor colorWithHexString:@"FA5E71"];
//    _searchTextField.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
    _searchTextField.layer.cornerRadius = 5;
    _searchTextField.font = [UIFont systemFontOfSize:13];
    [_searchTextField.leftView addSubview:iconView];
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.tableView registerClass:[DYJXIdentitySwitchingCell class] forCellReuseIdentifier:cellID];
//    [self.tableView registerClass:[DYJXIdentitySwitchingHeader class] forHeaderFooterViewReuseIdentifier:@"headerID"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setBackgroundColor:[UIColor colorWithHexString:@"FFFFFF"]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel numberOfCell];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DYJXIdentitySwitchingCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[[self.viewModel iconImageUrl:indexPath] XYImageURL]] placeholderImage:[UIImage imageNamed:@"btn_group"]];
    
    tableCell.goodsNameLabel.text = [self.viewModel GroupName:indexPath];
    tableCell.sellingPointLable.text = [self.viewModel GroupNumberString:indexPath];
    tableCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return tableCell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 60;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    DYJXIdentitySwitchingHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
//    if (header == nil) {
//        header = [[DYJXIdentitySwitchingHeader alloc] initWithReuseIdentifier:headerID];
//    }
//
//    [header.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.viewModel sectionHeadericonImageUrl:section]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    header.goodsNameLabel.text = [self.viewModel sectionHeaderGroupName:section];
//    header.sellingPointLable.text = [self.viewModel sectionHeaderGroupNumberString:section];
//    return header;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    self.selectedIdentity = [self.viewModel IdentityAtIndexPath:indexPath];
    
}



- (void)black_controller{
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goBackPage)];
    }
    return _tapGestureRecognizer;
}

- (void)goBackPage{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    XYKeyWindow.rootViewController = appDelegate.rootViewController;
    [appDelegate.rootViewController.navigationController popViewControllerAnimated:YES];

}

- (DYJXConversionViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[DYJXConversionViewModel alloc]init];
    }
    return _viewModel;
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
