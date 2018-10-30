//
//  XYOrderDetailSubClassOrderDetailAddressFooterView.m
//  user
//
//  Created by xingyun on 2017/9/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailSubClassOrderDetailAddressFooterView.h"

@interface XYOrderDetailSubClassOrderDetailAddressFooterView ()



@end

@implementation XYOrderDetailSubClassOrderDetailAddressFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self.contentView addSubview:self.deliveryBgView];
        
        [self.deliveryBgView addSubview:self.deliveryAddressTitleLB];
        
        [self.deliveryBgView addSubview:self.deliveryAddressLB];
        
        [self.deliveryBgView addSubview:self.deliveryPhoneTitleLB];
        
        [self.deliveryBgView addSubview:self.deliveryPhoneLB];
        
        [self.deliveryBgView addSubview:self.lineView];
        
        
        [self.contentView addSubview:self.bgView];
                
        [self.bgView addSubview:self.titleLB];
        
        [self.bgView addSubview:self.titleNameLB];
        
        [self.bgView addSubview:self.phoneLB];
        
        [self.bgView addSubview:self.addressLB];
        
        [self.bgView addSubview:self.bglineView];
        
        
    }
//    [self layoutIfNeeded];
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.deliveryBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [self.deliveryAddressTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.bottom.mas_equalTo(_deliveryBgView.mas_centerY).offset(-8);
    }];
    
    [self.deliveryAddressLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_deliveryAddressTitleLB.mas_right);
        make.right.mas_equalTo(_bgView.mas_right).offset(-3); make.top.mas_equalTo(_deliveryAddressTitleLB.mas_top).offset(0);
    }];
    
    [self.deliveryPhoneTitleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.top.mas_equalTo(_deliveryBgView.mas_centerY).offset(8);
    }];
    
    [self.deliveryPhoneLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_deliveryPhoneTitleLB.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(_deliveryBgView.mas_centerY).offset(8);
    }];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.bottom.mas_equalTo(_bgView.mas_centerY).offset(-8);
    }];
    
    [self.titleNameLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLB.mas_right);
        make.bottom.mas_equalTo(_bgView.mas_centerY).offset(-8);
    }];
    
    [self.phoneLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.bottom.mas_equalTo(_bgView.mas_centerY).offset(-8);
    }];
    
    [self.addressLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
//        make.top.mas_equalTo(_bgView.mas_centerY).offset(3);
        make.right.mas_equalTo(_bgView.mas_right).offset(-3);
        make.bottom.mas_equalTo(_bgView.mas_bottom).offset(-5);
    }];
    
    [self.bglineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}



#pragma mark - 懒加载


- (UIView*)deliveryBgView
{
    if (_deliveryBgView == nil) {
        _deliveryBgView = [[UIView alloc]initWithFrame:CGRectZero];
        _deliveryBgView.backgroundColor = XYWhiteColor;
    }
    return _deliveryBgView;
}



- (UILabel*)deliveryAddressTitleLB
{
    if (_deliveryAddressTitleLB == nil) {
        _deliveryAddressTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _deliveryAddressTitleLB.font = XYFont_14;
        _deliveryAddressTitleLB.textAlignment = NSTextAlignmentLeft;
        _deliveryAddressTitleLB.textColor = XYGrayColor;
        _deliveryAddressTitleLB.text = @"自提地址：";
    }
    return _deliveryAddressTitleLB;
}

- (UILabel*)deliveryAddressLB
{
    if (_deliveryAddressLB == nil) {
        _deliveryAddressLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _deliveryAddressLB.font = XYFont_14;
        _deliveryAddressLB.textAlignment = NSTextAlignmentLeft;
        _deliveryAddressLB.textColor = XYBlackColor;
        _deliveryAddressLB.numberOfLines = 2;
    }
    return _deliveryAddressLB;
}


- (UILabel*)deliveryPhoneTitleLB
{
    if (_deliveryPhoneTitleLB == nil) {
        _deliveryPhoneTitleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _deliveryPhoneTitleLB.font = XYFont_14;
        _deliveryPhoneTitleLB.textAlignment = NSTextAlignmentLeft;
        _deliveryPhoneTitleLB.textColor = XYGrayColor;
        
    }
    return _deliveryPhoneTitleLB;
}

- (UILabel*)deliveryPhoneLB
{
    if (_deliveryPhoneLB == nil) {
        _deliveryPhoneLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _deliveryPhoneLB.font = XYFont_14;
        _deliveryPhoneLB.textAlignment = NSTextAlignmentLeft;
        _deliveryPhoneLB.textColor = XYBlackColor;
        
    }
    return _deliveryPhoneLB;
}


- (UIView*)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]initWithFrame:CGRectZero];
        _lineView.backgroundColor = XYLineColor;
    }
    return _lineView;
}



- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYWhiteColor;
    }
    return _bgView;
}



- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.textColor = XYGrayColor;
        
    }
    return _titleLB;
}

- (UILabel*)titleNameLB
{
    if (_titleNameLB == nil) {
        _titleNameLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleNameLB.font = XYFont_14;
        _titleNameLB.textAlignment = NSTextAlignmentLeft;
        _titleNameLB.textColor = XYBlackColor;
        
    }
    return _titleNameLB;
}


- (UILabel*)phoneLB
{
    if (_phoneLB == nil) {
        _phoneLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _phoneLB.font = XYFont_14;
        _phoneLB.textAlignment = NSTextAlignmentRight;
        _phoneLB.textColor = XYBlackColor;
        
    }
    return _phoneLB;
}

- (UILabel*)addressLB
{
    if (_addressLB == nil) {
        _addressLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _addressLB.font = XYFont_14;
        _addressLB.textAlignment = NSTextAlignmentLeft;
        _addressLB.textColor = XYBlackColor;
        _addressLB.numberOfLines = 2;
    }
    return _addressLB;
}


- (UIView*)bglineView
{
    if (_bglineView == nil) {
        _bglineView = [[UIView alloc]initWithFrame:CGRectZero];
        _bglineView.backgroundColor = XYLineColor;
    }
    return _bglineView;
}


#pragma mark -  headerView init

+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYOrderDetailSubClassOrderDetailAddressFooterView";
    XYOrderDetailSubClassOrderDetailAddressFooterView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[XYOrderDetailSubClassOrderDetailAddressFooterView alloc] initWithReuseIdentifier:ID];
        
    }
    return headerView;
}

@end
