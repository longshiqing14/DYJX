//
//  JXGoodsCubeCollectionViewCell.m
//  user
//
//  Created by 岩  熊 on 2017/11/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXGoodsCubeCollectionViewCell.h"
#import "ShoppingCartTool.h"
#import "JXTagCouponView.h"
#import "JXTagNormalView.h"
#import "JXDiscountView.h"

@interface JXGoodsCubeCollectionViewCell ()<TTGTagCollectionViewDelegate,TTGTagCollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray <UIView *>*viewTags;
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end

@implementation JXGoodsCubeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

-(void)setDataArray:(NSMutableArray<NSString *> *)dataArray{
    _dataArray=dataArray;
    [_cellDiscount setDataArray:dataArray];
}

- (void)initSubViews
{
    [self.contentView addSubview:self.goodsImageView];
    
    self.goodsNameLabel = [[UILabel alloc] init];
    self.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:13];
    self.goodsNameLabel.numberOfLines = 2;
    [self.contentView addSubview:self.goodsNameLabel];
    

////    [self.contentView addSubview:self.collectionView];
//    self.collectionView.backgroundColor = [UIColor redColor];
    
    self.goodsPriceLabel = [[UILabel alloc] init];
    self.goodsPriceLabel.textColor = [UIColor colorWithHexString:@"#FA5E71"];
    self.goodsPriceLabel.font = [UIFont fontWithName:@"PingFangSC-Medium"size:15];
    self.goodsPriceLabel.numberOfLines = 1;
    [self.contentView addSubview:self.goodsPriceLabel];
    

    
    [self.contentView addSubview:self.shopCartBTN];
    
    [self.contentView addSubview:self.cellDiscount];
    NSLog(@"%@",self.dataArray);
    self.cellDiscount.dataArray=self.dataArray;
    
    [self layoutIfNeeded];
}

-(JXDiscountView *)cellDiscount{
    if (!_cellDiscount) {
        _cellDiscount=[[[NSBundle mainBundle]loadNibNamed:@"JXDiscountView" owner:self options:nil]lastObject];
        _cellDiscount.userInteractionEnabled = NO;
    }
    return _cellDiscount;
}

- (void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(AutoSize(167));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_left).mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_bottom).mas_equalTo(11);
    }];
    
    
    [self.cellDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
          make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(9);
          make.right.mas_equalTo(0);
             make.height.mas_equalTo(30);
        
        
    }];
    [self.cellDiscount cell_init];
    [self.goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.cellDiscount.mas_bottom);
        make.height.mas_equalTo(30);
    }];
    
    [self.shopCartBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-11);
        make.top.mas_equalTo(weakSelf.cellDiscount.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(41, 20));
    }];
    

    
    
    
}



- (UIImageView *)goodsImageView{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc]init];
    }
    return _goodsImageView;
}

- (UILabel *)goodsNameLabel{
    if (!_goodsNameLabel) {
        _goodsNameLabel = [[UILabel alloc]init];
    }
    return _goodsNameLabel;
}

- (UILabel *)goodsPriceLabel{
    if (!_goodsPriceLabel) {
        _goodsPriceLabel = [[UILabel alloc]init];
    }
    return _goodsPriceLabel;
}
- (UIButton *)shopCartBTN{
    if (!_shopCartBTN) {
        _shopCartBTN = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [_shopCartBTN setBackgroundImage:[UIImage imageNamed:@"home_cell_btn_buy"] forState:UIControlStateNormal];
    [_shopCartBTN addTarget:self action:@selector(addToShopCart:) forControlEvents:(UIControlEventTouchUpInside)];
    return _shopCartBTN;
}

//- (TTGTextTagCollectionView *)tagCollectionView{
//    if (!_tagCollectionView) {
//        _tagCollectionView = [[TTGTextTagCollectionView alloc]init];
//        _tagCollectionView.enableTagSelection = NO;
//    }
//    return _tagCollectionView;
//}

- (TTGTagCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[TTGTagCollectionView alloc]init];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.horizontalSpacing = 1.;
        _collectionView.verticalSpacing = 1.;
    }
    return _collectionView;
    
}

//- (NSMutableArray<NSString *> *)dataArray{
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray arrayWithObjects:@"满减",@"满赠",@"券", nil];
//    }
//    return _dataArray;
//}

- (void)addToShopCart:(UIButton*)sender{
    if (self.ShopCartBtnClickBlock) {
        
        if (self.ShopCartBtnClickBlock(sender) == nil) {
            NSLog(@"点击加入购物车");
            [self addCartAnimation];
        }
        
    }
    
}

/** 添加 购物车的动画 */
- (void)addCartAnimation
{
    //     10*7     8*5;
    
    CGPoint startPoint = [self convertPoint:self.shopCartBTN.center toView:XYKeyWindow.rootViewController.view];
    CGPoint endPoint = CGPointMake(kScreenWidth - AutoSize(32), XYScreenH- AutoSize(58) - 64);
    
    
    [ShoppingCartTool addToShoppingCartWithGoodsImage:self.goodsImageView.image
                                           startPoint:startPoint
                                             endPoint:endPoint
                                           completion:^(BOOL finished) {
                                               
                                           }];
    
}

-(NSMutableArray *)viewTags{
    if (!_viewTags) {
        _viewTags=[[NSMutableArray alloc]initWithObjects:[self newButtonWithTitle:@"1" fontSize:14 backgroundColor:[UIColor blackColor]], nil];
    }
    return _viewTags;
}

#pragma mark - TTGTagCollectionViewDelegate

- (CGSize)tagCollectionView:(TTGTagCollectionView *)tagCollectionView sizeForTagAtIndex:(NSUInteger)index {
    NSLog(@"%f  ,%f",self.viewTags[index].frame.size.height,self.viewTags[index].frame.size.width);
    NSLog(@"%f    %f,",self.viewTags[index].frame.origin.y,self.viewTags[index].frame.origin.x);
    return self.viewTags[index].frame.size;
}

- (void)tagCollectionView:(TTGTagCollectionView *)tagCollectionView didSelectTag:(UIView *)tagView atIndex:(NSUInteger)index {
//    _logLabel.text = [NSString stringWithFormat:@"Tap tag: %@, at: %ld", tagView.class, (long) index];
    NSLog(@"----");
}

#pragma mark - TTGTagCollectionViewDataSource

- (NSUInteger)numberOfTagsInTagCollectionView:(TTGTagCollectionView *)tagCollectionView {
    return self.viewTags.count;
    
}

- (UIView *)tagCollectionView:(TTGTagCollectionView *)tagCollectionView tagViewForIndex:(NSUInteger)index {
     if ([self.dataArray[index] isEqualToString:@"券"]) {
     }
    
    return self.viewTags[index];
}


- (UIButton *)newButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroudColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroudColor;
    [button sizeToFit];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;
    
    [self expandSizeForView:button extraWidth:12 extraHeight:8];
    button.backgroundColor=[UIColor whiteColor];
    [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark - Action

- (void)onTap:(UIButton *)button {
//    _logLabel.text = @"Tap tag button !";
    NSLog(@"----");
}

- (void)expandSizeForView:(UIView *)view extraWidth:(CGFloat)extraWidth extraHeight:(CGFloat)extraHeight {
    CGRect frame = view.frame;
    frame.size.width += extraWidth;
    frame.size.height += extraHeight;
    view.frame = frame;
}

//#pragma TTGTagCollectionViewDataSource
//- (NSUInteger)numberOfTagsInTagCollectionView:(TTGTagCollectionView *)tagCollectionView{
//    return self.dataArray.count;
//}
//
//- (UIView *)tagCollectionView:(TTGTagCollectionView *)tagCollectionView tagViewForIndex:(NSUInteger)index{
//
//    if ([self.dataArray[index] isEqualToString:@"券"]) {
////        JXTagCouponView *couponView = [[NSBundle mainBundle] loadNibNamed:@"JXTagCouponView" owner:self options:nil].firstObject;
//        UIView *couponView = [[UIView alloc]init];
//        couponView.backgroundColor = [UIColor blackColor];
//      return couponView;
//    }else{
////        JXTagNormalView *normalView = [[NSBundle mainBundle] loadNibNamed:@"JXTagNormalView" owner:self options:nil].firstObject;
////        normalView.contentLb.text = self.dataArray[index];
//        UIView *normalView = [[UIView alloc]init];
//        normalView.backgroundColor = [UIColor blackColor];
//      return normalView;
//    }
//}
//
//- (CGSize)tagCollectionView:(TTGTagCollectionView *)tagCollectionView sizeForTagAtIndex:(NSUInteger)index{
//
//    if ([self.dataArray[index] isEqualToString:@"券"]) {
//        return CGSizeMake(22, 18);
//    }else{
//        return [YWDTools getSizeWithText:self.dataArray[index]];
//    }
//}
@end
