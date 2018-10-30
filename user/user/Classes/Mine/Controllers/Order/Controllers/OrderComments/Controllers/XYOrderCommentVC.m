//
//  XYOrderCommentVC.m
//  user
//
//  Created by xingyun on 2017/9/27.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentVC.h"

#import "XYOrderCommentListCell.h"

#import "XYOrderAlreadyCommentCell.h"

#import "XYOrderCommentNet.h"

#import "XYCommentListModel.h"

#import "XYOrderAddCommentVC.h"
#import "XYOrderReCommentVC.h"

#import "XYOrderCommentDetailVC.h"

#import "XYGoodsDetailVC.h"

//#import "XYOrderDetailSubClassOrderDetailVC.h"
#import "JXMyOrderDetailsViewController.h"
#import "XYOrderCommentDetailWebVC.h"

@interface XYOrderCommentVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,XYOrderCommentListCellDelegate,XYOrderAlreadyCommentCellDelegate>
/** 待评价 */
@property(nonatomic,strong) UIButton *waitCommentBtn;
/** 已评价标签 */
@property(strong,nonatomic) UIButton *alreadyCommentBtn ;
/** 动画线视图 */
@property(strong,nonatomic) UIView *animateView ;
/** 上边的线 */
@property(strong,nonatomic) UIView *uplineView ;
/** 下边的线 */
@property(strong,nonatomic) UIView *downLineView ;
/** 滑动视图 */
@property(strong,nonatomic) UIScrollView *scrollView ;

/** 当前的页码 */
@property(assign,nonatomic) NSInteger currentPage ;

/**待评论表 */
@property(strong,nonatomic) UITableView *orderCommentTVB ;

/** 已评论表 */
@property(strong,nonatomic) UITableView *alreadyCommentTVB ;

/** 待评价商品 */
@property(strong,nonatomic) XYCommentListModel *commentModel ;
/** 已评价商品 */
@property(strong,nonatomic) XYCommentListModel *alreadyModel ;


@property(strong,nonatomic) UIView *emptyView ;

/*************** 脚 *****************/
@property(strong,nonatomic) UIView *footView ;
/** 左侧线 */
@property(strong,nonatomic) UIView *leftLineView ;
/** 脚标签 */
@property(strong,nonatomic) UILabel *footLab ;
/** 右边的线 */
@property(strong,nonatomic) UIView *rightLineView ;




/***************** 已评价表脚 ************************/

@property(strong,nonatomic) UIView *alreadyFootView ;
@property(strong,nonatomic) UIView *alreadyLeftLineView ;
@property(strong,nonatomic) UILabel *alreadyFootLab ;
@property(strong,nonatomic) UIView *alreadyRightLineView ;

@end


static NSString *const XYOrderCommentListCellID = @"XYOrderCommentListCell";

static NSString *const XYOrderAlreadyCommentCellID = @"XYOrderAlreadyCommentCell";

@implementation XYOrderCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatGui];

    [self netCommentDataFormSever];
    [self netAlreadyCommentDataFromSever];
}


-(void )addBgView{

    
        _emptyView= [[UIView alloc]init];
        [self.view addSubview:_emptyView];
        [_emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0.5);
            make.left.right.bottom.mas_offset(0);
        }];
        _emptyView.backgroundColor = XYGlobalBg;
        
        NSString * titleString = @"没有相应的评价，看看其它吧~";
        NSString * imageString = @"no_order";
        NSString * buttonString = @"去逛逛";
        
        UILabel * titleLB = [[UILabel alloc]init];
        titleLB.textAlignment = NSTextAlignmentCenter;
        titleLB.textColor = XYGrayColor;
        titleLB.font = XYFont_14;
        titleLB.text = titleString;
        [_emptyView addSubview:titleLB];
        
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_emptyView.mas_centerY);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        
        UIImageView * bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageString]];
        bgImageView.contentMode = UIViewContentModeBottom;
        [_emptyView addSubview:bgImageView];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_emptyView.mas_centerX);
            make.bottom.mas_equalTo(titleLB.mas_top).offset(-20);
        }];
        
        
        
        UIButton * tableBT = [UIButton buttonWithType:UIButtonTypeCustom];
        [tableBT setTitle:buttonString forState:UIControlStateNormal];
        [tableBT setTitleColor:XYMainColor forState:UIControlStateNormal];
        [tableBT.titleLabel setFont:XYFont_14];
        tableBT.layer.cornerRadius = 6;
        tableBT.layer.masksToBounds = YES;
        tableBT.layer.borderWidth = 1;
        tableBT.layer.borderColor = XYMainColor.CGColor;
        [tableBT addTarget:self   action:@selector(emptyViewHandler:) forControlEvents:UIControlEventTouchUpInside];
   
        [_emptyView addSubview:tableBT];
        
        [tableBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_emptyView.mas_centerX);
            make.top.mas_equalTo(titleLB.mas_bottom).offset(18);
            make.width.mas_equalTo(140);
            make.height.mas_equalTo(38);
        }];

    
}

-(void)emptyViewHandler:(id)sender{

//    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 0;
}



#pragma mark - UI
-(void)creatGui{

    [self.uplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];


    [self.downLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_uplineView.mas_bottom).offset(44);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.waitCommentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_uplineView.mas_bottom);
        make.bottom.mas_equalTo(_downLineView.mas_top);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(XYScreenW/2);
    }];
    [self.alreadyCommentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_waitCommentBtn.mas_right);
        make.top.mas_equalTo(_waitCommentBtn.mas_top);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(_waitCommentBtn.mas_bottom);
    }];
    
    [self.animateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_waitCommentBtn.mas_centerX);
        make.bottom.mas_equalTo(_downLineView.mas_top);
        make.width.mas_equalTo(73);
        make.height.mas_equalTo(2);
    }];
    self.scrollView.frame = CGRectMake(0, 60, XYScreenW, XYScreenH - 60 -64-34);
    self.scrollView.contentSize = CGSizeMake(XYScreenW*2, XYScreenH - 60 -64-34);
    [self.scrollView addSubview:self.orderCommentTVB];
    self.orderCommentTVB.frame = CGRectMake(0, 0, XYScreenW, XYScreenH - 60 -64-34);

    [self.scrollView addSubview:self.alreadyCommentTVB];

    
    self.alreadyCommentTVB.frame = CGRectMake(XYScreenW, 0, XYScreenW, XYScreenH - 60 -64-34);

    [self addFootView];
    
}

-(void)addFootView{

    self.footView = [[UIView alloc] init];
    self.footView.frame = CGRectMake(0, 0, XYScreenW, 100);
    CGFloat width = (XYScreenW -20 - 100)/2;
    self.leftLineView = [[UIView alloc] initWithFrame:CGRectMake(XY_Left_Margin, 17, width, 0.5)];
    self.leftLineView.backgroundColor = XYGrayColor;
    [self.footView addSubview:self.leftLineView];
 
    self.footLab = [[UILabel alloc] initWithFrame:CGRectMake(XY_Left_Margin+width, 0, 100, 34)];
    self.footLab.font = XYFont_14;
    self.footLab.textColor =XYBlackColor;
    self.footLab.textAlignment = NSTextAlignmentCenter;
    self.footLab.text = @"已经到底了";
       [self.footView addSubview:self.footLab];
    self.rightLineView = [[UIView alloc] initWithFrame:CGRectMake(XY_Left_Margin+width+100, 17, width, 0.5)];
    self.rightLineView.backgroundColor = XYGrayColor;
    [self.footView addSubview:self.rightLineView];
    
    self.orderCommentTVB.tableFooterView = self.footView;
//    self.alreadyCommentTVB.tableFooterView = self.footView;
    
    
    
    self.alreadyFootView = [[UIView alloc] init];
    self.alreadyFootView.frame = CGRectMake(0, 0, XYScreenW, 100);
    CGFloat width2 = (XYScreenW -20 - 100)/2;
    self.alreadyLeftLineView = [[UIView alloc] initWithFrame:CGRectMake(XY_Left_Margin, 17, width2, 0.5)];
    self.alreadyLeftLineView.backgroundColor = XYGrayColor;
    [self.alreadyFootView addSubview:self.alreadyLeftLineView];
    
    self.alreadyFootLab = [[UILabel alloc] initWithFrame:CGRectMake(XY_Left_Margin+width, 0, 100, 34)];
    self.alreadyFootLab.font = XYFont_14;
    self.alreadyFootLab.textColor =XYBlackColor;
    self.alreadyFootLab.textAlignment = NSTextAlignmentCenter;
    self.alreadyFootLab.text = @"已经到底了";
    [self.alreadyFootView addSubview:self.alreadyFootLab];
    self.alreadyRightLineView = [[UIView alloc] initWithFrame:CGRectMake(XY_Left_Margin+width+100, 17, width, 0.5)];
    self.alreadyRightLineView.backgroundColor = XYGrayColor;
    [self.alreadyFootView addSubview:self.alreadyRightLineView];
    
    self.alreadyCommentTVB.tableFooterView = self.alreadyFootView;
    
}

#pragma mark - 网络层
-(void)netCommentDataFormSever{

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"productType"] = @"0";
    WeakSelf;
    [XYOrderCommentNet netGetCommentListWithParam:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf.orderCommentTVB.mj_header endRefreshing];
        if (error == nil) {
            NSDictionary *dic = [XYCommon removeNull:blockDictionary];
            weakSelf.commentModel = [XYCommentListModel mj_objectWithKeyValues:dic];
            
        }
        if ([weakSelf.commentModel.canAppraiseAmount integerValue] ==0 && [weakSelf.commentModel.canNotAppraiseAmount integerValue] == 0) {
            [self addBgView];
            return ;
        }
        if ([weakSelf.commentModel.canAppraiseAmount integerValue] !=0) {
            [weakSelf.waitCommentBtn setTitle:[NSString stringWithFormat:@"待评价(%@)",weakSelf.commentModel.canAppraiseAmount] forState:UIControlStateNormal];
        }else
        {
            [weakSelf.waitCommentBtn setTitle:[NSString stringWithFormat:@"待评价"] forState:UIControlStateNormal];
        }
        
        if ([weakSelf.commentModel.canNotAppraiseAmount integerValue] !=0) {
             [weakSelf.alreadyCommentBtn setTitle:[NSString stringWithFormat:@"已评价(%@)",weakSelf.commentModel.canNotAppraiseAmount] forState:UIControlStateNormal];
        }else
        {
            [weakSelf.alreadyCommentBtn setTitle:[NSString stringWithFormat:@"已评价"] forState:UIControlStateNormal];
        }
        
        
        [weakSelf.orderCommentTVB reloadData];
    }];

}

-(void)netAlreadyCommentDataFromSever{

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"productType"] = @"1";
    WeakSelf;
    [XYOrderCommentNet netGetCommentListWithParam:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        [weakSelf.alreadyCommentTVB.mj_header endRefreshing];
        if (error == nil) {
            NSDictionary *dic = [XYCommon removeNull:blockDictionary];
            
            weakSelf.alreadyModel = [XYCommentListModel mj_objectWithKeyValues:dic];
            
        }
        
        [weakSelf.alreadyCommentTVB reloadData];
        
    }];


}



#pragma mark - lazy

-(XYCommentListModel *)commentModel
{
    if (!_commentModel) {
        _commentModel = [[XYCommentListModel alloc] init];
    }
    return _commentModel;
}

-(XYCommentListModel *)alreadyModel
{
    if (!_alreadyModel) {
        _alreadyModel = [[XYCommentListModel alloc] init];
    }
    return _alreadyModel;
}

-(UIButton *)waitCommentBtn
{
    if (!_waitCommentBtn) {
        _waitCommentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_waitCommentBtn addTarget:self action:@selector(commentBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_waitCommentBtn];
        
        _waitCommentBtn.selected = YES;
        _waitCommentBtn.titleLabel.font = XYFont_14;
        [_waitCommentBtn setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_waitCommentBtn setTitleColor:XYFontTitleColor forState:UIControlStateSelected];
        [_waitCommentBtn setBackgroundColor:XYWhiteColor];
        [_waitCommentBtn setTitle:@"待评价" forState:UIControlStateNormal];
    }
    return _waitCommentBtn;
}

-(UIButton *)alreadyCommentBtn
{
    if (!_alreadyCommentBtn) {
        _alreadyCommentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_alreadyCommentBtn addTarget:self action:@selector(commentBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [_alreadyCommentBtn setTitleColor:XYFontTitleColor forState:UIControlStateSelected];
        [self.view addSubview:_alreadyCommentBtn];
        _alreadyCommentBtn.titleLabel.font = XYFont_14;

        [_alreadyCommentBtn setBackgroundColor:XYWhiteColor];
        [_alreadyCommentBtn setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        [_alreadyCommentBtn setTitle:@"已评价" forState:UIControlStateNormal];
    }
    return _alreadyCommentBtn;
}

-(UIView *)uplineView
{
    if (!_uplineView) {
        _uplineView = [[UIView alloc] init];
        _uplineView.backgroundColor = XYLineColor;
        [self.view addSubview:_uplineView];
    }
    return _uplineView;
}

-(UIView *)downLineView
{
    if (!_downLineView) {
        _downLineView = [[UIView alloc] init];
        _downLineView.backgroundColor = XYLineColor;
        [self.view addSubview:_downLineView];
    }
    return _downLineView;
}


-(UIView *)animateView
{
    if (!_animateView) {
        _animateView = [[UIView alloc ]init];
        _animateView.backgroundColor = XYBlackColor;
        [self.view addSubview:_animateView];
    }
    return _animateView;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}



-(UITableView *)orderCommentTVB
{
    if (!_orderCommentTVB) {
        _orderCommentTVB = [[UITableView alloc] init];
        _orderCommentTVB.backgroundColor = XYGlobalBg;
        _orderCommentTVB.delegate =self;
        _orderCommentTVB.dataSource = self;
        _orderCommentTVB.showsVerticalScrollIndicator = NO;
        _orderCommentTVB.showsHorizontalScrollIndicator = NO;
        _orderCommentTVB.separatorInset    = UIEdgeInsetsMake(0, 0, 0, 0);
        _orderCommentTVB.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(netCommentDataFormSever)];
        [_orderCommentTVB registerClass:[XYOrderCommentListCell class] forCellReuseIdentifier:XYOrderCommentListCellID];
    }
    return _orderCommentTVB;

}

-(UITableView *)alreadyCommentTVB
{
    if (!_alreadyCommentTVB) {
        _alreadyCommentTVB = [[UITableView alloc] init];
        _alreadyCommentTVB.backgroundColor = XYGlobalBg;
        _alreadyCommentTVB.delegate =self;
        _alreadyCommentTVB.dataSource = self;
        _alreadyCommentTVB.showsVerticalScrollIndicator = NO;
        _alreadyCommentTVB.showsHorizontalScrollIndicator = NO;
        _alreadyCommentTVB.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _alreadyCommentTVB.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(netAlreadyCommentDataFromSever)];
        [_alreadyCommentTVB registerClass:[XYOrderAlreadyCommentCell class] forCellReuseIdentifier:XYOrderAlreadyCommentCellID];
    }
    return _alreadyCommentTVB;
}


#pragma mark - 点击事件
//点击评价与待评价
-(void)commentBtnHandler:(UIButton *)sender
{

    if (sender == self.waitCommentBtn) {
        self.currentPage = 0;
  
        [self.scrollView scrollRectToVisible:CGRectMake(0, self.scrollView.frame.origin.y, XYScreenW, 1) animated:YES];
        
    }else
    {
        self.currentPage = 1;
        
       
          [self.scrollView scrollRectToVisible:CGRectMake(XYScreenW, self.scrollView.frame.origin.y, XYScreenW, 1) animated:YES];
    }
    
    
}


#pragma mark - 
-(void)updateAnimateView{


    if (self.currentPage == 0) {
        self.waitCommentBtn.selected = YES;
        self.alreadyCommentBtn.selected = NO;
        [UIView animateWithDuration:0.2 animations:^{
                    self.animateView.transform = CGAffineTransformMakeTranslation(0, 0);
        }];


        
    }else
    {
        self.waitCommentBtn.selected = NO;
        self.alreadyCommentBtn.selected = YES;
        [UIView animateWithDuration:0.2 animations:^{
         self.animateView.transform = CGAffineTransformMakeTranslation(XYScreenW/2, 0);
        }];
        
       
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView == self.scrollView) {
        self.currentPage = scrollView.contentOffset.x/XYScreenW;
        if (self.currentPage>0) {
            self.currentPage = 1;
        }else
        {
            self.currentPage = 0;
        }
        
        [self updateAnimateView];

    }

}

#pragma mark - table data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == self.orderCommentTVB) {
        [tableView tableViewDisPlayType:XYTableViewEmptyType_no_order ifNecessaryForRowCount:self.commentModel.productList.count target:self buttonAction:@selector(emptyViewHandler:)];
        if (self.commentModel.productList.count == 0) {
            tableView.tableFooterView.hidden = YES;
        }else
        {
            
            tableView.tableFooterView.hidden = NO;
        }
        
        return    self.commentModel.productList.count;
    }else
    {
         [tableView tableViewDisPlayType:XYTableViewEmptyType_no_order ifNecessaryForRowCount:self.alreadyModel.productList.count target:self buttonAction:@selector(emptyViewHandler:)];
        if (self.alreadyModel.productList.count == 0) {
            tableView.tableFooterView.hidden = YES;
        }else
        {
            
            tableView.tableFooterView.hidden = NO;
        }
        return      self.alreadyModel.productList.count;
    
    }
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.orderCommentTVB) {
        
        XYOrderCommentListCell *cell = [tableView dequeueReusableCellWithIdentifier:XYOrderCommentListCellID forIndexPath:indexPath];
        
      
        XYCommentProductListModel *model = self.commentModel.productList[indexPath.row];
        [cell.iconImgV sd_setImageWithURL:[NSURL URLWithString:model.logo]];
        cell.descLab.text = model.name;
        
        
        [cell.leftBtn setTitle:@"查看订单" forState:UIControlStateNormal];
        [cell.rightBtn setTitle:@"评价" forState:UIControlStateNormal];
        
        cell.index = indexPath;
        cell.delegate = self;
        
        return cell;
    }else
    {
        
        XYOrderAlreadyCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:XYOrderAlreadyCommentCellID forIndexPath:indexPath];
        
     
        XYCommentProductListModel *model = self.alreadyModel.productList[indexPath.row];
        [cell.iconImgV sd_setImageWithURL:[NSURL URLWithString:model.logo]];
        cell.descLab.text = model.name;
        
    
        cell.model = model;
        
        cell.delegate = self;
        cell.index = indexPath;
  
        
        return cell;

        
    }
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 109;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _orderCommentTVB) {
        XYGoodsDetailVC *detailVc = [[XYGoodsDetailVC alloc] init];
            XYCommentProductListModel *model = self.commentModel.productList[indexPath.row];
        detailVc.productId = model.productId;
        [self.navigationController pushViewController:detailVc animated:YES];
    }else
    {
        XYGoodsDetailVC *detailVc = [[XYGoodsDetailVC alloc] init];
        XYCommentProductListModel *model = self.alreadyModel.productList[indexPath.row];
        detailVc.productId = model.productId;
        [self.navigationController pushViewController:detailVc animated:YES];
    
    }

}

#pragma mark -cell 代理

-(void)commentBtnHandlerWithBool:(BOOL)leftBtn indexpath:(NSIndexPath *)index
{
    if (leftBtn) {//查看订单
        XYCommentProductListModel *model = self.commentModel.productList[index.row];
//        XYOrderDetailSubClassOrderDetailVC *detailVc = [[XYOrderDetailSubClassOrderDetailVC alloc] init];
//        detailVc.order_ID = model.orderAliasCode;
//
//        [self.navigationController pushViewController:detailVc animated:YES];
        JXMyOrderDetailsViewController * myOrderDetailsViewController = [[JXMyOrderDetailsViewController alloc]init];
        myOrderDetailsViewController.orderID = model.orderAliasCode;
        [self.navigationController pushViewController:myOrderDetailsViewController animated:YES];
        
    }else//评价
    {
        XYCommentProductListModel *model = self.commentModel.productList[index.row];
        
        XYOrderAddCommentVC *commentVC = [[XYOrderAddCommentVC alloc] init];
        WeakSelf;
        commentVC.successBlock = ^{
            [weakSelf netCommentDataFormSever];
            [weakSelf netAlreadyCommentDataFromSever];
        };
        commentVC.dataModel = model;
        [self.navigationController pushViewController:commentVC animated:YES];
        
    }


}


-(void)btnHandlerWithIndex:(NSIndexPath *)index btnTitle:(NSString *)title
{
        XYCommentProductListModel *model = self.alreadyModel.productList[index.row];
    if ([title isEqualToString:@"查看评论"]) {
  
        XYOrderCommentDetailWebVC *webVC  =[[XYOrderCommentDetailWebVC alloc]init];
        webVC.apprId = model.apprId;
        webVC.productId = model.productId;
        [self.navigationController pushViewController:webVC animated:YES];
        
        
    }
    
    if ([title isEqualToString:@"追加评论"]) {
        
        XYOrderReCommentVC *commentVC = [[XYOrderReCommentVC alloc] init];
        commentVC.dataModel = model;
        WeakSelf;
        commentVC.successBlock = ^{
            [weakSelf netCommentDataFormSever];
            [weakSelf netAlreadyCommentDataFromSever];
        };
        [self.navigationController pushViewController:commentVC animated:YES];
        
    }

}

@end
