//
//  XYShoppingCartVC.m
//  user
//
//  Created by xingyun on 2017/9/5.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYShoppingCartVC.h"

#import "XYShoppingCartTVCell.h"
#import "XYShopingCartListModel.h"
#import "XYShoppingCartTotalModel.h"
#import "JXShoppingCartHeatView.h"
#import "XYShoppingCartCommon.h" //
#import "XYGoodsDetailVC.h"
#import "XYShoppingCartBottomVC.h" // 购物车 底部

//#import "XYOrderConfirmOrderVC.h" //确认 订单

#import "XYShoppingCartNet.h" // 购物车 请求
#import "JXOrderSettlementViewController.h"

static NSString *HeatID=@"HeatID";
@interface XYShoppingCartVC () <UITableViewDelegate,UITableViewDataSource,XYShoppingCartTVCellDelegate,XYShoppingCartBottomDelegate>{
    XYShoppingCartTotalModel *shoppingCartTotalModel;
    NSInteger activitiesCount;
}


@property (nonatomic, strong) UIButton * rightBT;

@property (nonatomic, strong) UITableView * tableView;
/** 底部 view */
@property (nonatomic, strong) XYShoppingCartBottomVC * cartBottomVC;

/** 列表 数据 */
@property (nonatomic, strong) NSMutableDictionary * dicDataSource;
/** 底部 数据Model */
@property (nonatomic, strong) XYShoppingCartTotalModel * totalModel;

/** tableView 是否是编辑状态 */
@property (nonatomic, assign) BOOL  isCartCellEdit;

@end

@implementation XYShoppingCartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = XYGlobalBg;
//     [self.tableView registerNib:[UINib nibWithNibName:@"JXShoppingCartHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:HeatID];
//    [self setRightTitleButtonWith:@"编辑" selectedTitle:@"完成" target:self action:@selector(rightButtonClick:)];
    
    [self addNavRightButton];
    
    [self addViewAndLayout];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self netShoppingCartListData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:@"Available"];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
//    self.navigationItem.rightBarButtonItem
    
    if (_rightBT != nil) {
        
        if (_rightBT.selected) {
            
            _rightBT.selected = NO;
            
            self.isCartCellEdit = NO;
            [self.cartBottomVC.settlementBT setTitle:@"结算" forState:UIControlStateNormal];
            self.cartBottomVC.settlementBT.backgroundColor = XYNavMainColor;
            self.cartBottomVC.isCartBottomEdit = NO;
            [self.tableView reloadData];
            [self updateBottomViewData];
        }
    }
}


/** 添加 view */
- (void)addViewAndLayout
{
    [self.view addSubview:self.tableView];
    WeakSelf;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide).offset(-ShoppingCart_Bottom_height);
    }];
    
//    CGFloat bottomheight ;
//    if (self.isPushCartView) {
//        bottomheight = 0;
//    }else{
//        bottomheight = -49;
//    }
    
    self.cartBottomVC.view.hidden = YES;
    

    [self.view addSubview:self.cartBottomVC.view];
    [self.cartBottomVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(ShoppingCart_Bottom_height);
    }];
    
}

- (void)addNavRightButton
{
    UIButton* rightBT= [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGSize size = [XYStringHandle sizeWithString:@"编辑" font:XYFont_16 viewWidth:1000];
    rightBT.frame = CGRectMake(0, 0, size.width+3, 20);
    rightBT.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    [rightBT setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBT setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightBT setTitle:@"完成" forState:UIControlStateSelected];
    [rightBT setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    rightBT.titleLabel.font = XYFont_16;
    [rightBT addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _rightBT = rightBT;
    
    [self setRightNavightionButton:_rightBT];
    
}


#pragma mark - Refresh
/** 添加列表刷新 */
- (void)addTableViewRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header = header;
    
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    [footer setTitle:@" " forState:MJRefreshStateIdle];
//    // 隐藏刷新状态的文字
//    self.tableView.mj_footer = footer;
    
}

- (void)loadNewData
{
    [self netShoppingCartListData];
}


#pragma mark - button click

/** 导航右按钮 */
- (void)rightButtonClick:(UIButton*)sender
{
    if (self.dicDataSource.count == 0) {
        return;
    }
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        self.isCartCellEdit = YES;
        [self.cartBottomVC.settlementBT setTitle:@"删除" forState:UIControlStateNormal];
        self.cartBottomVC.isCartBottomEdit = YES;
        self.cartBottomVC.settlementBT.backgroundColor = XYGrayColor;
    }else{
        self.isCartCellEdit = NO;
        [self.cartBottomVC.settlementBT setTitle:@"结算" forState:UIControlStateNormal];
        self.cartBottomVC.isCartBottomEdit = NO;
        self.cartBottomVC.settlementBT.backgroundColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }
    
    
    [self.tableView reloadData];
    
    [self updateBottomViewData];
    
    
    
}

#pragma mark - bottom view update

/** 更新 底部按钮 属性 */
- (void)updateBottomViewData
{
    BOOL isBottomAllChecked = YES;
    NSArray *keys=[self.dicDataSource allKeys];
    for (int i=0; i<keys.count; i++) {
        NSArray *value=[self.dicDataSource valueForKey:keys[i]];
    for (XYShopingCartListModel * newModel in value) {
        
        if (self.isCartCellEdit) {
            if (!newModel.isSelectEdit) {
                isBottomAllChecked = NO;
            }
        }else{
            
            if (![newModel.checked isEqualToString:@"1"]) {
                isBottomAllChecked = NO;
            }
        }
    }
    }
    
    
    
//    for (XYShopingCartListModel * newModel in self.dataSource) {
//
//        if (self.isCartCellEdit) {
//            if (!newModel.isSelectEdit) {
//                isBottomAllChecked = NO;
//            }
//        }else{
//            if (![newModel.checked isEqualToString:@"1"]) {
//                isBottomAllChecked = NO;
//            }
//        }
//    }
    
    if (isBottomAllChecked) {
        self.cartBottomVC.selectBT.selected = YES;
    }else{
        self.cartBottomVC.selectBT.selected = NO;
    }
    
}


#pragma mark - 懒加载

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = XYGlobalBg;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        
        [self addTableViewRefresh];
        
    }
    return _tableView;
}

- (XYShoppingCartBottomVC*)cartBottomVC
{
    if (_cartBottomVC == nil) {
        _cartBottomVC = [[XYShoppingCartBottomVC alloc]init];
        _cartBottomVC.view.frame = CGRectZero;
        _cartBottomVC.delegate = self;
        
        [self addChildViewController:_cartBottomVC];
    }
    return _cartBottomVC;
}

- (NSMutableDictionary*)dicDataSource
{
    if (_dicDataSource == nil) {
        _dicDataSource = [NSMutableDictionary dictionary];
    }
    return _dicDataSource;
}


#pragma mark - empty Click

- (void)emptyAction:(UIButton*)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 0;
}


#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%d",self.dicDataSource.count);
    NSLog(@"%@",self.dicDataSource);
//    [tableView tableViewDisPlayType:XYTableViewEmptyType_no_cart ifNecessaryForRowCount:self.dicDataSource.count target:self buttonAction:@selector(emptyAction:)];
    return self.dicDataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *key=[[self.dicDataSource allKeys] objectAtIndex:section];
    NSArray *value=[self.dicDataSource valueForKey:key];
        return [value count];
   
//    return self.dataSource.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key=[[self.dicDataSource allKeys]objectAtIndex:indexPath.section];
    NSArray *value=[self.dicDataSource valueForKey:key];
    XYShopingCartListModel *model=value[indexPath.row];
    NSLog(@"%lu",(unsigned long)model.productLevelPromotionLabels.promotions.count);
    if (model.productLevelPromotionLabels.promotions.count==1) {
        return 115+(model.productLevelPromotionLabels.promotions.count*30);
    }else{
        return 115+(model.productLevelPromotionLabels.promotions.count*30);
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYShoppingCartTVCell *cell  = [XYShoppingCartTVCell cellWithTableView:tableView];
    cell.delegate = self;
    
    if (self.isCartCellEdit) {
        cell.cellType = XYShoppingCartCellType_edit;
    }else{
        cell.cellType = XYShoppingCartCellType_default;
    }
    
    NSString *key=[[self.dicDataSource allKeys]objectAtIndex:indexPath.section];
    NSArray *value=[self.dicDataSource valueForKey:key];
    cell.downlineImageView.alpha=0;
    cell.uplineImageView.alpha=0;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if (![key isEqualToString:@"1"]) {
        cell.uplineImageView.hidden=NO;
        cell.downlineImageView.hidden=NO;
        if(indexPath.row==value.count-1){
//            cell.downlineImageView.alpha=0;
            cell.lineLable.backgroundColor=XYRGBAColor(244, 244, 244, 1);

        }else{
            cell.lineLable.backgroundColor=XYRGBAColor(255, 255, 255, 0);
//            cell.downlineImageView.alpha=0;
        }
        
    }else{
        cell.lineLable.backgroundColor=XYRGBAColor(255, 255, 255, 0);
    }
        if (indexPath.section<= activitiesCount-1) {
//        cell.downlineImageView.hidden=NO;
//            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }else{
//        cell.lineLable.backgroundColor=XYRGBAColor(255, 255, 255, 1);
//        cell.uplineImageView.hidden=YES;
//        cell.downlineImageView.hidden=YES;
    }
    NSLog(@"%@",[self.dicDataSource allKeys]);
    XYShopingCartListModel *model=value[indexPath.row];
    [self cellContext:cell XYShopingCartListModel:model IndexPath:indexPath];
    
        cell.cartListModel = model;
        NSLog(@"%@",value[indexPath.row]);
    WeakSelf;
    cell.BuyDeleteCommodity = ^{
        NSLog(@"删除过期商品");
        [weakSelf deleteBuy:indexPath];
    };
    
    
    return cell;
}

-(void)cellContext:(XYShoppingCartTVCell *)cell XYShopingCartListModel:(XYShopingCartListModel *)cartListModel IndexPath:(NSIndexPath *)indexPath{
//    if (cartListModel.productLevelPromotionLabels.promotions.count<=0) {
//        [cell.specialOfferView1 removeAllSubviews];
//        [cell.specialOfferView removeAllSubviews];
//        cell.specialOfferView1.hidden=YES;
//        cell.specialOfferView.hidden=YES;
//    }
    
    [cell.specialOfferView1 removeAllSubviews];
    [cell.specialOfferView removeAllSubviews];
    cell.specialOfferView1.hidden=YES;
    cell.specialOfferView.hidden=YES;
    for (int i=0; i<cartListModel.productLevelPromotionLabels.promotions.count; i++) {
        UIView *view=[cell.contentView viewWithTag:indexPath.row+10000];
        [view removeAllSubviews];
        view.hidden=YES;
    }
    for (int i=0; i<cartListModel.productLevelPromotionLabels.promotions.count; i++) {
        //        XYShopingCartPromotionsModel *promotionsModel=cartListModel.productLevelPromotionLabels.promotions[i];
        
        if (i!=0) {
            cell.specialOfferView1=[[[NSBundle mainBundle]loadNibNamed:@"JXSpecialOfferView1" owner:self options:nil]lastObject];
            [cell.specialOfferView1 cell_init:cartListModel.productLevelPromotionLabels.promotions[i]];
            cell.specialOfferView1.tag=indexPath.row+10000;
            [cell.contentView addSubview:cell.specialOfferView1];
            [cell.specialOfferView1 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(125+(i*25));
                make.height.mas_equalTo(25);
                make.left.mas_equalTo(0);
                make.right.mas_equalTo(0);
            }];
        }else{
            cell.specialOfferView=[[[NSBundle mainBundle]loadNibNamed:@"JXSpecialOfferView" owner:self options:nil]lastObject];
            [cell.specialOfferView cell_init:cartListModel.productLevelPromotionLabels.promotions[i] Title:cartListModel.productLevelPromotionLabels];
            [cell.contentView addSubview:cell.specialOfferView];
            [cell.specialOfferView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(115);
                make.height.mas_equalTo(35);
                make.left.mas_equalTo(0);
                make.right.mas_equalTo(0);
            }];
        }
        
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key=[[self.dicDataSource allKeys]objectAtIndex:indexPath.section];
    NSArray *value=[self.dicDataSource valueForKey:key];
    XYShopingCartListModel *model=value[indexPath.row];
    XYGoodsDetailVC * detailVC = [[XYGoodsDetailVC alloc]init];
    detailVC.productId =model.productId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *key=[[self.dicDataSource allKeys]objectAtIndex:section];
    if (![key isEqualToString:@"1"]) {
        XYShopTargetsModel *model=shoppingCartTotalModel.orderRuleTargets[section];
        JXShoppingCartHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXShoppingCartHeatView" owner:self options:nil]lastObject];
        heatView.backgroundColor=[UIColor whiteColor];//XYRGBAColor(255, 255, 255, 1);
        [heatView heat_init:section Model:model];
        heatView.ClockSingle = ^(NSInteger index) {
            NSLog(@"%d去凑单",index);
        };
        return heatView;
      }
    return nil;
}
//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//        if ([[self.dataSource objectAtIndex:section] isKindOfClass:[XYShopTargetsModel class]]) {
//        UIView *view=[[UIView alloc]init];
//        view.backgroundColor=XYRGBAColor(244,244,244, 1);
//        return view;
//    }
//    return nil;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSString *key=[[self.dicDataSource allKeys]objectAtIndex:section];
    if (![key isEqualToString:@"1"]) {
        return 41;
    }
    return 0;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if ([[[self.dataSource objectAtIndex:section] objectAtIndex:0] isKindOfClass:[XYShopTargetsModel class]]) {
//        return 14;
//    }
//    return 0;
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self deleteBuy:indexPath];
        
    }
}

-(void)deleteBuy:(NSIndexPath *)indexPath{
    WeakSelf;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确认要删除这个商品吗？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *photographAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *key=[[self.dicDataSource allKeys]objectAtIndex:indexPath.section];
        NSArray *value=[self.dicDataSource valueForKey:key];
        XYShopingCartListModel *model=value[indexPath.row];
        
        [weakSelf netCartRemoveItems:@[@{@"itemId":model.itemId,@"cartId":model.cartId}]];
        
        
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:photographAction];
    [self presentViewController:alert animated:YES completion:nil];
}



/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - XYShoppingCartTVCellDelegate



/** 修改购物车回调 */
- (void)shoppingCartChangeAmount:(int)amount model:(XYShopingCartListModel *)model
{
    [self netCartChangeAmount:amount ListModel:model];
}

/** 购物车 选择  取消选择 */
- (void)shoppingCartCheckwithChecked:(NSString *)checked model:(XYShopingCartListModel *)model
{
    [self netCartCheckwithChecked:checked cartId:model.cartId itemId:model.itemId];
}

- (void)shoppingCartCheckWithEdit
{
    if (!self.isCartCellEdit) {
        return;
    }
    
    BOOL isBottomEditBotton = NO;
    
    NSArray *keys=[self.dicDataSource allKeys];
    for (int i=0; i<keys.count; i++) {
        NSArray *value=[self.dicDataSource valueForKey:keys[i]];
        for (XYShopingCartListModel * newModel in value) {
            
            if (newModel.selectEdit) {
                isBottomEditBotton = YES;
            }
    }
    
    
        
    }
    
    
    
//
    
    if (isBottomEditBotton) {
        self.cartBottomVC.settlementBT.backgroundColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }else{
        self.cartBottomVC.settlementBT.backgroundColor = XYGrayColor;
    }
    
}

#pragma mark - XYShoppingCartBottomDelegate
/** 购物车底部全选 按钮 回调  */
- (void)cartBottomCheckAllwithCheck:(NSString *)check
{
    if (self.isCartCellEdit) {
        
        if (self.dicDataSource.count == 0) {
            return;
        }
        
        NSArray *keys=[self.dicDataSource allKeys];
        for (int i=0; i<keys.count; i++) {
            NSArray *value=[self.dicDataSource valueForKey:keys[i]];
        
                    for (XYShopingCartListModel * newModel in value) {
                        
                        if ([check isEqualToString:@"t"]) {
                            newModel.selectEdit = YES;
                        }else{
                            newModel.selectEdit = NO;
                        }
                    }
                   
        }
        
        
        
        
        
        
        
        
        
        
//        for (XYShopingCartListModel * newModel in self.dataSource) {
//
//            if ([check isEqualToString:@"t"]) {
//                newModel.selectEdit = YES;
//            }else{
//                newModel.selectEdit = NO;
//            }
//        }
        [self.tableView reloadData];
        
        [self updateBottomViewData];
        
    }else{
        [self netCartCheckAllwithChecked:check cartType:self.totalModel.cartType];
    }
    
}

/** 购物车底部 删除 按钮 回调  */
- (void)cartBottomRemove
{
    if (self.isCartCellEdit) {
        
        if (self.dicDataSource.count == 0) {
            return;
        }
        
        NSMutableArray * selectGoodsArr = [NSMutableArray array];
        NSArray *keys=[self.dicDataSource allKeys];
        for (int i=0; i<keys.count; i++) {
            NSArray *value=[self.dicDataSource valueForKey:keys[i]];
       
                    for (XYShopingCartListModel * newModel in value) {
                        
                        if (newModel.isSelectEdit) {
                            [selectGoodsArr addObject:@{@"itemId":newModel.itemId,@"cartId":newModel.cartId}];
                        }
                    }
             
        }
        
        
        
        
        
        
        
        
//        for (XYShopingCartListModel * newModel in self.dataSource) {
//
//            if (newModel.isSelectEdit) {
//                [selectGoodsArr addObject:@{@"itemId":newModel.itemId,@"cartId":newModel.cartId}];
//            }
//        }
        [self netCartRemoveItems:[selectGoodsArr copy]];
    }
}

/** 确认订单 */
- (void)cartBottomPushOrderConfirmOrderVC
{
    
    if ([XYUserDefaults readUserDefaultsRegistered].count == 0) {
        [XYCommon setPresentViewControllerWithLoginView];
        return;
    }
    
    if (self.dicDataSource.count == 0) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"购物车为空" dismissTimeInterval:1.0];
        return;
    }
    
    BOOL isCartHaveGoods = NO;
//    for (XYShopingCartListModel * model in self.dataSource) {
//        if ([model.checked isEqualToString:@"1"]) {
//            isCartHaveGoods = YES;
//        }
//    }
    NSArray *keys=[self.dicDataSource allKeys];
    for (int i=0; i<keys.count; i++) {
        NSArray *value=[self.dicDataSource valueForKey:keys[i]];
                for (XYShopingCartListModel * newModel in value) {
                    if ([newModel.checked isEqualToString:@"1"]) {
                        isCartHaveGoods = YES;
                    }
                }
         
    }
    
    
    
    
    
    if (!isCartHaveGoods) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请选择商品" dismissTimeInterval:1.0];
        return;
    }
    JXOrderSettlementViewController * orderSettlementViewController = [[JXOrderSettlementViewController alloc]init];
    orderSettlementViewController.cartId = self.totalModel.cartId;
    [self.navigationController pushViewController:orderSettlementViewController animated:YES];
//    XYOrderConfirmOrderVC * confirmOrderVC = [[XYOrderConfirmOrderVC alloc]init];
//    confirmOrderVC.cartId = self.totalModel.cartId;
//    [self.navigationController pushViewController:confirmOrderVC animated:YES];
}


#pragma mark - data
/** 更新 数据 */
- (void)updateViewData
{
    [self.tableView reloadData];
    self.cartBottomVC.totalModel = self.totalModel;
    
    [XYShoppingCartNet netCartCountWithCartType:self.totalModel.cartType
                                  theMerchantId:self.totalModel.merchantId];
    
}

/** 返回数据处理 */
- (void)updateBlockDictionary:(NSDictionary*)blockDictionary
{
    if (self.dicDataSource.count != 0) {
        [self.dicDataSource removeAllObjects];
    }
    
    NSArray * cartsArray = [blockDictionary objectForKey:@"carts"];
    
    if (cartsArray.count == 0) {
        
        self.cartBottomVC.view.hidden = YES;
        [self.tableView reloadData];
        
        self.rightBT.hidden = YES;
        
        [XYShoppingCartNet netCartCountWithCartType:self.totalModel.cartType
                                      theMerchantId:self.totalModel.merchantId];
        
        self.cartBottomVC.totalModel = nil;
        
        return ;
    }
    NSDictionary * cartsDict = cartsArray.firstObject;
    
    NSDictionary * noNullDict = [XYCommon removeNull:cartsDict];
    
    self.totalModel = [XYShoppingCartTotalModel mj_objectWithKeyValues:noNullDict];
    
    BOOL isBottomEditBotton = NO;
    shoppingCartTotalModel=[XYShoppingCartTotalModel mj_objectWithKeyValues:noNullDict];
//    if (shoppingCartTotalModel.orderRuleTargets.count!=0) {
//        [self.dataSource addObjectsFromArray:shoppingCartTotalModel.orderRuleTargets];
//    }
    for (XYShopTargetsModel *shopTargetsModel in shoppingCartTotalModel.orderRuleTargets) {
        [self.dicDataSource setObject:shopTargetsModel.buyItems forKey:shopTargetsModel.ruleId];
        
    }
    activitiesCount=self.dicDataSource.count;
//    [self.dataSource addObject:shoppingCartTotalModel.orderRuleTargets.count==0?[NSArray new]:shoppingCartTotalModel.orderRuleTargets];
    NSArray * dpFromResponse = [noNullDict objectForKey:@"buyItems"];
    XYShopTargetsModel *model=[XYShopTargetsModel mj_objectWithKeyValues:noNullDict];
    [self.dicDataSource setObject:model.buyItems forKey:@"1"];
    NSLog(@"%@",self.dicDataSource);
    for (NSDictionary * attributes in dpFromResponse) {
        NSDictionary * butesdict = [XYCommon removeNull:attributes];
        XYShopingCartListModel * newModel = [XYShopingCartListModel mj_objectWithKeyValues:butesdict];
        
//        [self.noctivitydAataSource addObject:newModel];
        
        if (self.isCartCellEdit) {
            if (newModel.selectEdit) {
                isBottomEditBotton = YES;
            }
        }
    }
//    [self.dataSource addObjectsFromArray:self.noctivitydAataSource];
//    if (self.noctivitydAataSource.count!=0) {
//        [self.dataSource addObject:self.noctivitydAataSource];
//    }
//    [self.dataSource addObject:self.noctivitydAataSource.count==0?[NSArray new]:self.noctivitydAataSource];
    
    if (self.isCartCellEdit ) {
        if (isBottomEditBotton) {
            self.cartBottomVC.settlementBT.backgroundColor = XYNavMainColor;
        }else{
            self.cartBottomVC.settlementBT.backgroundColor = XYGrayColor;
        }
    }
    
    self.rightBT.hidden = NO;
    
    self.cartBottomVC.view.hidden = NO;

    [self updateViewData];
    
    
    [self updateBottomViewData];
}


#pragma mark - data net
/** 获取购物车列表 */
- (void)netShoppingCartListData
{
    WeakSelf;
    [XYShoppingCartNet netShoppingCartListblock:^(NSDictionary *blockDictionary, NSError *error) {
    [weakSelf.tableView.mj_header endRefreshing];
        if (error == nil) {
            NSDictionary *dic=(NSDictionary *)blockDictionary;
            
            if (blockDictionary.count == 0||[[dic valueForKey:@"carts"] count]==0) {
                [self.tableView tableViewDisPlayType:XYTableViewEmptyType_no_cart ifNecessaryForRowCount:0 target:self buttonAction:@selector(emptyAction:)];
            }else{
                self.tableView.backgroundView = [UIView new];
            }
            [weakSelf updateBlockDictionary:blockDictionary];
        }else{
            
//            if ([error.domain isEqualToString:ERROR_NUM_NOTlOGGED]) {
//                weakSelf.tabBarController.selectedIndex = 0;
//            }
        }
    }];
}

/** 删除 购物车商品 */
- (void)netCartRemoveItems:(NSArray*)items
{
    WeakSelf;
    [XYShoppingCartNet netCartRemoveItemWithitems:items block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
//            NSString *carCount=[NSString stringWithFormat:@"%@",[blockDictionary valueForKey:@"count"]];
            if ([[blockDictionary valueForKey:@"carts"] count]==0) {
                [self.tableView tableViewDisPlayType:XYTableViewEmptyType_no_cart ifNecessaryForRowCount:0 target:self buttonAction:@selector(emptyAction:)];
            }else{
                self.tableView.backgroundView = [UIView new];
            }

            [weakSelf updateBlockDictionary:blockDictionary];
        }
    }];
}


/** 修改购买数量 */
- (void)netCartChangeAmount:(int)number ListModel:(XYShopingCartListModel*)cartListModel
{
    WeakSelf;
    [XYShoppingCartNet netCartChangeAmountWithCartId:cartListModel.cartId
                                              itemId:cartListModel.itemId
                                            toNumber:[NSString stringWithFormat:@"%d",number]
                                               block:^(NSDictionary *blockDictionary, NSError *error) {
                                                   
                                                   if (error == nil) {
                                                       [weakSelf updateBlockDictionary:blockDictionary];

                                                       
                                                   }
                                                   
                                               }];
}

/** 购物车商品  全选 或者 全部取消 */
- (void)netCartCheckAllwithChecked:(NSString *)checked cartType:(NSString*)cartType
{
    WeakSelf;
    [XYShoppingCartNet netCartCheckAllWithCartType:cartType
                                           checked:checked
                                             block:^(NSDictionary *blockDictionary, NSError *error) {
                                                 if (error == nil) {
                                                     [weakSelf updateBlockDictionary:blockDictionary];
                                                 }
                                                 
    }];
}

/** 购物车商品  选择 或者 取消 */
- (void)netCartCheckwithChecked:(NSString *)checked cartId:(NSString*)cartId itemId:(NSString*)itemId
{
    WeakSelf;
    [XYShoppingCartNet netCartCheckItemWithCartId:cartId
                                          checked:checked
                                           itemId:itemId
                                            block:^(NSDictionary *blockDictionary, NSError *error) {
                                                if (error == nil) {
                                                    [weakSelf updateBlockDictionary:blockDictionary];
                                                }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
