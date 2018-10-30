//
//  JXClassificationFoldPage.m
//  user
//
//  Created by 岩  熊 on 2017/12/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXClassificationFoldPage.h"
#import "JXClassificationCell.h"
#import "JXClassificationTableHeader.h"


#import "JXClassificationCollectionCell.h"
#import "JXGoodsCubeCollectionViewCell.h"
#import "JXGoToShopCartControl.h"
#import "XYShoppingCartNet.h"
#import "XYGoodsDetailVC.h"
#import "JXClassificationViewModel.h"
#import "XYQRCodePushCommon.h"
#import "JXSearchHistoryPage.h"
#import "JXClassificationTitleListModel.h"

static CGFloat const KSearchFieldHeight = 32;
static CGFloat const KSearchFieldEdge = 60;
static NSString * const KEABAALLGoodsCubeCell = @"cubeCell";
static NSString * const KEABAALLGoodsTableCell = @"tableCell";

@interface JXClassificationFoldPage ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
{
    NSDictionary *_provinceDic;
    NSMutableArray *_isExpandArray;//记录section是否展开
}
@property (nonatomic, strong)UITableView *leftTableView;
@property (nonatomic,strong) UIButton *scanBtn;
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) UICollectionView *searchResultCollectionView;
@property (nonatomic) UICollectionViewFlowLayout *tableLayout;
@property (nonatomic) UICollectionViewFlowLayout *cubeLayout;
@property (nonatomic) JXClassificationViewModel *searchResultViewModel;
@property (nonatomic, assign)   BOOL isList;
@property (nonatomic, strong) NSArray<JXClassificationSecondTitleListModel*> *titleArray;
@property (nonatomic, assign) NSInteger selectSectionIndex;
@end

@implementation JXClassificationFoldPage

- (void)viewDidLoad {
    [super viewDidLoad];
    _isExpandArray = [[NSMutableArray alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(switchCity)name:@"SwitchCity" object:nil];

    [self getProvinceDataFromList];
    
    self.isList = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    [self requestData];
    [self initNavigation];
    [self initSubviews];
}

-(void)switchCity{
    [self updateExpandArray];
    self.selectSectionIndex = 0;
    [self getProvinceDataFromList];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.selectSectionIndex = 0;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

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
//    [self.searchResultCollectionView.mj_header beginRefreshing];
}

- (void)initNavigation{
   self.navigationItem.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - AutoSize(KSearchFieldEdge), KSearchFieldHeight)];
   self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.scanBtn];
}

- (void)initSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.searchTextField;
    
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.searchTextField.returnKeyType = UIReturnKeySearch;
    self.searchTextField.placeholder = @"请输入商品、品牌名称进行搜索";
    
    [self.view addSubview:self.leftTableView];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.view);
        make.width.mas_equalTo(108);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
        
    }];
    
    [self.view addSubview:self.searchResultCollectionView];
    [self.searchResultCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftTableView.mas_right);
        make.right.top.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
    
    
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
        JXClassificationCollectionCell *tableCell = [collectionView dequeueReusableCellWithReuseIdentifier:KEABAALLGoodsTableCell forIndexPath:indexPath];
        
        [tableCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.searchResultViewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        tableCell.goodsNameLabel.text = [self.searchResultViewModel goodsName:indexPath];
        tableCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.searchResultViewModel goodsPrice:indexPath]];
        [tableCell setDataArray:[NSMutableArray arrayWithArray:[self.searchResultViewModel goodsLable:indexPath]]];
        NSLog(@"%@",tableCell.dataArray);
        //        [tableCell.tagCollectionView addTags:[self.searchResultViewModel goodsLable:indexPath]];
        tableCell.ShopCartBtnClickBlock = ^(UIButton *btn) {
            __block NSError *Error = nil;
            [XYShoppingCartNet netCartAddWithProductId:[self.searchResultViewModel productID:indexPath] block:^(NSDictionary *blockDictionary, NSError *error) {
                if (error == nil) {
                    
                }
                Error = error;
            }];
            return Error;
        };
        
        goodsCell = tableCell;
    }else{
        JXGoodsCubeCollectionViewCell *cubeCell = [collectionView dequeueReusableCellWithReuseIdentifier:KEABAALLGoodsCubeCell forIndexPath:indexPath];
        
        [cubeCell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[self.searchResultViewModel goodsImageUrl:indexPath]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        cubeCell.goodsNameLabel.text = [self.searchResultViewModel goodsName:indexPath];
        cubeCell.goodsPriceLabel.text = [NSString stringWithFormat:@"¥ %@", [self.searchResultViewModel goodsPrice:indexPath]];
        //        [cubeCell.tagCollectionView removeAllTags];
        //        [cubeCell.tagCollectionView addTags:[self.searchResultViewModel goodsLable:indexPath]];
        //        cubeCell.dataArray = [[self.searchResultViewModel goodsLable:indexPath] mutableCopy];
        [cubeCell setDataArray:[NSMutableArray arrayWithArray:[self.searchResultViewModel goodsLable:indexPath]]];
        cubeCell.ShopCartBtnClickBlock = ^(UIButton *btn) {
           __block NSError *Error = nil;
            [XYShoppingCartNet netCartAddWithProductId:[self.searchResultViewModel productID:indexPath] block:^(NSDictionary *blockDictionary, NSError *error) {
                if (error == nil) {
                    
                }
               Error = error;
            }];
           return Error;
        };
        goodsCell = cubeCell;
    }
    
    return goodsCell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId = [self.searchResultViewModel productID:indexPath];
    [self.navigationController pushViewController:detailVC animated:YES];
}


#pragma lazy

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

- (NSArray<JXClassificationSecondTitleListModel *> *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}

- (UICollectionView *)searchResultCollectionView{
    WeakSelf;
    if (!_searchResultCollectionView) {
        _searchResultCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.tableLayout];
        [_searchResultCollectionView registerClass:[JXClassificationCollectionCell class] forCellWithReuseIdentifier:KEABAALLGoodsTableCell];
        [_searchResultCollectionView registerClass:[JXGoodsCubeCollectionViewCell class] forCellWithReuseIdentifier:KEABAALLGoodsCubeCell];
        
        _searchResultCollectionView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
        _searchResultCollectionView.delegate = self;
        _searchResultCollectionView.dataSource = self;
        _searchResultCollectionView.scrollEnabled = YES;
//        _searchResultCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [weakSelf.searchResultViewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
//
//                if (doHaveData) {
//
//                }else {
//
//                    [weakSelf.view showNoDataCustomTipViewWithText:@"找不到相关商品" imageString:@"no_search" WithInset:80.];
//                }
//                [weakSelf.searchResultCollectionView.mj_header endRefreshing];
//                [weakSelf.searchResultCollectionView reloadData];
//            } failed:^(NSString *errorMsg) {
//                [weakSelf.searchResultCollectionView.mj_header endRefreshing];
//            }];
//
//        }];
        
        _searchResultCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.searchResultViewModel loadMoreDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
                
                if (doHaveData) {

                        [weakSelf.searchResultCollectionView hideNoNetWorkData];

                    
                }else {
                    [weakSelf.searchResultCollectionView showNoNetWorkData:@"no_search" HintContent:@"找不到相关商品"];
                    
                    [weakSelf.searchResultCollectionView.mj_footer endRefreshing];
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

- (UIButton*)scanBtn
{
    if (_scanBtn == nil) {
        _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _scanBtn.frame = CGRectMake(0, 0, 40, 20);
        _scanBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
        [_scanBtn setImage:[UIImage imageNamed:@"nav_btn_ewm"] forState:UIControlStateNormal];
        [_scanBtn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanBtn;
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
        _tableLayout.itemSize = CGSizeMake(kScreenWidth - 98, 113);
        _tableLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableLayout.minimumLineSpacing = 0;
        _tableLayout.minimumInteritemSpacing = 0;
    }
    return _tableLayout;
}

- (JXClassificationViewModel *)searchResultViewModel{
    if (!_searchResultViewModel) {
        _searchResultViewModel = [[JXClassificationViewModel alloc] init];
    }
    return _searchResultViewModel;
}



- (void)textFieldDidChange:(UITextField*)sender{
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    JXSearchHistoryPage * searchHistoryPage = [[JXSearchHistoryPage alloc]init];
    [self.navigationController pushViewController:searchHistoryPage animated:NO];
}

- (void)leftClick:(UIButton*)sender
{
    [XYQRCodePushCommon pushToQRCodeTarget:self];
}

- (void)getProvinceDataFromList{
    WeakSelf;
    [self.searchResultViewModel getClassificationTitleListDataFromSeviceSuccess:^(BOOL isLastPage, BOOL doHaveData) {
        [weakSelf initExpandArray];
        [weakSelf.leftTableView reloadData];
//            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.leftTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:(UITableViewScrollPositionNone)];
        weakSelf.titleArray = [weakSelf.searchResultViewModel JXClassificationTitleList];
        if (weakSelf.titleArray.count == 0) {
            return ;
        }
        [weakSelf.searchResultViewModel.requestDic setObject:weakSelf.titleArray[0].ID forKey:@"columnId"];
        [weakSelf getRightCollectionData];
    } failed:^(NSString *errorMsg) {
        
    }];
    
}

- (void) initExpandArray{
    for (NSInteger i = 0; i < [self.searchResultViewModel JXClassificationTitleList].count; i++) {
        if (i == 0) {
            [_isExpandArray addObject:@"1"];//0:没展开 1:展开

        }else{
            [_isExpandArray addObject:@"0"];//0:没展开 1:展开

        }
    }
}

- (void) updateExpandArray{
    
    [_isExpandArray removeAllObjects];
    for (NSInteger i = 0; i < [self.searchResultViewModel JXClassificationTitleList].count; i++) {
        [_isExpandArray addObject:@"0"];//0:没展开 1:展开
    }
}

- (void)getRightCollectionData{
    WeakSelf;
    
    [self.searchResultCollectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    
    [weakSelf.searchResultViewModel refreshDataSuccess:^(BOOL isLastPage,BOOL doHaveData) {
        if (doHaveData) {
            
            
            [weakSelf.searchResultCollectionView hideNoNetWorkData];
            
            
        }else {
            [weakSelf.searchResultCollectionView showNoNetWorkData:@"no_search" HintContent:@"找不到相关商品"];
        }
        [weakSelf.searchResultCollectionView reloadData];
        
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (UITableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.showsVerticalScrollIndicator = NO;
        [_leftTableView registerNib:[UINib nibWithNibName:@"JXClassificationCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
        [_leftTableView registerNib:[UINib nibWithNibName:@"JXClassificationTableHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"headerID"];
        [_leftTableView setTableFooterView:[UIView new]];
        [_leftTableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        [_leftTableView setBackgroundColor:[UIColor colorWithHexString:@"f4f4f4"]];
    }
    return _leftTableView;
}

#pragma -- mark tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.searchResultViewModel numberSectionOfTableCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        if ([_isExpandArray[section] isEqualToString:@"0"]) {
    //未展开
            return 0;
        }else{
    //展开
            return [self.searchResultViewModel numberRowsOfTableSection:section];

        }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 41.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 31.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//    JXClassificationTableHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerID"];
    
    
    JXClassificationTableHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerID"];
    if(!header) {
        header = [[JXClassificationTableHeader alloc] initWithReuseIdentifier:@"headerID"];
    }
    
    
    if (section != self.selectSectionIndex ) {
        header.contentView.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        header.titleLb.textColor = [UIColor colorWithHexString:@"333333"];
    }else{
        header.contentView.backgroundColor = [UIColor colorWithHexString:@"EC3B2C"];
        header.titleLb.textColor = [UIColor colorWithHexString:@"FFFFFF"];
    }
    
    
    if (section != self.selectSectionIndex && [_isExpandArray[section] isEqualToString:@"0"]) {

        [header.headerImage setImage:[UIImage imageNamed:@"ic_category_close"]];
        
        
    }else if (section == self.selectSectionIndex && [_isExpandArray[section] isEqualToString:@"0"]){
        
        [header.headerImage setImage:[UIImage imageNamed:@"ic_category_white"]];
        
    }else{
        
        [header.headerImage setImage:[UIImage imageNamed:@"ic_category_open"]];
    
    }
    
    
    header.titleLb.text = [self.searchResultViewModel titleName:section];
    [self addTableViewHeaderTapActionWithSection:section header:header];
    if ([self.searchResultViewModel JXClassificationTitleList][section].children.count>0) {
        header.headerImage.hidden = NO;
    }else{
        header.headerImage.hidden = YES;
    }
    return header;
}

- (void)addTableViewHeaderTapActionWithSection:(NSInteger)section header:(UITableViewHeaderFooterView*)header{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    [header addGestureRecognizer:tap];
    header.tag = section;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JXClassificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];

    cell.titleLb.text = [self.searchResultViewModel ChildrentitleName:indexPath];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.searchResultViewModel.requestDic setObject:self.titleArray[indexPath.section].children[indexPath.row].ID forKey:@"columnId"];
    [tableView scrollToRow:indexPath.row inSection:indexPath.section atScrollPosition:(UITableViewScrollPositionMiddle) animated:YES];
    [self getRightCollectionData];
    
}
- (void)tapAction:(UITapGestureRecognizer *)tap{
    WeakSelf;
    self.selectSectionIndex = tap.view.tag;
//    if (self.titleArray[tap.view.tag].children.count <= 0) {
        [self.searchResultViewModel.requestDic setObject:self.titleArray[tap.view.tag].ID forKey:@"columnId"];
//        [self updateExpandArray];
//        [_isExpandArray removeObjectAtIndex:tap.view.tag];
//        [_isExpandArray insertObject:@"1" atIndex:tap.view.tag];
        [self getRightCollectionData];
//    }else{
    
        if ([_isExpandArray[tap.view.tag] isEqualToString:@"0"]) {
            //关闭 => 展开
            [self updateExpandArray];
            [_isExpandArray removeObjectAtIndex:tap.view.tag];
            [_isExpandArray insertObject:@"1" atIndex:tap.view.tag];
            
        }else{
            //展开 => 关闭
            [self updateExpandArray];
            [_isExpandArray removeObjectAtIndex:tap.view.tag];
            [_isExpandArray insertObject:@"0" atIndex:tap.view.tag];
        }
        
//    }
    
     [self.leftTableView reloadData];
    [self.leftTableView layoutIfNeeded];

     CGRect rect = [weakSelf.leftTableView rectForHeaderInSection:weakSelf.selectSectionIndex];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [weakSelf.leftTableView scrollRectToVisible:rect animated:YES];
       
    });
   
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint touchPoint = [touch locationInView:self.leftTableView];
//    //touchPoint.x ，touchPoint.y 就是触点的坐标。
//    if (CGRectContainsPoint(CGRectMake(0,0,kScreenWidth, kScreenHeight), touchPoint)) {
//        if (touchPoint.y >= kScreenHeight/2.0) {
//            [self.leftTableView scrollToBottom];
//        }else{
//            [self.leftTableView scrollToTop];
//        }
//    }
//}
@end
