//
//  JXFoodCell.m
//  user
//
//  Created by 岩  熊 on 2017/12/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "DYJXIdentitySwitchingCell.h"
#import "ShoppingCartTool.h"

@interface DYJXIdentitySwitchingCell ()
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end

@implementation DYJXIdentitySwitchingCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubViews];
    }
    return self;
}

-(JXDiscountView *)cellDiscount{
    if (!_cellDiscount) {
        _cellDiscount=[[[NSBundle mainBundle]loadNibNamed:@"JXDiscountView" owner:self options:nil] lastObject];
        _cellDiscount.userInteractionEnabled = NO;
    }
    return _cellDiscount;
}

- (void)initSubViews
{
    
    
    self.goodsNameLabel = [[UILabel alloc] init];
    self.goodsNameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    self.goodsNameLabel.font = [UIFont systemFontOfSize:14];
    self.goodsNameLabel.numberOfLines = 2;
   
    self.goodsPriceLabel = [[UILabel alloc] init];
    self.goodsPriceLabel.textColor = XYMainColor;
    self.goodsPriceLabel.font = [UIFont systemFontOfSize:15];
    self.goodsPriceLabel.numberOfLines = 1;
    
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
    self.line.backgroundColor = [UIColor colorWithHexString:@"#E4E4E4"];
    [self.contentView addSubview:self.line];
   
    
    
    
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
    [self.contentView addSubview:self.goodsImageView];
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(11);
        make.size.mas_equalTo(CGSizeMake(92, 91));
    }];
    
    [self.contentView addSubview:self.goodsNameLabel];
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(0);
        make.right.mas_equalTo(-14);
    }];
    //
    //    [self.tagCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
    //        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(9);
    ////        make.width.mas_equalTo(kScreenWidth - 125);
    //        make.height.mas_equalTo(18);
    //    }];
    
    [self.contentView addSubview:self.sellingPointLable];
    [self.sellingPointLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(5);
        make.right.mas_equalTo(0);
    }];
    
    [self.contentView addSubview:self.cellDiscount];
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

    
    [self.contentView addSubview:self.shopCartBTN];
    [self.shopCartBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.contentView addSubview:self.goodsPriceLabel];
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
- (UIButton *)shopCartBTN{
    if (!_shopCartBTN) {
        _shopCartBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    }
//    [_shopCartBTN setBackgroundImage:[UIImage imageNamed:@"home_cell_btn_buy"] forState:UIControlStateNormal];
    [_shopCartBTN setImage:SETIMAGENAME(@"home_cell_btn_buy") forState:UIControlStateNormal];
    [_shopCartBTN addTarget:self action:@selector(addToShopCart:) forControlEvents:(UIControlEventTouchUpInside)];
    return _shopCartBTN;
}

- (UILabel *)sellingPointLable{
    if (!_sellingPointLable) {
        _sellingPointLable = [[UILabel alloc]init];
    }
    return _sellingPointLable;
}

@end
