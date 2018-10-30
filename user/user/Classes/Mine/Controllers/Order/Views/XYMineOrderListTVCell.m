//
//  XYMineOrderListTVCell.m
//  user
//
//  Created by xingyun on 2017/9/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineOrderListTVCell.h"

#import "XYOrderListModel.h"

#import "XYOrderListCellGoodsListCVC.h"

@interface XYMineOrderListTVCell ()


/** 底层 1 */
@property (nonatomic, strong) UIView * bgView1;


/**  */
@property (nonatomic, strong) UIImageView * timeImageView;
/**  */
@property (nonatomic, strong) UILabel * timeLB;
/**  */
@property (nonatomic, strong) UILabel * orderStatusLB;



/** 底层 2 */
@property (nonatomic, strong) UIView * bgView2;

/** 商品 表 */
@property (nonatomic, strong) XYOrderListCellGoodsListCVC * collectionView;
/** 商品数量 */
@property (nonatomic, strong) UILabel * goodsNumLB;
/** 更多商品 */
@property (nonatomic, strong) UIImageView * nextImageView;

@property(nonatomic,strong)UIImageView *markImageView;

/** 底层 3 */
@property (nonatomic, strong) UIView * bgView3;

/** 配送 方式  */
@property (nonatomic, strong) UILabel * deliveryLB;
/** 总价 标题 */
@property (nonatomic, strong) UILabel * totalTitleLB;
/** 总价 */
@property (nonatomic, strong) UILabel * totalLB;

/** 底层 4 */
@property (nonatomic, strong) UIView * bgView4;

/** 订单 按钮 */
@property (nonatomic, strong) UIButton * orderBT;


@end

@implementation XYMineOrderListTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = XYGlobalBg;
        
        [self.contentView addSubview:self.bgView1];
        
        [self.bgView1 addSubview:self.timeImageView];

        [self.bgView1 addSubview:self.timeLB];
        
        [self.bgView1 addSubview:self.orderStatusLB];
        
        
        
        [self.contentView addSubview:self.bgView2];
        
        [self.bgView2 addSubview:self.collectionView.collectionView];
        
        [self.bgView2 addSubview:self.goodsNumLB];
        
        [self.bgView2 addSubview:self.nextImageView];
        
        
        
        [self.contentView addSubview:self.bgView3];
        
        [self.bgView3 addSubview:self.deliveryLB];
        
        [self.bgView3 addSubview:self.totalTitleLB];
        
        [self.bgView3 addSubview:self.totalLB];
        
        
        
    }
    return self;
}



- (void)setListModel:(XYOrderListModel *)listModel
{
    _listModel = listModel;
    
    if (_listModel== nil) {
        return;
    }
    
    
    
    
    
    [self updateCellLayout];
}

/** 加载 界面 */
- (void)updateCellLayout
{
    self.timeImageView.image = [UIImage imageNamed:@"orderlist_icon_time"];
    
    self.timeLB.text = _listModel.formatCreateTime;
    
    self.orderStatusLB.text = _listModel.processStateInfo.name;
    
    self.collectionView.dataSource = _listModel.items;
    
    self.goodsNumLB.text = [NSString stringWithFormat:@"共%d件",[_listModel.orderItemCount intValue]];
    self.deliveryLB.text = _listModel.deliveryRuleName;
    
    self.totalLB.text = [NSString stringWithFormat:@"￥%@",_listModel.totalOrderNeedPayPrice];
    NSLog(@"%@",_listModel.processStateInfo.state);
    if ([_listModel.processStateInfo.state isEqualToString:@"p100"]) {
        self.totalTitleLB.text = @"需付：";
    } else {
        self.totalTitleLB.text = @"实付：";
    }
    
    if ([_listModel.processStateInfo.state isEqualToString:@"p102"]) {
        [self.contentView addSubview:self.bgView4];
        self.bgView4.hidden=NO;
        self.orderBT.hidden=NO;
        [self.bgView4 addSubview:self.orderBT];
        [self.orderBT setTitle:@"确认收货" forState:UIControlStateNormal];
    }else{
        self.bgView4.hidden=YES;
        self.orderBT.hidden=YES;
    }
    
    
    [self.bgView1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(0);
    }];
    
    [self.timeImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(_bgView1.mas_centerY);
        make.height.width.mas_equalTo(15);
    }];
    
  
    
    [self.orderStatusLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.timeLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_timeImageView.mas_right).offset(10);
        make.centerY.mas_equalTo(_bgView1.mas_centerY);
        make.right.mas_equalTo(_orderStatusLB.mas_left);
        make.height.mas_equalTo(16);
    }];
    
    [self.bgView2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(90);
        make.top.mas_equalTo(_bgView1.mas_bottom).offset(0.5);
    }];
    
    [self.collectionView.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(220);
    }];
    
    [self.nextImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(_bgView2.mas_centerY);
        make.height.width.mas_equalTo(15);
    }];
    
    [self.goodsNumLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_nextImageView.mas_left).offset(-10);
        make.centerY.mas_equalTo(_bgView2.mas_centerY);
    }];
    
    
    
    [self.bgView3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(_bgView2.mas_bottom).offset(0.5);
    }];
    
    [self.deliveryLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.totalLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.totalTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_totalLB.mas_left);
        make.top.bottom.mas_equalTo(0);
    }];
    if ([_listModel.processStateInfo.state isEqualToString:@"p102"]) {
        [self.bgView4 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.top.mas_equalTo(_bgView3.mas_bottom).offset(0.5);
        }];
        
        [self.orderBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin);
            make.centerY.mas_equalTo(_bgView4.mas_centerY);
            make.width.mas_equalTo(75);
            make.height.mas_equalTo(33);
        }];
    }
    
//
    
    
}



#pragma mark - button
- (void)orderButtonClick:(UIButton*)sender
{
    NSLog(@"确认收货");
    if (self.ClockConfirmationReceipt) {
        self.ClockConfirmationReceipt();
    }
    
    
}



#pragma mark - 懒加载

- (UIView*)bgView1
{
    if (_bgView1 == nil) {
        _bgView1 = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView1.backgroundColor = XYWhiteColor;
    }
    return _bgView1;
}

- (UIImageView *)timeImageView {
    if (_timeImageView == nil) {
        _timeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _timeImageView;
}

- (UILabel *)timeLB {
    if (_timeLB == nil) {
        _timeLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _timeLB.textColor     = XYGrayColor;
        _timeLB.font          = XYFont_13;
        _timeLB.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLB;
}

- (UILabel *)orderStatusLB {
    if (_orderStatusLB == nil) {
        _orderStatusLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _orderStatusLB.font          = XYFont_13;
        _orderStatusLB.textAlignment = NSTextAlignmentRight;
        _orderStatusLB.textColor     = XYMainColor;
    }
    return _orderStatusLB;
}

- (UIView*)bgView2
{
    if (_bgView2 == nil) {
        _bgView2 = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView2.backgroundColor = XYWhiteColor;
    }
    return _bgView2;
}

- (XYOrderListCellGoodsListCVC*)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[XYOrderListCellGoodsListCVC alloc]init];
        _collectionView.collectionView.frame = CGRectZero;
    }
    return _collectionView;
}

- (UILabel *)goodsNumLB {
    if (_goodsNumLB == nil) {
        _goodsNumLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _goodsNumLB.font          = XYFont_14;
        _goodsNumLB.textAlignment = NSTextAlignmentRight;
        _goodsNumLB.textColor     = XYFontTitleColor;
    }
    return _goodsNumLB;
}

- (UIImageView *)nextImageView {
    if (_nextImageView == nil) {
        _nextImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _nextImageView.contentMode = UIViewContentModeCenter;
        _nextImageView.image = [UIImage imageNamed:@"order_icon_more"];
    }
    return _nextImageView;
}

- (UIView*)bgView3
{
    if (_bgView3 == nil) {
        _bgView3 = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView3.backgroundColor = XYWhiteColor;
    }
    return _bgView3;
}

- (UILabel *)deliveryLB {
    if (_deliveryLB == nil) {
        _deliveryLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _deliveryLB.textColor     = XYFontTitleColor;
        _deliveryLB.font          = XYFont_15;
        _deliveryLB.textAlignment = NSTextAlignmentLeft;
    }
    return _deliveryLB;
}

- (UILabel *)totalTitleLB {
    if (_totalTitleLB == nil) {
        _totalTitleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _totalTitleLB.font          = XYFont_15;
        _totalTitleLB.textAlignment = NSTextAlignmentRight;
        _totalTitleLB.textColor     = XYFontTitleColor;
    }
    return _totalTitleLB;
}

- (UILabel *)totalLB {
    if (_totalLB == nil) {
        _totalLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _totalLB.font          = XYFont_15;
        _totalLB.textAlignment = NSTextAlignmentRight;
        _totalLB.textColor     = XYMainColor;
    }
    return _totalLB;
}


- (UIView*)bgView4
{
    if (_bgView4 == nil) {
        _bgView4 = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView4.backgroundColor = XYWhiteColor;
    }
    return _bgView4;
}


- (UIButton *)orderBT {
    if (_orderBT == nil) {
        _orderBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderBT.frame = CGRectZero;
        
        [_orderBT setTitleColor:XYMainColor forState:UIControlStateNormal];
        _orderBT.titleLabel.font = XYFont_14;
        
        _orderBT.layer.cornerRadius = 5;
        _orderBT.layer.masksToBounds = YES;
        
        _orderBT.layer.borderWidth = 0.5;
        _orderBT.layer.borderColor = XYMainColor.CGColor;
        
        [_orderBT addTarget:self action:@selector(orderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _orderBT;
}




+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYMineOrderListTVCell";
    XYMineOrderListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYMineOrderListTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
