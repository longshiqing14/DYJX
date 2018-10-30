//
//  JXSelectDeliverToShopPage.m
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXSelectDeliverToShopPage.h"
#import "JXSelectDeliverToShopViewModel.h"
#import "JXAddressCell.h"
#import "JXSelectAdressListModel.h"

@class GJOrderingForClientsBrandCell;
@class JXFoodheaderViewModel;

static CGFloat const KSearchFieldHeight = 35;
static CGFloat const KSearchFieldEdge = 10;
@interface JXSelectDeliverToShopPage ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray<JXAdressModel*> *otherArray;
@property (nonatomic) JXSelectDeliverToShopViewModel *viewModel;
@property (nonatomic,strong) UITextField *searchTextField;
@end

static NSString *cellID=@"cellID";

@implementation JXSelectDeliverToShopPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择自提点";
    self.view.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    [self.view addSubview:self.searchTextField];
//    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
//        make.top.mas_equalTo(15);
//        make.height.mas_equalTo(35);
//    }];
    
    [self.view  addSubview:self.otherTableView];
    [self.otherTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.searchTextField.mas_bottom).mas_equalTo(15);
        make.left.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
        
    }];
    
    [self.otherTableView registerNib:[UINib nibWithNibName:@"JXAddressCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    self.otherTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //    [self.viewModel.requestDic setObject:self.type forKey:@"kurl"];
    [self addFooterAndHeader];
    [self getHomelData];

}

- (UITableView *)otherTableView{
    if (!_otherTableView) {
        _otherTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _otherTableView.delegate = self;
        _otherTableView.dataSource = self;
        _otherTableView.showsVerticalScrollIndicator = NO;
        
        
        [_otherTableView setTableFooterView:[UIView new]];
        [_otherTableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        [_otherTableView setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4"]];
    }
    return _otherTableView;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    [self.otherTableView.mj_header beginRefreshing];
    
}

- (void)getHomelData{
    WeakSelf;
    [self.viewModel.requestDic setObject:self.shopID forKey:@"shopId"];
    [self.viewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry) {
        if (doHaveData) {
            
        }else {
             [weakSelf.otherTableView showNoDataCustomTipViewWithText:@"很抱歉，暂无自提地点哦～" imageString:@"pic_noaddress" WithInset:80.];
        }
        weakSelf.otherArray = [dataListArry mutableCopy];
        [weakSelf.otherTableView.mj_header endRefreshing];
        [weakSelf.otherTableView reloadData];
    } failed:^(NSString *errorMsg) {
        [weakSelf.otherTableView.mj_header endRefreshing];
    }];
    
}

- (void)addFooterAndHeader{
    WeakSelf;
    
    
    //    _otherTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    //
    //
    //        [self.viewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData,NSMutableArray<MyOrderModel*> *dataListArry) {
    //            if (doHaveData) {
    //
    //            }else {
    //                //                [weakSelf.extenTableView showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
    //            }
    //            weakSelf.otherArray = [dataListArry mutableCopy];
    //            [weakSelf.otherTableView.mj_header endRefreshing];
    //            [weakSelf.otherTableView reloadData];
    //        } failed:^(NSString *errorMsg) {
    //            [weakSelf.otherTableView.mj_header endRefreshing];
    //        }];
    //    }];
    //
        _otherTableView.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.viewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData,NSMutableArray<JXAdressModel*> *dataListArry) {
    
                if (doHaveData) {
    
                }else {
    
                    [weakSelf.otherTableView showNoDataCustomTipViewWithText:@"很抱歉，暂无自提地点哦～" imageString:@"pic_noaddress" WithInset:80.];
                    [weakSelf.otherTableView.mj_header endRefreshing];
                }
    
                if (isLastPage) {
                    [weakSelf.otherTableView.mj_footer endRefreshingWithNoMoreData];
                }else {
                    [weakSelf.otherTableView.mj_footer endRefreshing];
                }
                weakSelf.otherArray = [dataListArry mutableCopy];
                [weakSelf.otherTableView reloadData];
            } failed:^(NSString *errorMsg) {
                [weakSelf.otherTableView.mj_footer endRefreshing];
            }];
        }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.otherArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 84;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JXAddressCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.TitleLb.text = self.otherArray[indexPath.item].name;
    cell.phoneLb.text = self.otherArray[indexPath.item].phone;
    cell.addressLb.text = self.otherArray[indexPath.item].address;
    if ([[self.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:[self.otherArray[indexPath.item].name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
//        [cell setSelected:YES animated:YES];
        
        
        
        [cell.selectImage setImage:[UIImage imageNamed:@"payment_icon_gx"]];
        [cell.cellImageView setImage:[UIImage imageNamed:@"add_red"]];
        [cell.TitleLb setTextColor:[UIColor colorWithHexString:@"#EC3B2C"]];
    }else{
        [cell.selectImage setImage:[UIImage imageNamed:@""]];
        [cell.cellImageView setImage:[UIImage imageNamed:@"ic_locate_normal"]];
        [cell.TitleLb setTextColor:[UIColor colorWithHexString:@"#333333"]];
    }
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//    XYAddressCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    JXAdressModel *model = [[JXAdressModel alloc]init];
    model.name = self.otherArray[indexPath.item].name;
    model.address = self.otherArray[indexPath.item].address;
    model.shopId = self.otherArray[indexPath.item].shopId;
    model.phone = self.otherArray[indexPath.item].phone;
    if (self.block) {
        self.block(model);
    }
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JXSelectDeliverToShopViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JXSelectDeliverToShopViewModel alloc] init];
    }
    return _viewModel;
}

- (NSMutableArray<JXAdressModel *> *)otherArray{
    if (!_otherArray) {
        _otherArray = [[NSMutableArray alloc] init];
    }
    return _otherArray;
}

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(KSearchFieldEdge, KSearchFieldHeight / 3.0, kScreenWidth - KSearchFieldEdge * 2.0, KSearchFieldHeight)];
//        _searchTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _searchTextField.delegate = self;
        _searchTextField.textAlignment = NSTextAlignmentCenter;
        _searchTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake((kScreenWidth - KSearchFieldEdge * 2.0)/3.8, 0, 35, 35)];
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search"]];
        iconView.center = _searchTextField.leftView.center;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.tintColor = [UIColor colorWithHexString:@"FA5E71"];
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
        _searchTextField.layer.cornerRadius = 4;
        _searchTextField.font = [UIFont systemFontOfSize:13];
        _searchTextField.returnKeyType = UIReturnKeySearch;
        _searchTextField.placeholder = @"请输入地点关键词";
        [_searchTextField.leftView addSubview:iconView];
//        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.top.bottom.mas_equalTo(0);
//        }];
        _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _searchTextField;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if ([YWDTools isNil:textField.text])
    {
        [YDBAlertView showToast:@"请输入关键字"];
    }
    else
    {
        [self goToStoreSearchResultPageWithKeyword:textField.text];
    }
    
    return YES;
}

// 跳转搜索结果页
-(void)goToStoreSearchResultPageWithKeyword:(NSString *)keyWord
{
    [self.viewModel.requestDic setObject:keyWord forKey:@"keyword"];
    [self getHomelData];
    
}


- (void)viewDidDisappear:(BOOL)animated{
    [self.otherTableView.mj_header endRefreshing];
    [self.otherTableView.mj_footer endRefreshing];
}

@end
