//
//  XYHomeButtonCVC.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeButtonCVC.h"

#import "XYHomeButtonCVCell.h"
#import "XYHomeButtonModel.h"

@interface XYHomeButtonCVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYHomeButtonCVC

static NSString * const reuseIdentifier = @"Cell";

const CGFloat home_button_height = 100.0;

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
    
    
    
    [self.collectionView registerClass:[XYHomeButtonCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

    [self updateDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 懒加载

- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)updateDataSource
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    
    NSMutableArray * array = [NSMutableArray array];
    
    [array addObject:@{@"image":@"",@"title":@"我常卖",@"type":@"1"}];
    [array addObject:@{@"image":@"",@"title":@"热销商品",@"type":@"2"}];
    [array addObject:@{@"image":@"",@"title":@"预存活动",@"type":@"3"}];
    [array addObject:@{@"image":@"",@"title":@"我的订单",@"type":@"4"}];
    
    for (NSDictionary * dict in array) {
        XYHomeButtonModel * model = [[XYHomeButtonModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        
        [self.dataSource addObject:model];
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYHomeButtonCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    XYHomeButtonModel * model = self.dataSource[indexPath.item];
    
    cell.backgroundColor = XYRGBColor(random()%255, random()%255, random()%255);
    cell.iconImageView.backgroundColor = XYRGBColor(random()%255, random()%255, random()%255);
    
    cell.titleLB.text = model.title;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((XYScreenW -40)/4, home_button_height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
