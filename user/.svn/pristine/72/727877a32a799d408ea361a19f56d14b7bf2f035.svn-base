//
//  XYShoppingCartTVCell.m
//  user
//
//  Created by xingyun on 2017/9/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYShoppingCartTVCell.h"
#import "XYShoppingCartTotalModel.h"
#import "XYShopingCartListModel.h"
#import "NSString+Tool.h"

#import "XYShoppingCartNet.h" // 购物车 请求

#import "XYLocalCheck.h" //验证

@interface XYShoppingCartTVCell () <UITextFieldDelegate>

/** 选择按钮 */
@property (strong,nonatomic ) UIButton    * selectBT;
/** 选择按钮 */
@property (strong,nonatomic ) UIImageView * selectImageView;
/** 商品名称 */
@property (strong,nonatomic ) UILabel     * titleLB;
/** 商品图片 */
@property (nonatomic, strong) UIImageView * iconImageView;
/** 现价 */
@property (nonatomic, strong) UILabel     * priceLB;
//折后价格
@property(nonatomic,strong)UILabel *unitDealPriceLB;


//水印
@property(nonatomic,strong)UIImageView *markImageView;

/** 修改数量的容器视图 */
@property (nonatomic, strong) UIImageView   * editBottomView;
/** 减少数量btn */
@property (nonatomic, strong) UIButton      * minusBT;
/** 增加数量btn */
@property (nonatomic, strong) UIButton      * addBT;

/** 购买数量 UITextField */
@property (nonatomic, strong) UITextField   * buyNumTF;

/** 删除按钮 */
@property (nonatomic, strong) UIButton     * deleteBT;

/** 异常 状态 商品 标签 */
@property (nonatomic, strong) UILabel * stateLB;



@end

@implementation XYShoppingCartTVCell

static CGFloat const selectBTHeight = 20;
static CGFloat const iconImageHeight = 90;



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = [UIColor whiteColor];
//        self.accessoryType   = UITableViewCellAccessoryNone;
        [self.contentView addSubview:self.uplineImageView];
        [self.contentView addSubview:self.downlineImageView];

        [self.contentView addSubview:self.selectImageView];
        
        [self.contentView addSubview:self.selectBT];
        
        [self.contentView addSubview:self.iconImageView];
        
        [self.iconImageView addSubview:self.stateLB];
        
        [self.iconImageView addSubview:self.markImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.priceLB];
        
        
        [self.contentView addSubview:self.editBottomView];
        
        [self.editBottomView addSubview:self.addBT];
        
        [self.editBottomView addSubview:self.minusBT];
        
        [self.editBottomView addSubview:self.buyNumTF];
        [self.contentView addSubview:self.unitDealPriceLB];
        [self.contentView addSubview:self.deleteBT];
        [self.contentView addSubview:self.lineLable];
    }
    return self;
}


-(UILabel *)lineLable{
    if (!_lineLable) {
        _lineLable=[[UILabel alloc]init];
//        _lineLable.backgroundColor=XYRGBAColor(244, 244, 244, 0.5);
        
        
    }
    return _lineLable;
    
}

-(UILabel *)unitDealPriceLB{
    if (!_unitDealPriceLB) {
        _unitDealPriceLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _unitDealPriceLB.font          = [UIFont systemFontOfSize:11];
        _unitDealPriceLB.textAlignment = NSTextAlignmentLeft;
        _unitDealPriceLB.contentMode   = UIViewContentModeBottom;
        _unitDealPriceLB.textColor     = XYRGBAColor(153, 153, 153, 1);
    }
    return _unitDealPriceLB;
}


-(UIImageView *)uplineImageView{
    if (!_uplineImageView) {
        _uplineImageView=[[UIImageView alloc]init];
        _uplineImageView.image=SETIMAGENAME(@"ic_shop_line");
    }
    return _uplineImageView;
    
}

-(UIImageView *)downlineImageView{
    if (!_downlineImageView) {
        _downlineImageView=[[UIImageView alloc]init];
        _downlineImageView.image=SETIMAGENAME(@"ic_shop_line");
    }
    return _downlineImageView;
    
}

-(UIImageView *)markImageView{
    if (!_markImageView) {
        _markImageView=[[UIImageView alloc]init];
        _markImageView.image=[UIImage imageNamed:@"home_mark_Image"];
    }
    
    return _markImageView;
}

- (void)setCellType:(XYShoppingCartCellType)cellType
{
    _cellType = cellType;
    if (_cellType == XYShoppingCartCellType_default) {
        
        self.editBottomView.hidden = NO;
        self.addBT.hidden = NO;
        self.minusBT.hidden = NO;
        self.buyNumTF.hidden = NO;
        
    }else if (_cellType == XYShoppingCartCellType_edit){
        
        self.editBottomView.hidden = YES;
        self.addBT.hidden = YES;
        self.minusBT.hidden = YES;
        self.buyNumTF.hidden = YES;
    }
    
    [self updateSelectBTselected];
}


- (void)setCartListModel:(XYShopingCartListModel *)cartListModel
{
    _cartListModel = cartListModel;
    
    if ([_cartListModel.state isEqualToString:@"0"]) {
        
        self.stateLB.text = @"";
        
        self.stateLB.hidden = YES;
        self.deleteBT.alpha=0;
        
    }else{
        self.deleteBT.alpha=1;
        self.stateLB.text = _cartListModel.stateTip;
        
        self.stateLB.hidden = NO;
        
        self.editBottomView.hidden = YES;
        self.addBT.hidden = YES;
        self.minusBT.hidden = YES;
        self.buyNumTF.hidden = YES;
        
    }
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_cartListModel.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    
    self.titleLB.text = _cartListModel.productName;
    
    self.buyNumTF.text = _cartListModel.number;
////    优惠价
//    if (_cartListModel.unitDealPrice != nil || [_cartListModel.unitDealPrice isEqualToString:@""]) {
//        self.priceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.unitDealPrice];
//        NSLog(@"%@",_cartListModel.unitDealPrice);
//    }
//
//    NSLog(@"%@",_cartListModel.unitDealPrice);
////    原价
//    self.unitDealPriceLB.text=nil;
//    if (_cartListModel.unitPrice&&![_cartListModel.unitDealPrice isEqualToString:_cartListModel.unitPrice]&&![_cartListModel.unitPrice isEqualToString:@"null"]) {
//        NSString *unitDealPriceStr=[NSString stringWithFormat:@"￥%@",_cartListModel.unitPrice];
//        NSLog(@"%@",unitDealPriceStr);
//        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//        self.unitDealPriceLB.attributedText=[[NSMutableAttributedString alloc]initWithString:unitDealPriceStr attributes:attribtDic];
//    }
    NSLog(@"%@",_cartListModel.marketUnitPrice);
//    优惠价格
    NSLog(@"%@",_cartListModel.unitDiscountedPrice);
    self.priceLB.text=nil;
    self.unitDealPriceLB.text=nil;
    if (_cartListModel.unitDiscountedPrice&&![_cartListModel.unitDiscountedPrice isEqualToString:@"null"]) {
        self.priceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.unitDiscountedPrice];
        
    }
//    原价
    if (_cartListModel.marketUnitPrice&&![_cartListModel.marketUnitPrice isEqualToString:@"null"]) {
        if (![_cartListModel.marketUnitPrice isEqualToString:_cartListModel.unitDiscountedPrice]&&_cartListModel.unitDiscountedPrice&&![_cartListModel.unitDiscountedPrice isEqualToString:@"null"]) {
            NSString *unitDealPriceStr =  [NSString stringWithFormat:@"￥%@",_cartListModel.marketUnitPrice];
            NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)};
            self.unitDealPriceLB.attributedText=[[NSMutableAttributedString alloc]initWithString:unitDealPriceStr attributes:attribtDic];
        }else{
            self.priceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.marketUnitPrice];
        }
        
    }
    
    
    
    
    
    
    
    
    
    
//    if (_cartListModel.unitDealPrice&&![_cartListModel.unitDealPrice isEqualToString:_cartListModel.unitPrice]&&![_cartListModel.unitDealPrice isEqualToString:@"null"]) {
//        self.unitDealPriceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.unitDealPrice];
//    }
//
//    if (_cartListModel.unitPrice != nil || [_cartListModel.unitPrice isEqualToString:@""]) {
//        if (!_cartListModel.unitDealPrice||[_cartListModel.unitDealPrice isEqualToString:_cartListModel.unitPrice]||[_cartListModel.unitDealPrice isEqualToString:@"null"]) {
//            self.priceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.unitPrice];
//        }
//        else{
//            //        self.priceLB.text =  [NSString stringWithFormat:@"￥%@",_cartListModel.unitPrice];
//            NSString *unitDealPriceStr=[NSString stringWithFormat:@"￥%@",_cartListModel.unitPrice];
//            NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//            self.unitDealPriceLB.attributedText=[[NSMutableAttributedString alloc]initWithString:unitDealPriceStr attributes:attribtDic];
//        }
        
        
//            }

    
    

    [self updateSelectBTselected];
    
}


/**  */
- (void)updateSelectBTselected
{
    if (_cartListModel == nil) {
        return;
    }
    
    if ([_cartListModel.state isEqualToString:@"0"]) {
    
        if (_cellType == XYShoppingCartCellType_default) {
            if ([_cartListModel.checked isEqualToString:@"1"]) {
                self.selectImageView.image = [UIImage imageNamed:@"buy_icon_cir_pre"];
            }else{
                self.selectImageView.image = [UIImage imageNamed:@"buy_icon_cir"];
            }

        }else if (_cellType == XYShoppingCartCellType_edit){
            
            if (_cartListModel.selectEdit) {
                self.selectImageView.image = [UIImage imageNamed:@"buy_icon_cir_pre"];
            }else{
                self.selectImageView.image = [UIImage imageNamed:@"buy_icon_cir"];
            }
        }
    }else{
        self.selectImageView.image = [UIImage imageNamed:@"buy_icon_forbade"];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
//    self.selectImageView.backgroundColor=[UIColor greenColor];
    [self.selectImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(48);
        make.width.height.mas_equalTo(selectBTHeight);
    }];

    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10+ 10 + selectBTHeight);
        make.top.mas_equalTo(11);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    [self.markImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(22, 24));
        
    }];
//    self.selectBT.backgroundColor=[UIColor redColor];
    [self.selectBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(35);
        make.width.height.mas_equalTo(40);
    }];
    
    [self.stateLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImageView.mas_top);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];

   
    
    [self.unitDealPriceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_iconImageView.mas_bottom).offset(0);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(12);
    }];
    
    [self.priceLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_unitDealPriceLB.mas_top).offset(-5);
        make.left.mas_equalTo(_iconImageView.mas_right).offset(10);
    }];

    CGFloat editViewHeiht = 30;
    CGFloat editViewWidth = 100;
    [self.editBottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(editViewWidth);
        make.height.mas_equalTo(editViewHeiht);
        make.top.mas_equalTo(75);
    }];

    [self.addBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(editViewHeiht);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.minusBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(editViewHeiht);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];

    [self.buyNumTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_addBT.mas_left).offset(0);
        make.left.mas_equalTo(_minusBT.mas_right).offset(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.uplineImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(19);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(_selectImageView.mas_top);
//        make.height.mas_equalTo(50);
    }];
    [self.downlineImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(19);
        make.top.mas_equalTo(_selectImageView.mas_bottom);
        make.width.mas_equalTo(1);
        make.bottom.mas_equalTo(0);
    }];
//    self.deleteBT.backgroundColor=[UIColor redColor];
    [self.deleteBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.right.mas_equalTo(0).mas_offset(-10);
//        make.bottom.mas_equalTo(0);
    }];
    
    [self.lineLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(10);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0).mas_offset(5);
    }];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = textField.text.length - range.length + string.length;

    if (newLength > 3) {
        return NO;
    }
    
    NSMutableString * cellCount = [NSMutableString string];
    if (range.length >= 1) {
        
        if (textField.text.length == range.length) {
            [cellCount appendString:@"0"];
        }else{
            [cellCount appendString:textField.text];
            [cellCount deleteCharactersInRange:range];
        }
        
    }else{
        [cellCount appendFormat:@"%@%@",textField.text,string];
    }
    
    
    
    if (![XYLocalCheck isPositiveInteger:cellCount]) {
        return NO;
    }
    
    if ([cellCount intValue] >500) {
        return NO;
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        
        return;
    }
    
    if ([XYLocalCheck isNonzeroPositiveInteger:textField.text]) {
        [self netCartChangeAmount:[textField.text intValue]];
    }
}


#pragma mark - Button click

/** 选中 商品 */
- (void)selectButtonClick:(UIButton*)sender
{
//    sender.selected = !sender.selected;
//    
//    NSString * checked ;
//    if (sender.selected) {
//        checked = @"t";
//    }else{
//        checked = @"n";
//    }
    
    if (![_cartListModel.state isEqualToString:@"0"]) {
        return;
    }
    
    if (_cellType == XYShoppingCartCellType_default) {
        /**   */
        NSString * checked = [_cartListModel.checked isEqualToString:@"1"] ? @"n" : @"t";
        
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(shoppingCartCheckwithChecked:model:)]) {
            [self.delegate shoppingCartCheckwithChecked:checked model:_cartListModel];
        }
        
    }else if (_cellType == XYShoppingCartCellType_edit){
        /**   */
        NSString * checked = _cartListModel.selectEdit ? @"n" : @"t";
        
        if ([checked isEqualToString:@"t"]) {
            _cartListModel.selectEdit = YES;
        }else{
            _cartListModel.selectEdit = NO;
        }
        [self updateSelectBTselected];
        
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(shoppingCartCheckWithEdit)]) {
            [self.delegate shoppingCartCheckWithEdit];
        }
        
    }
    
    
}
/** 调整商品数量 */
- (void)changeAmounts:(UIButton*)sender
{
    int i = self.buyNumTF.text.intValue;
    if (sender == self.addBT) {
        if (i == 500) {
            return;
        }
        i++;
    }
    if (sender == self.minusBT) {
        if (i == 1) {
            return;
        }
        i--;
    }
    
    [self netCartChangeAmount:i];
    
}

/** 删除 商品 */
-(void)deleteButtonClick:(UIButton*)sender
{
    if(self.BuyDeleteCommodity){
        self.BuyDeleteCommodity();
    }
}


#pragma mark - 懒加载

- (UIButton *)selectBT {
    if (_selectBT == nil) {
        _selectBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBT.frame = CGRectZero;
        
//        [_selectBT setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
//        [_selectBT setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        [_selectBT addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBT;
}

- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        _selectImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _selectImageView.backgroundColor=[UIColor whiteColor];
        _selectImageView.contentMode = UIViewContentModeCenter;
        
    }
    return _selectImageView;
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

- (UILabel*)stateLB
{
    if (_stateLB == nil) {
        _stateLB = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _stateLB.backgroundColor = XYBlackColor;
        _stateLB.alpha = 0.3;
        
        _stateLB.textColor     = XYWhiteColor;
        _stateLB.font          = XYFont_14;
        _stateLB.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLB;
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

- (UIButton *)minusBT {
    if (_minusBT == nil) {
        _minusBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _minusBT.frame = CGRectZero;
        
        [_minusBT setImage:[UIImage imageNamed:@"buy_icon_reduce"] forState:UIControlStateNormal];
        
        [_minusBT addTarget:self action:@selector(changeAmounts:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _minusBT;
}


- (UIButton *)addBT {
    if (_addBT == nil) {
        _addBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBT.frame = CGRectZero;
        
        [_addBT setImage:[UIImage imageNamed:@"buy_icon_plus"] forState:UIControlStateNormal];
        
        [_addBT addTarget:self action:@selector(changeAmounts:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _addBT;
}
- (UITextField *)buyNumTF {
    if (_buyNumTF == nil) {
        _buyNumTF               = [[UITextField alloc] initWithFrame:CGRectZero];
        
        _buyNumTF.delegate      = self;
        _buyNumTF.keyboardType  = UIKeyboardTypeNumberPad;
        _buyNumTF.font          = XYFont_14;
        _buyNumTF.textAlignment = NSTextAlignmentCenter;
        
        _buyNumTF.layer.borderWidth = 0.5;
        _buyNumTF.layer.borderColor = XYLineColor.CGColor;
        
    }
    return _buyNumTF;
}

- (UIButton *)deleteBT {
    if (_deleteBT == nil) {
        _deleteBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBT.frame = CGRectZero;
        
        [_deleteBT setImage:[UIImage imageNamed:@"buy_icon_delete"] forState:UIControlStateNormal];
        
        [_deleteBT addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _deleteBT;
}


#pragma mark - 创建 cell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYShoppingCartTVCell";
    XYShoppingCartTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYShoppingCartTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

#pragma mark - data
/** 修改购买数量 */
- (void)netCartChangeAmount:(int)number
{
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(shoppingCartChangeAmount:model:)]) {
        [self.delegate shoppingCartChangeAmount:number model:_cartListModel];
    }
    
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
