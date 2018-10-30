//
//  JXGoodsTableCollectionViewCell.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXGoodsTableCollectionViewCell.h"
#import "ShoppingCartTool.h"

@interface JXGoodsTableCollectionViewCell ()
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end

@implementation JXGoodsTableCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

-(JXDiscountView *)cellDiscount{
    if (!_cellDiscount) {
        _cellDiscount=[[[NSBundle mainBundle]loadNibNamed:@"JXDiscountView" owner:self options:nil]lastObject];
        _cellDiscount.userInteractionEnabled = NO;
    }
    return _cellDiscount;
}

- (void)initSubViews
{
    [self.contentView addSubview:self.goodsImageView];
    
    self.goodsNameLabel = [[UILabel alloc] init];
    self.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:13];
    self.goodsNameLabel.numberOfLines = 2;
    [self.contentView addSubview:self.goodsNameLabel];
    
    self.goodsPriceLabel = [[UILabel alloc] init];
    self.goodsPriceLabel.textColor = [UIColor colorWithHexString:@"EC3A2D"];
    self.goodsPriceLabel.font = [UIFont systemFontOfSize:15];
    self.goodsPriceLabel.numberOfLines = 1;
    [self.contentView addSubview:self.goodsPriceLabel];
    
    self.sellingPointLable.textColor = [UIColor colorWithHexString:@"999999"];
    self.sellingPointLable.font = [UIFont systemFontOfSize:12];
    self.sellingPointLable.numberOfLines = 1;
    
//    [self.contentView addSubview:self.tagCollectionView];
//    [self.tagCollectionView removeAllTags];
//    //    [self.tagCollectionView addTags:@[@"折",@"包邮"]];
//    self.tagCollectionView.defaultConfig.tagTextFont = [UIFont systemFontOfSize:10];
//    self.tagCollectionView.defaultConfig.tagTextColor = [UIColor colorWithHexString:@"#FA5E71"];
//    self.tagCollectionView.defaultConfig.tagBorderColor = [UIColor colorWithHexString:@"#FA5E71"];
//    self.tagCollectionView.defaultConfig.tagCornerRadius = 2;
//    self.tagCollectionView.defaultConfig.tagBorderWidth = 0.5;
//    self.tagCollectionView.defaultConfig.tagBackgroundColor = [UIColor whiteColor];
//    self.tagCollectionView.defaultConfig.tagExtraSpace = CGSizeMake(3, 1);
//    self.tagCollectionView.horizontalSpacing = 2.5;
//    self.tagCollectionView.defaultConfig.tagShadowOffset = CGSizeMake(0, 0);
//    self.tagCollectionView.defaultConfig.tagShadowColor = [UIColor clearColor];
//    self.tagCollectionView.delegate = self;
//    self.tagCollectionView.data
//    [self.contentView addSubview:self.couponView];
    
    self.line = [[UIView alloc] init];
    self.line.backgroundColor = [UIColor colorWithHexString:@"#D8D8D8"];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.cellDiscount];
    [self.contentView addSubview:self.shopCartBTN];
    
    
    
    [self layoutIfNeeded];
}

-(void)setDataArray:(NSMutableArray<NSString *> *)dataArray{
    _dataArray=dataArray;
    [_cellDiscount setDataArray:dataArray];
}

- (void)layoutSubviews
{
    WeakSelf
    [super layoutSubviews];
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(11);
        make.size.mas_equalTo(CGSizeMake(92, 91));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(0);
        make.right.mas_equalTo(-14);
    }];
    
    [self.contentView addSubview:self.sellingPointLable];
    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(5);
        make.right.mas_equalTo(0);
    }];
//
//    [self.tagCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
//        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(9);
////        make.width.mas_equalTo(kScreenWidth - 125);
//        make.height.mas_equalTo(18);
//    }];
    [self.cellDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.sellingPointLable.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.sellingPointLable.mas_bottom).mas_equalTo(8);
        make.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
       
        
    }];
     [self.cellDiscount cell_init];
//    [self.couponView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(weakSelf.tagCollectionView.mas_right).mas_equalTo(0);
//        make.height.mas_equalTo(17);
//        make.width.mas_equalTo(21);
//        make.top.mas_equalTo(weakSelf.tagCollectionView.mas_top).mas_equalTo(0);
//    }];
    


    [self.shopCartBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(-5);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodsImageView.mas_right).with.offset(10);
        make.centerY.mas_equalTo(weakSelf.shopCartBTN);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.contentView).with.offset(0);
        make.height.mas_equalTo(0.5);
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

- (UILabel *)sellingPointLable{
    if (!_sellingPointLable) {
        _sellingPointLable = [[UILabel alloc]init];
    }
    return _sellingPointLable;
}

- (UIButton *)shopCartBTN{
    if (!_shopCartBTN) {
        _shopCartBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    }
//    [_shopCartBTN setBackgroundImage:[UIImage imageNamed:@"home_cell_btn_buy"] forState:UIControlStateNormal];
    [_shopCartBTN setImage:SETIMAGENAME(@"home_cell_btn_buy") forState:UIControlStateNormal];
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

//- (UIButton *)couponView{
//    if (!_couponView) {
//        _couponView = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        [_couponView setBackgroundImage:[UIImage imageNamed:@"ic_prolist_ticket"] forState:(UIControlStateNormal) ];
//        [_couponView setTitle:@"券" forState:UIControlStateNormal];
//        [_couponView setTintColor:[UIColor colorWithHexString:@"#EC3B2C"]];
//        [_couponView.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:12]];
//    }
//    return _couponView;
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
    CGPoint endPoint = CGPointMake( AutoSize(32), XYScreenH- AutoSize(58) - 64);
    
    
    [ShoppingCartTool addToShoppingCartWithGoodsImage:self.goodsImageView.image
                                           startPoint:startPoint
                                             endPoint:endPoint
                                           completion:^(BOOL finished) {
                                               
                                           }];

}

@end
