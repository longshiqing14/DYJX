//
//  JXClassificationCollectionCell.m
//  user
//
//  Created by 岩  熊 on 2018/1/24.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXClassificationCollectionCell.h"
#import "ShoppingCartTool.h"

@interface JXClassificationCollectionCell ()
@property (nonatomic, strong) UIView *lLine;//长
@property (nonatomic, strong) UIView *line;//短
@end
@implementation JXClassificationCollectionCell

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
        make.left.mas_equalTo(11);
        make.top.mas_equalTo(11);
        make.size.mas_equalTo(CGSizeMake(92, 91));
    }];
    
    [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsImageView.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(weakSelf.goodsImageView.mas_top).mas_equalTo(0);
        make.right.mas_equalTo(-14);
    }];
    //

    [self.cellDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.goodsNameLabel.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(weakSelf.goodsNameLabel.mas_bottom).mas_equalTo(9);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
        
        
    }];
    [self.cellDiscount cell_init];
    

    
    [self.shopCartBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(-5);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodsImageView.mas_right).with.offset(10);
        make.centerY.equalTo(weakSelf.shopCartBTN);
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

- (void)addToShopCart:(UIButton*)sender{
    if (self.ShopCartBtnClickBlock) {
        ;
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
//    CGPoint endPoint = CGPointMake( AutoSize(32), XYScreenH- AutoSize(58) - 64);
    
    
    CGPoint endPoints ;
    
        endPoints = CGPointMake(XYScreenW/8*5, XYScreenH-34);
        if (XYScreenH == 812) {
            endPoints = CGPointMake(XYScreenW/8*5, XYScreenH-34-30);
        }

    
    
    [ShoppingCartTool addToShoppingCartWithGoodsImage:self.goodsImageView.image
                                           startPoint:startPoint
                                             endPoint:endPoints
                                           completion:^(BOOL finished) {
                                               
                                           }];
    
}
@end
