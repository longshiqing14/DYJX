//
//  XYGoodsSearchResultTVCell.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsSearchResultTVCell.h"

#import "XYGoodsSearchResultModel.h"

@interface XYGoodsSearchResultTVCell ()

/** 商品名称 */
@property (strong,nonatomic ) UILabel     * titleLB;
/** 商品图片 */
@property (nonatomic, strong) UIImageView * iconImageView;
/** 现价 */
@property (nonatomic, strong) UILabel     * priceLB;


/** 修改数量的容器视图 */
@property (nonatomic, strong) UIImageView   * editBottomView;

/** 增加数量btn */
@property (nonatomic, strong) UIButton      * addBT;


@end

@implementation XYGoodsSearchResultTVCell

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
        
        
        [self.contentView addSubview:self.editBottomView];
        
        [self.editBottomView addSubview:self.addBT];
        
     
        
    }
    return self;
}


- (void)setSearchResultModel:(XYGoodsSearchResultModel *)searchResultModel
{
    _searchResultModel = searchResultModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_searchResultModel.logo] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.titleLB.text = _searchResultModel.title;
    self.priceLB.text = [NSString stringWithFormat:@"￥%@",_searchResultModel.memberPrice];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
  
    
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    
    [self.priceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_iconImageView.mas_bottom);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
    }];
    
    
    CGFloat editViewHeiht = 30;
    CGFloat editViewWidth = 30;
    
    [self.editBottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(editViewWidth);
        make.height.mas_equalTo(editViewHeiht);
        make.bottom.mas_equalTo(-15);
    }];
    
    [self.addBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(editViewHeiht);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    

}


/** 调整商品数量 */
- (void)changeAmounts:(UIButton*)sender
{

    
}


#pragma mark - 懒加载


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
        
        _titleLB.textColor     = XYFontTitleColor;
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.numberOfLines = 0;
    }
    return _titleLB;
}

- (UILabel *)priceLB {
    if (_priceLB == nil) {
        _priceLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _priceLB.font          = XYFont_15;
        _priceLB.textAlignment = NSTextAlignmentLeft;
        _priceLB.contentMode   = UIViewContentModeBottom;
        _priceLB.textColor     = XYMainColor;
        
    }
    return _priceLB;
}



- (UIImageView *)editBottomView {
    if (_editBottomView == nil) {
        _editBottomView                 = [[UIImageView alloc] initWithFrame:CGRectZero];
        //        _editBottomView.image = [UIImage imageNamed:@"gouwuche_bg"];
        _editBottomView.userInteractionEnabled = YES;
        
        _editBottomView.layer.borderWidth = 0.5;
        _editBottomView.layer.borderColor = XYLineColor.CGColor;
        
        _editBottomView.layer.cornerRadius = 5;
        _editBottomView.layer.masksToBounds = YES;
        
    }
    return _editBottomView;
}


- (UIButton *)addBT {
    if (_addBT == nil) {
        _addBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBT.frame = CGRectZero;
        
        [_addBT setImage:[UIImage imageNamed:@"home_cell_btn_buy"] forState:UIControlStateNormal];
        
        [_addBT addTarget:self action:@selector(changeAmounts:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _addBT;
}




#pragma mark - 创建 cell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYGoodsSearchResultTVCell";
    XYGoodsSearchResultTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYGoodsSearchResultTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
