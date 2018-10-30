//
//  XYHomeHotGoodsCVCell.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeHotGoodsCVCell.h"

#import "XYGoodsDetailModel.h"

#import "XYShoppingCartNet.h" // 购物车 请求

#import "ShoppingCartTool.h"  //加入 购物车动画

@implementation XYHomeHotGoodsCVCell

static CGFloat const sellOutHeight = 56;


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.iconImageView addSubview:self.sellOutLB];
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.priceLB];
        
        [self.contentView addSubview:self.editShoppingCartView];
        
        [self.contentView addSubview:self.addBT];
        [self.iconImageView addSubview:self.markLocinImageView];
    }
    return self;
}


- (void)setDetailModel:(XYGoodsDetailModel *)detailModel
{
    _detailModel = detailModel;
    
    if ([_detailModel.sellableCount isEqualToString:@"0"] || _detailModel.sellableCount == nil) {
        self.sellOutLB.hidden = NO;
        self.editShoppingCartView.hidden = YES;
        
    }else{
        self.sellOutLB.hidden = YES;
        self.editShoppingCartView.hidden = NO;
    }
    
    
    [self updateCellLayout];
}

- (void)updateCellLayout
{
    NSLog(@"%@",_detailModel.logo);
    NSLog(@"%@",_detailModel.productName);
    NSLog(@"%@",_detailModel.memberPrice);
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_detailModel.logo] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.markLocinImageView.image=[UIImage imageNamed:@"home_mark_Image"];
    self.titleLB.text = _detailModel.productName;
    
    self.priceLB.text = [NSString stringWithFormat:@"￥%@",_detailModel.memberPrice];
    
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.bottom.mas_equalTo(-80);
    }];
//    self.markLocinImageView.backgroundColor=[UIColor redColor];
    [self.markLocinImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.width.mas_equalTo(33);
        make.height.mas_equalTo(36);
    }];
    [self.sellOutLB mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(_iconImageView.center);
        make.centerX.mas_equalTo(_iconImageView.mas_centerX);
        make.centerY.mas_equalTo(_iconImageView.mas_centerY);
        make.width.height.mas_equalTo(sellOutHeight);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_iconImageView.mas_bottom).offset(5);
        make.height.mas_equalTo(30);
    }];
    
    [self.priceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(-15);
    }];
    
    CGFloat editViewHeight = 23;
    CGFloat editViewWidth = 23;

    [self.editShoppingCartView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(editViewHeight);
        make.width.mas_equalTo(editViewWidth);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.addBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.width.height.mas_equalTo(40);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];

}

-(UIImageView *)markLocinImageView{
    if (!_markLocinImageView) {
        _markLocinImageView=[[UIImageView alloc]init];
//        _markLocinImageView.frame=CGRectMake(0, 0, 100, 100);
        
    }
    return _markLocinImageView;
}

#pragma mark - button click

/** 添加按钮 点击事件 */
- (void)addButtonClick:(UIButton*)sender
{
    if ([_detailModel.sellableCount isEqualToString:@"0"] || _detailModel.sellableCount == nil) {
        return;
    }
    
    WeakSelf;
    [XYShoppingCartNet netCartAddWithProductId:_detailModel.productId block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
            [weakSelf addCartAnimation];
            XYLog(@" ShoppingCart  %@  ",blockDictionary);
        }
        
        
    }];
    
}

#pragma mark - 动画
/** 添加 购物车的动画 */
- (void)addCartAnimation
{
//     10*7     8*5;
    
    CGPoint startPoint = [self convertPoint:self.addBT.center toView:XYKeyWindow.rootViewController.view];
    CGPoint endPoint = CGPointMake(XYScreenW/8*5, XYScreenH-30);
    
    if (XYScreenH == 812) {
        endPoint = CGPointMake(XYScreenW/8*5, XYScreenH-34-30);
    }
    
    [ShoppingCartTool addToShoppingCartWithGoodsImage:self.iconImageView.image
                                           startPoint:startPoint
                                             endPoint:endPoint
                                           completion:^(BOOL finished) {
    
                                           }];
}

#pragma mark - 懒加载

- (UIImageView*)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _iconImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_12;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        
        _titleLB.numberOfLines = 0;
        
    }
    return _titleLB;
}

//- (UILabel*)weightLB
//{
//    if (_weightLB == nil) {
//        _weightLB = [[UILabel alloc]initWithFrame:CGRectZero];
//        
//        _weightLB.font = XYFont_12;
//        _weightLB.textAlignment = NSTextAlignmentCenter;
//        _weightLB.textColor = XYGrayColor;
//        
//    }
//    return _weightLB;
//}

- (UILabel*)priceLB
{
    if (_priceLB == nil) {
        _priceLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _priceLB.font = XYFont_14;
        _priceLB.textAlignment = NSTextAlignmentLeft;
        _priceLB.textColor = XYMainColor;
        
    }
    return _priceLB;
}

- (UILabel*)sellOutLB
{
    if (_sellOutLB == nil) {
        _sellOutLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _sellOutLB.text = @"已售罄";
        _sellOutLB.backgroundColor = XYFontTitleColor;
        _sellOutLB.alpha = 0.8;
        
        _sellOutLB.layer.masksToBounds = YES;
        _sellOutLB.layer.cornerRadius = sellOutHeight/2;
        
        _sellOutLB.font = XYFont_14;
        _sellOutLB.textAlignment = NSTextAlignmentCenter;
        _sellOutLB.textColor = XYWhiteColor;
        
    }
    return _sellOutLB;
}



- (UIImageView*)editShoppingCartView
{
    if (_editShoppingCartView == nil) {
        _editShoppingCartView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        _editShoppingCartView.image = [UIImage imageNamed:@"home_cell_btn_buy"];
//        _editShoppingCartView.layer.cornerRadius = 5;
//        _editShoppingCartView.layer.masksToBounds = YES;
//        
//        _editShoppingCartView.layer.borderWidth = 0.5;
//        _editShoppingCartView.layer.borderColor = XYLineColor.CGColor;
    }
    return _editShoppingCartView;
}

- (UIButton*)addBT
{
    if (_addBT == nil) {
        _addBT = [[UIButton alloc]initWithFrame:CGRectZero];
        
//        [_addBT setImage:[UIImage imageNamed:@"home_cell_btn_add"] forState:UIControlStateNormal];
        
        [_addBT addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBT;
}




@end
