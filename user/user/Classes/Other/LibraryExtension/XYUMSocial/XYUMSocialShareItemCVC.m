//
//  XYUMSocialShareItemCVC.m
//  user
//
//  Created by xingyun on 2017/9/26.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYUMSocialShareItemCVC.h"

#import "XYUMSocialShareItemCVCell.h"
#import "XYUMSocialShareItemModel.h"

@interface XYUMSocialShareItemCVC ()

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation XYUMSocialShareItemCVC

static NSString * const reuseIdentifier = @"Cell";

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
    
    self.collectionView.backgroundColor = XYGlobalBg;
    
    [self.collectionView registerClass:[XYUMSocialShareItemCVCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self updateDataSource];
    
    // Do any additional setup after loading the view.
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
    
    [array addObject:@{@"image":@"icon_share_weixin",@"title":@"微信好友",@"type":@"1"}];
    [array addObject:@{@"image":@"icon_share_pyq",@"title":@"朋友圈",@"type":@"2"}];
    [array addObject:@{@"image":@"icon_share_copy",@"title":@"复制链接",@"type":@"3"}];
    
    for (NSDictionary * dict in array) {
        XYUMSocialShareItemModel * model = [[XYUMSocialShareItemModel alloc]init];
        
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
    XYUMSocialShareItemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    XYUMSocialShareItemModel * model = self.dataSource[indexPath.item];
    
    cell.iconImageView.image = [UIImage imageNamed:model.image];
    cell.titleLB.text = model.title;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((XYScreenW )/3, 128);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 0, 1, 0);
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
    
    XYUMSocialShareItemModel * model = self.dataSource[indexPath.item];
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(XYUMSocialShareItemSelect:)]) {
        [self.delegate XYUMSocialShareItemSelect:model.type];
    }
    
    
    
}


@end
