//
//  XYPreDepositSelectCVC.m
//  user
//
//  Created by xingyun on 2017/9/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYPreDepositSelectCVC.h"
#import "JXPreDepositSelectModel.h"
#import "XYPreDepositSelectCVCell.h"

#import "XYPreDepositSelectModel.h"

#import "XYOrderAllNet.h"

@interface XYPreDepositSelectCVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYPreDepositSelectCVC

static NSString * const reuseIdentifier = @"Cell";


const CGFloat preDeposit_CVCell_height = 100.0;

- (instancetype)init
{
    // 创建一个流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动的方向
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView.backgroundColor = XYWhiteColor;
    
    self.collectionView.scrollEnabled = NO;

    [self.collectionView registerClass:[XYPreDepositSelectCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    [self updateDataSource];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)setIsProductList:(NSString *)isProductList
{
    _isProductList = isProductList;
    
    [self netPreDepostListData];
}




#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYPreDepositSelectCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = XYWhiteColor;
    
    XYPreDepositSelectModel * model = self.dataSource[indexPath.item];
    cell.titleLB.text = model.memberPrice;
    cell.subLB.text = model.sellingPoint;
    
    if (self.productId.length == 0 && indexPath.item == 0   ) {
        self.productId = model.productId;
    }
    
    if (self.dataSource.count >= 1) {
       
        if ([self.productId isEqualToString:model.productId]) {
            cell.titleLB.textColor = XYWhiteColor;
            cell.subLB.textColor = XYWhiteColor;
            
            cell.contentView.backgroundColor = XYMainColor;
            cell.contentView.layer.borderColor = XYMainColor.CGColor;
        }else
        {
            cell.titleLB.textColor = XYFontTitleColor;
            cell.subLB.textColor = XYFontTitleColor;
            
            cell.contentView.backgroundColor = XYWhiteColor;
            cell.contentView.layer.borderColor = XYFontTitleColor.CGColor;
            
        }

        
    }
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((XYScreenW - 25*2 - 15)/2, preDeposit_CVCell_height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(25, 25, 25, 25);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    XYPreDepositSelectCVCell * cell = (XYPreDepositSelectCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    
//    cell.titleLB.textColor = XYWhiteColor;
//    cell.subLB.textColor = XYWhiteColor;
//    
//    cell.contentView.backgroundColor = XYMainColor;
//    cell.contentView.layer.borderColor = XYMainColor.CGColor;
//    
    XYPreDepositSelectModel * model = self.dataSource[indexPath.item];
    self.productId = model.productId;
    [collectionView reloadData];
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    XYPreDepositSelectCVCell * cell = (XYPreDepositSelectCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    
//    cell.titleLB.textColor = XYFontTitleColor;
//    cell.subLB.textColor = XYFontTitleColor;
//    
//    cell.contentView.backgroundColor = XYWhiteColor;
//    cell.contentView.layer.borderColor = XYFontTitleColor.CGColor;
    
    
    
}

#pragma mark - height

/**  高度  */
- (CGFloat)updateDepositSelectCVCHeight
{
    if (self.dataSource.count != 0) {
        
        NSInteger rowsCount = self.dataSource.count / 2 + self.dataSource.count %2 ;

        return  preDeposit_CVCell_height*rowsCount + 15 * (rowsCount-1) + 25 * 2;
        
    }else{
        return 0;
    }
}

#pragma mark - data

- (void)coll
{
    
}

- (void)updateViewData
{
    if (self.productId == nil) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - net data

- (void)netPreDepostListData
{
    WeakSelf;
    [XYOrderAllNet netOrderPromotionsWithIsProductList:_isProductList Block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            if (weakSelf.dataSource.count != 0) {
                [weakSelf.dataSource removeAllObjects];
            }
            JXPreDepositSelectModel *preDepositSelectModel=[JXPreDepositSelectModel modelWithJSON:blockDictionary];
            if (weakSelf.GetDataSource) {
            weakSelf.GetDataSource(preDepositSelectModel.paymentArr);
            }
            NSArray * dpFromResponse = [blockDictionary objectForKey:@"productList"];
            for (NSDictionary * attributes in dpFromResponse) {
                NSDictionary * butesdict = [XYCommon removeNull:attributes];
                XYPreDepositSelectModel * newModel = [XYPreDepositSelectModel mj_objectWithKeyValues:butesdict];
                
                [weakSelf.dataSource addObject:newModel];
            }
            
            [weakSelf.collectionView reloadData];
    
            
            if (weakSelf.delegate != nil && [self.delegate respondsToSelector:@selector(updateTableViewReloadData)]) {
                [weakSelf.delegate updateTableViewReloadData];
            }
            
            
        }

    }];
    
}




@end
