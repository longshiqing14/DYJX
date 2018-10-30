//
//  JXSearchHistoryPage.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchHistoryPage.h"
#import "JXSearchResultPage.h"
#import "JXSearchHistoryViewModel.h"
#import "JXMaximumInteritemSpacingFlowLayout.h"
#import "JXSearchHistoryCollectionReusableFooterView.h"
#import "JXSearchHistoryCollectionReusableHeaderView.h"
#import "JXSearchHistoryCollectionViewCell.h"
#import "JXSearchHistoryHotCollectionReusableHeaderView.h"

static CGFloat const KSearchFieldHeight = 32;
static CGFloat const KSearchFieldEdge = 60;
static NSString * const KEABASearchCell = @"searchCell";

@interface JXSearchHistoryPage ()<UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionReusableHeaderViewButtonDelegate>

@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) JXSearchHistoryViewModel *searchViewModel;
//@property (nonatomic,assign) KEABASearchType searchType;
@property (nonatomic,strong) UICollectionView *searchCollectionView;
@property (nonatomic,strong) NSMutableArray *searchData;
@property (nonatomic) CGFloat maximumInteritemSpacing;

@end


static NSString *searchHeader=@"searchHeader";
@implementation JXSearchHistoryPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self. maximumInteritemSpacing = 15.f;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - AutoSize(KSearchFieldEdge), KSearchFieldHeight)];
    
    [self.searchCollectionView registerClass:[JXSearchHistoryCollectionReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:searchHeader];
    
    [self.searchCollectionView registerClass:[JXSearchHistoryHotCollectionReusableHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hotSearchHeader"];
    
    [self.searchCollectionView registerClass:[JXSearchHistoryCollectionViewCell class] forCellWithReuseIdentifier:@"searchCollectionViewCell"];
    
    //读取用户历史记录
    self.searchData = [[self readNSUserDefaults] mutableCopy];
    [self requestData];
    [self initNavigation];
    [self initSubviews];
}

- (void)requestData{
    //请求后台数据
    WeakSelf;
    [self.searchViewModel getSearchReaultGoodsListDataFromSeviceWithPageNumer:1 Success:^(BOOL isLastPage, BOOL doHaveData) {
        [weakSelf.searchCollectionView reloadData];
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.searchTextField becomeFirstResponder];

}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.searchData = [[self readNSUserDefaults] mutableCopy];
    
    [self.searchCollectionView reloadData];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchTextField resignFirstResponder];
    
}

- (void)initNavigation{
    UIButton *rightBarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightBarButton addTarget:self action:@selector(backToLastPage) forControlEvents:UIControlEventTouchUpInside];
    rightBarButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    rightBarButton.frame = CGRectMake(0, 0, 40, 20);
    [rightBarButton setTitle:@"取消" forState:UIControlStateNormal];
    [rightBarButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarButton];
    
    rightBarButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [self.navigationItem.leftBarButtonItem setCustomView:[UIView new]];
    
}

- (void)initSubviews {
    self.navigationItem.titleView = self.searchTextField;
    [self.view addSubview:self.searchCollectionView];
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.searchTextField.returnKeyType = UIReturnKeySearch;
        self.searchTextField.placeholder = @"请输入商品、品牌名称进行搜索";
    
}

- (void)backToLastPage{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma lazy

- (NSMutableArray *)searchData{
    if (!_searchData) {
        _searchData = [NSMutableArray array];
    }
    return _searchData;
}

- (UICollectionView *)searchCollectionView{
    if (!_searchCollectionView) {
        _searchCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavgationBarAndStatusBarHeight) collectionViewLayout:[JXMaximumInteritemSpacingFlowLayout new]];
        
        _searchCollectionView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _searchCollectionView.delegate = self;
        _searchCollectionView.dataSource = self;
        _searchCollectionView.scrollEnabled = YES;
    }
    return _searchCollectionView;
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

- (JXSearchHistoryViewModel *)searchViewModel {
    if (!_searchViewModel) {
        _searchViewModel = [[JXSearchHistoryViewModel alloc] init];
    }
    return _searchViewModel;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.searchData.count == 0) {
        return [self.searchViewModel getHotSearchData].count;
    }else{
        if (section == 0) {
            return self.searchData.count;
        }else{
            return [self.searchViewModel getHotSearchData].count;
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.searchData.count == 0) {
        JXSearchHistoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchCollectionViewCell" forIndexPath:indexPath];
        [cell.contentLb setText:[self.searchViewModel getHotSearchWithIndex:indexPath.row]];
        
        return cell;

    }else{
        if (indexPath.section == 0) {
            JXSearchHistoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchCollectionViewCell" forIndexPath:indexPath];
            [cell.contentLb setText:self.searchData[indexPath.row]];
            
            return cell;
        }else {
            JXSearchHistoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchCollectionViewCell" forIndexPath:indexPath];
            [cell.contentLb setText:[self.searchViewModel getHotSearchWithIndex:indexPath.row]];
            
            return cell;
        }

    }
    
}

#pragma mark - UICollectionViewDelegate
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.searchData.count == 0) {
        return 1;
    }else{
        return 2;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (self.searchData.count == 0) {
//<<<<<<< HEAD
//        JXSearchHistoryHotCollectionReusableHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"hotSearchHeader" forIndexPath:indexPath];
//
//=======
        JXSearchHistoryCollectionReusableHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:searchHeader forIndexPath:indexPath];
        view.textLabel.text = @"热门搜索";
        [view.imageView setImage:[UIImage imageNamed:@"ic_search_hot"]];
        view.delectButton.hidden = YES;
        view.delectDelegate = self;
        reusableview = view;
            
    }else{
        if (indexPath.section == 0) {
            JXSearchHistoryCollectionReusableHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:searchHeader forIndexPath:indexPath];
            view.textLabel.text = @"历史记录";
            [view.imageView setImage:[UIImage imageNamed:@"ic_search_record"]];
            view.delectButton.hidden = NO;
            view.delectDelegate = self;
            reusableview = view;
        }
        
        if (indexPath.section == 1) {
//<<<<<<< HEAD
//            JXSearchHistoryHotCollectionReusableHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"hotSearchHeader" forIndexPath:indexPath];
//
//=======
            JXSearchHistoryCollectionReusableHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:searchHeader forIndexPath:indexPath];
            view.textLabel.text = @"热门搜索";
            [view.imageView setImage:[UIImage imageNamed:@"ic_search_hot"]];
            view.delectButton.hidden = YES;
            reusableview = view;
        }
        
    }
    
    return reusableview;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 5;
//}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchData.count == 0) {
        if (![YWDTools isNil:[self.searchViewModel getHotSearchWithIndex:indexPath.row]]) {
            return [JXSearchHistoryCollectionViewCell getSizeWithText:[self.searchViewModel getHotSearchWithIndex:indexPath.row] ];
        }
    }else{
        if (indexPath.section == 0) {
            return [JXSearchHistoryCollectionViewCell getSizeWithText:self.searchData[indexPath.row] ];
        }else{
           return [JXSearchHistoryCollectionViewCell getSizeWithText:[self.searchViewModel getHotSearchWithIndex:indexPath.row] ];
        }
        
    }
    
    
    return CGSizeMake(53, 21);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio
{
    return  UIEdgeInsetsMake(0, 15, 15, 15);
    
}

//设置不同分区的分组头部的大小, 高度是0 表示没有分组头
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(0, AutoSize(40));
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//
//    return CGSizeMake(0, AutoSize(40));
//}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {

        JXSearchResultPage *searchResultPage = [[JXSearchResultPage alloc]init];
        searchResultPage.keyWord = [[self readNSUserDefaults][indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [self SearchText:[self readNSUserDefaults][indexPath.row]];

        [self.navigationController pushViewController:searchResultPage animated:NO];
    }if (indexPath.section == 1) {
        
        JXSearchResultPage *searchResultPage = [[JXSearchResultPage alloc]init];
        searchResultPage.keyWord = [self.searchViewModel getHotSearchWithIndex:indexPath.row];
        [self SearchText:[self.searchViewModel getHotSearchWithIndex:indexPath.row]];

        [self.navigationController pushViewController:searchResultPage animated:NO];
    }
    
    
    
}


- (NSDictionary *)searchParamas {
    NSMutableDictionary *dic = [@{} mutableCopy];
    [dic setValue:[self.searchTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] forKey:@"keyword"];
    return dic;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //    if (self.searchType != 1) {
    [self SearchText:textField.text];
    //    }
    
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
    NSMutableDictionary *dic = [@{} mutableCopy];
    [dic setValue:[keyWord stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] forKey:@"keyword"];
    
    JXSearchResultPage *searchResultPage = [[JXSearchResultPage alloc]init];
    searchResultPage.keyWord = self.searchTextField.text;
    [self.navigationController pushViewController:searchResultPage animated:NO];
}

-(void)textFieldDidChange :(UITextField *)textField{
    if ([[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        //        self.searchCollectionView.hidden = NO;
        
    }else {
        //        self.searchCollectionView.hidden = NO;
        //        [self.searchCollectionView reloadData];
    }
}



-(void)SearchText :(NSString *)seaTxt
{
    NSMutableArray<NSString*> *searTXT = nil;
    
    if ([[seaTxt stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] || !seaTxt) {
        return;
        
    }else{
        NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
        //读取数组NSArray类型的数据
        NSArray *myArray = [userDefaultes arrayForKey:@"searchArray"];
        
        if ([myArray containsObject:seaTxt]) {
            searTXT = [NSMutableArray arrayWithArray:myArray];
            [searTXT removeObject:seaTxt];
            [searTXT insertObject:seaTxt atIndex:0];
            
        }else{
            // NSArray --> NSMutableArray
            searTXT = [NSMutableArray arrayWithArray:myArray];
            [searTXT insertObject:seaTxt atIndex:0];
        };
    }
    
    
    if(searTXT.count > 10)
    {
        [searTXT removeLastObject];
    }
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:searTXT forKey:@"searchArray"];
}
-(NSArray*)readNSUserDefaults
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:@"searchArray"];
    
    return myArray;
}

//清空历史记录
- (void)delectData:(EABASearchCollectionReusableFooterView *)view;
{
    if (self.searchData.count > 0) {
        [self.searchData removeAllObjects];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault removeObjectForKey:@"searchArray"];
        [self.searchCollectionView reloadData];
    }
}

@end
