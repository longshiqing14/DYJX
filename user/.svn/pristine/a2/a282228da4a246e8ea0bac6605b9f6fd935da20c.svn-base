//
//  JXSearchResultPage.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchResultPage.h"
#import "JXsearchResultViewModel.h"
#import "JXGoodsTableCollectionViewCell.h"
#import "JXGoodsCubeCollectionViewCell.h"
#import "JXGoToShopCartControl.h"
#import "XYShoppingCartNet.h"
#import "JXQueryConditionItemView.h"
#import "JXStyleView.h"
#import "XYGoodsDetailVC.h"

static CGFloat const KSearchFieldHeight = 32;
static CGFloat const KSearchFieldEdge = 60;
static NSString * const KEABAALLGoodsCubeCell = @"cubeCell";
static NSString * const KEABAALLGoodsTableCell = @"tableCell";
@interface JXSearchResultPage ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) UICollectionView *searchResultCollectionView;
@property (nonatomic) UICollectionViewFlowLayout *tableLayout;
@property (nonatomic) UICollectionViewFlowLayout *cubeLayout;
@property (nonatomic) JXsearchResultViewModel *searchResultViewModel;
@property (nonatomic) JXGoToShopCartControl *goShopCartIcon;
@property (nonatomic, strong) JXQueryConditionItemView *conditionItemView;
@property (nonatomic, strong) JXStyleView *styleView;
@property (nonatomic, assign)   BOOL isList;
@end

@implementation JXSearchResultPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isList = YES;
    self.searchTextField.text = self.keyWord;
    if (![YWDTools isNil:self.keyWord]) {
        [self.searchResultViewModel.requestDic setObject:self.keyWord forKey:@"keyword"];
    }
    
    if (![YWDTools isNil:self.columnID]) {
        [self.searchResultViewModel.requestDic setObject:self.columnID forKey:@"columnId"];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - AutoSize(KSearchFieldEdge), KSearchFieldHeight)];
    [self requestData];
    [self initNavigation];
    [self initSubviews];
}

- (void)requestData{
//请求后台数据
//    WeakSelf;
//    [self.searchResultViewModel getSearchReaultGoodsListDataFromSeviceWithPageNumer:1 Success:^(BOOL isLastPage, BOOL doHaveData) {
//
//        if (doHaveData) {
//            [weakSelf.conditionItemView setHidden:NO];
//        }else {
//            [weakSelf.conditionItemView setHidden:YES];
//            [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
//        }
//
//        [weakSelf.searchResultCollectionView reloadData];
//    } failed:^(NSString *errorMsg) {
//
//    }];
    [self.searchResultCollectionView.mj_header beginRefreshing];
}

- (void)initNavigation{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.styleView];
//    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];
}

- (void)initSubviews {
    WeakSelf
    self.navigationItem.titleView = self.searchTextField;
    [self.view addSubview:self.searchResultCollectionView];
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.placeholder = @"请输入商品、品牌名称进行搜索";
    
    [self.view addSubview:self.conditionItemView];
    [self.conditionItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(45);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(self.view);
        }
    }];
    
    [self.searchResultCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(weakSelf.conditionItemView.mas_bottom).mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    
    self.goShopCartIcon = [JXGoToShopCartControl goToShopCartControllerWithCurrentVC:self];
    
}

    


- (void)backToLastPage{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.searchResultViewModel numberOfCell];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *goodsCell = nil;
    if (self.isList) {
        JXGoodsTableCollectionViewCell *tableCell = [collectionView dequeueReusableCellWithReuseIdentifier:KEABAALLGoodsTableCell forIndexPath:indexPath];
    
        [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.searchResultViewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
        tableCell.goodsNameLabel.text = [self.searchResultViewModel goodsName:indexPath];
        tableCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.searchResultViewModel goodsPrice:indexPath]];
    
        tableCell.ShopCartBtnClickBlock = ^(UIButton *btn) {
        [XYShoppingCartNet netCartAddWithProductId:[self.searchResultViewModel productID:indexPath] block:^(NSDictionary *blockDictionary, NSError *error) {
            
        }];
        };
        goodsCell = tableCell;
    }else{
        JXGoodsCubeCollectionViewCell *cubeCell = [collectionView dequeueReusableCellWithReuseIdentifier:KEABAALLGoodsCubeCell forIndexPath:indexPath];
        
        [cubeCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.searchResultViewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        cubeCell.goodsNameLabel.text = [self.searchResultViewModel goodsName:indexPath];
        cubeCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.searchResultViewModel goodsPrice:indexPath]];
        
        cubeCell.ShopCartBtnClickBlock = ^(UIButton *btn) {
            [XYShoppingCartNet netCartAddWithProductId:[self.searchResultViewModel productID:indexPath] block:^(NSDictionary *blockDictionary, NSError *error) {
                if (error == nil) {
                    
                }
            }];
        };
        goodsCell = cubeCell;
    }

        return goodsCell;
}
        
#pragma mark - EABAStoreStyleViewDelegate
- (void)witchStyle:(NSInteger)style
{
    WeakSelf;
    if (self.isList) {
        weakSelf.isList = NO;
        [weakSelf.searchResultCollectionView setCollectionViewLayout:weakSelf.cubeLayout animated:NO];
        [weakSelf.searchResultCollectionView reloadData];
        
    }else{
        weakSelf.isList = YES;
        [weakSelf.searchResultCollectionView setCollectionViewLayout:weakSelf.tableLayout animated:NO];
        [weakSelf.searchResultCollectionView reloadData];
        
        
    }
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId = [self.searchResultViewModel productID:indexPath];
    [self.navigationController pushViewController:detailVC animated:YES];
}


#pragma lazy
- (JXStyleView *)styleView
{
    if (!_styleView) {
        _styleView = [[JXStyleView alloc] init];
        _styleView.delegate = self;

    }
    return _styleView;
}

- (UITextField *)searchTextField {
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - AutoSize(KSearchFieldEdge), KSearchFieldHeight)];
        _searchTextField.delegate = self;
        _searchTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSearchFieldHeight, KSearchFieldHeight)];
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_search"]];
        iconView.center = _searchTextField.leftView.center;
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        _searchTextField.tintColor = [UIColor colorWithHexString:@"FA5E71"];
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"f7f7f7"];
        _searchTextField.layer.cornerRadius = 4;
        _searchTextField.font = [UIFont systemFontOfSize:13];
        [_searchTextField.leftView addSubview:iconView];
        _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _searchTextField;
}

- (UICollectionView *)searchResultCollectionView{
    WeakSelf;
    if (!_searchResultCollectionView) {
        _searchResultCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.tableLayout];
        [_searchResultCollectionView registerClass:[JXGoodsTableCollectionViewCell class] forCellWithReuseIdentifier:KEABAALLGoodsTableCell];
        [_searchResultCollectionView registerClass:[JXGoodsCubeCollectionViewCell class] forCellWithReuseIdentifier:KEABAALLGoodsCubeCell];
        
        _searchResultCollectionView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
        _searchResultCollectionView.delegate = self;
        _searchResultCollectionView.dataSource = self;
        _searchResultCollectionView.scrollEnabled = YES;
        _searchResultCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.searchResultViewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
                
                if (doHaveData) {
                    [weakSelf.conditionItemView setHidden:NO];;
                }else {
                    
                    [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
                }
                [weakSelf.searchResultCollectionView.mj_header endRefreshing];
                [weakSelf.searchResultCollectionView reloadData];
            } failed:^(NSString *errorMsg) {
                [weakSelf.searchResultCollectionView.mj_header endRefreshing];
            }];
            
        }];
        
          _searchResultCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.searchResultViewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
                
                if (doHaveData) {
                    [weakSelf.conditionItemView setHidden:NO];;
                }else {
                    
                    [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
                    [weakSelf.searchResultCollectionView.mj_header endRefreshing];
                }
                
                if (isLastPage) {
                    [weakSelf.searchResultCollectionView.mj_footer endRefreshingWithNoMoreData];
                }else {
                    [weakSelf.searchResultCollectionView.mj_footer endRefreshing];
                }
                [weakSelf.searchResultCollectionView reloadData];
            } failed:^(NSString *errorMsg) {
                [weakSelf.searchResultCollectionView.mj_footer endRefreshing];
            }];
            
        }];
    }
    return _searchResultCollectionView;
}

- (UICollectionViewFlowLayout *)cubeLayout
{
    if (!_cubeLayout) {
        _cubeLayout = [[UICollectionViewFlowLayout alloc] init];
        _cubeLayout.itemSize = CGSizeMake((kScreenWidth - 3) / 2, AutoSize(268));
        _cubeLayout.sectionInset = UIEdgeInsetsMake(3, 0, 3, 0);
        _cubeLayout.minimumInteritemSpacing = 0;
        _cubeLayout.minimumLineSpacing = 3;
    }
    return _cubeLayout;
}
- (UICollectionViewFlowLayout *)tableLayout
{
    if (!_tableLayout) {
        _tableLayout = [[UICollectionViewFlowLayout alloc] init];
        _tableLayout.itemSize = CGSizeMake(kScreenWidth, 116);
        _tableLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableLayout.minimumLineSpacing = 0;
        _tableLayout.minimumInteritemSpacing = 0;
    }
    return _tableLayout;
}

- (JXsearchResultViewModel *)searchResultViewModel{
    if (!_searchResultViewModel) {
        _searchResultViewModel = [[JXsearchResultViewModel alloc] init];
    }
    return _searchResultViewModel;
}

- (JXQueryConditionItemView *)conditionItemView
{
    WeakSelf;
    if (!_conditionItemView) {
        _conditionItemView =  [[JXQueryConditionItemView alloc] initWithFrame:CGRectZero textColor:[UIColor colorWithHexString:@"333333"] font:[UIFont systemFontOfSize:13] selectedTextColor:[UIColor colorWithHexString:@"#FA5E71"] block:^(NSInteger selectedItemIdex, EABAItemArrowType arrowType) {
            if (selectedItemIdex == 0) {
                [self.searchResultViewModel.requestDic setObject:@"" forKey:@"orderBy"];
                    [weakSelf requestData];
            } else if (selectedItemIdex == 1) {
                    [self.searchResultViewModel.requestDic setObject:@"saleCount" forKey:@"orderBy"];
//                    [weakSelf.subSupplierHomeShopViewModel assignPagenum:1];
//                    [weakSelf.subSupplierHomeShopViewModel assignOrder:@"3"];
                    [weakSelf requestData];
            } else if (selectedItemIdex == 2) {
                if (arrowType == EABAItemArrowUp) {
                    [self.searchResultViewModel.requestDic setObject:@"priceLow" forKey:@"orderBy"];
                    [weakSelf requestData];
                } else if (arrowType == EABAItemArrowDown) {
                    [self.searchResultViewModel.requestDic setObject:@"priceHigh" forKey:@"orderBy"];
                    //                    [weakSelf.subSupplierHomeShopViewModel assignPagenum:1];
                    [weakSelf requestData];
                }
            }
        }];
        _conditionItemView.backgroundColor = [UIColor whiteColor];
        [_conditionItemView insertItemWithTitle:@"综合" showArrow:NO];
        [_conditionItemView insertItemWithTitle:@"销量" showArrow:NO];
        [_conditionItemView insertItemWithTitle:@"价格" showArrow:YES];
//        [_conditionItemView setBorderWithColor:[UIColor colorWithHexString:@"#D8D8D8"] thickness:0.5 in:UIViewBorderPositionTop edgeInserts:UIEdgeInsetsZero];
//        [_conditionItemView setBorderWithColor:[UIColor colorWithHexString:@"#D8D8D8"] thickness:0.5 in:UIViewBorderPositionBottom edgeInserts:UIEdgeInsetsZero];
    }
    return _conditionItemView;
}

- (void)textFieldDidChange:(UITextField*)sender{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.navigationController popViewControllerAnimated:NO];
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
