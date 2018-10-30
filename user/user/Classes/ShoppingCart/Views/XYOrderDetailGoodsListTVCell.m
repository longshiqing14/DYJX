//
//  XYOrderDetailGoodsListTVCell.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailGoodsListTVCell.h"

#import "XYOrderDetailGoodsListModel.h" // 提交订单 model

#import "XYOrderDetailModel.h" // 订单详情 model

@interface XYOrderDetailGoodsListTVCell ()

/** 商品名称 */
@property (strong,nonatomic ) UILabel     * titleLB;
/** 商品图片 */
@property (nonatomic, strong) UIImageView * iconImageView;
/** 价格 */
@property (nonatomic, strong) UILabel     * priceLB;
/** 购买数量 */
@property (nonatomic, strong) UILabel     * buyNumLB;
//水印
@property(nonatomic,strong)UIImageView *markImageView;

@property(nonatomic,strong)UILabel *unitPriceLB;

@end

@implementation XYOrderDetailGoodsListTVCell

static CGFloat const iconImageHeight = 90;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = [UIColor whiteColor];
        //        self.accessoryType   = UITableViewCellAccessoryNone;
        
        
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.priceLB];

        [self.contentView addSubview:self.buyNumLB];
        
        [self.iconImageView addSubview:self.markImageView];
        [self.contentView addSubview:self.unitPriceLB];
    }
    return self;
}

/** 提交 */
- (void)setListModel:(XYOrderDetailGoodsListModel *)listModel
{
    _listModel = listModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_listModel.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.titleLB.text = _listModel.productName;
    
    self.priceLB.text = [NSString stringWithFormat:@"￥%@",_listModel.unitDiscountedPrice];
    
    self.buyNumLB.text = [NSString stringWithFormat:@"X%@",_listModel.amount];
//     self.unitPriceLB.text = [NSString stringWithFormat:@"￥%@",_listModel.unitPrice];
//    NSLog(@"%@",_listModel.unitPrice);
//    self.unitPriceLB.backgroundColor=[UIColor redColor];
    if (_listModel.marketUnitPrice&&![_listModel.marketUnitPrice isEqualToString:_listModel.unitDiscountedPrice]&&![_listModel.marketUnitPrice isEqualToString:@"null"]) {
        NSString *unitPriceStr=[NSString stringWithFormat:@" ￥%@ ",_listModel.marketUnitPrice];
        //中划线
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:unitPriceStr attributes:attribtDic];
        
        // 赋值
        self.unitPriceLB.attributedText = attribtStr;
    }
    
  
}

/** 详情 */
- (void)setDetailModel:(XYOrderDetailItemListModel *)detailModel
{
    _detailModel = detailModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_detailModel.logo] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.titleLB.text = _detailModel.name;
    
    self.priceLB.text = [NSString stringWithFormat:@"￥%@",_detailModel.unitDiscountedPrice];

    NSLog(@"%@",_detailModel.unitDiscountedPrice);
    self.buyNumLB.text = [NSString stringWithFormat:@"X%@",_detailModel.amount];
    
    if (_detailModel.marketUnitPrice&&![_detailModel.unitPrice isEqualToString:_detailModel.marketUnitPrice]&&![_detailModel.marketUnitPrice isEqualToString:@"null"]) {
        NSString *unitPriceStr=[NSString stringWithFormat:@" ￥%@ ",_detailModel.marketUnitPrice];
        //中划线
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:unitPriceStr attributes:attribtDic];
        
        // 赋值
        self.unitPriceLB.attributedText = attribtStr;
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    [self.markImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(22, 24));
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(35);
    }];
    
    [self.priceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_iconImageView.mas_bottom);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
    }];
    
    [self.buyNumLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(_iconImageView.mas_bottom);
    }];
    [self.unitPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_priceLB.mas_bottom);
        make.width.mas_equalTo(_priceLB.mas_width).offset(10);
        make.left.mas_equalTo(_priceLB.mas_right).offset(10);
    }];
}


#pragma mark - 懒加载

-(UILabel *)unitPriceLB{
    if (!_unitPriceLB) {
        _unitPriceLB=[[UILabel alloc]init];
        _unitPriceLB.font          = [UIFont systemFontOfSize:12];
        _unitPriceLB.textAlignment = NSTextAlignmentLeft;
        _unitPriceLB.textColor     = XYRGBAColor(153, 153, 153, 1);
    }
    return _unitPriceLB;
}

-(UIImageView *)markImageView{
    if (!_markImageView) {
        _markImageView=[[UIImageView alloc]init];
        _markImageView.image=[UIImage imageNamed:@"home_mark_Image"];
    }
    return _markImageView;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        _iconImageView.layer.borderWidth = 0.5;
        _iconImageView.layer.borderColor = XYLineColor.CGColor;
        
        _iconImageView.layer.cornerRadius = 5;
        _iconImageView.layer.masksToBounds = YES;
        
    }
    return _iconImageView;
}

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYBlackColor;
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.numberOfLines = 2;
    }
    return _titleLB;
}

- (UILabel *)priceLB {
    if (_priceLB == nil) {
        _priceLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _priceLB.font          = XYFont_14;
        _priceLB.textAlignment = NSTextAlignmentLeft;
        _priceLB.textColor     = XYMainColor;
        
    }
    return _priceLB;
}

- (UILabel *)buyNumLB {
    if (_buyNumLB == nil) {
        _buyNumLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _buyNumLB.font          = XYFont_14;
        _buyNumLB.textAlignment = NSTextAlignmentRight;
        _buyNumLB.textColor     = XYBlackColor;
        
    }
    return _buyNumLB;
}








#pragma mark - 创建 cell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderDetailGoodsListTVCell";
    XYOrderDetailGoodsListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYOrderDetailGoodsListTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
