//
//  XYDeliveryAddressListTVCell.m
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYDeliveryAddressListTVCell.h"

@interface XYDeliveryAddressListTVCell ()




@end
@implementation XYDeliveryAddressListTVCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatGui];
    }
    return self;
}


-(void)creatGui{

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.mobileLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(14);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(14);
    }];
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(_lineView.mas_top);
        make.width.mas_equalTo(48);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_mobileLab.mas_left);
        make.top.mas_equalTo(_mobileLab.mas_top);
        make.height.mas_equalTo(14);
        make.left.mas_equalTo(_selectBtn.mas_right).offset(XY_Left_Margin);
    }];
    
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_selectBtn.mas_right).offset(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(12);
        make.top.mas_equalTo(_nameLab.mas_bottom).offset(9);
    }];
    
    [self.sDefaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lineView.mas_bottom).offset(10);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(20);
        make.left.mas_equalTo(XY_Left_Margin);
    }];
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.top.mas_equalTo(_lineView.mas_bottom);
    }];
    


}

-(void)setDataModel:(XYAddressListModel *)dataModel
{
    _dataModel = dataModel;
    
    
    if ([_dataModel.isDefault boolValue]) {
        
        [self.sDefaultBtn setTitle:@"默认地址" forState:UIControlStateNormal];
        self.sDefaultBtn.backgroundColor = BALANCEColor;
        
        
    }else
    {
         [self.sDefaultBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        self.sDefaultBtn.backgroundColor = [UIColor colorWithDisplayP3Red:152.0/255 green:152.0/255 blue:152.0/255 alpha:1];
    }
    
    if (_dataModel.select) {
        self.selectBtn.selected = YES;
    }else
    {
        self.selectBtn.selected = NO;
    }
}


-(void)setEdit:(BOOL)edit
{
    _edit = edit;
    if (edit) {
        
        [self.selectBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(48);
        }];
        
//        self.editBtn.hidden = NO;
        
    }else
    {
        [self.selectBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
//        self.editBtn.hidden = YES;
    }

}


-(UIButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectBtn setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(selectBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectBtn];
    }
    return _selectBtn;

}

-(UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.textColor = XYBlackColor;
        _nameLab.font = XYFont_14;
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
}

-(UILabel *)mobileLab
{
    if (!_mobileLab) {
        _mobileLab = [UILabel new];
        _mobileLab.font = XYFont_14;
        _mobileLab.textColor = XYBlackColor;
        _mobileLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_mobileLab];
    }
    return _mobileLab;
}

-(UILabel *)addressLab{

    if (!_addressLab) {
        _addressLab = [UILabel new];
        _addressLab.font = XYFont_12;
        _addressLab.textColor = XYGrayColor;
        [self.contentView addSubview:_addressLab];
    }
    return _addressLab;
}
-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYLineColor;
        [self.contentView addSubview:_lineView];
    }
    return _lineView;

}

-(UIButton *)sDefaultBtn
{
    if (!_sDefaultBtn) {
        _sDefaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sDefaultBtn.layer.cornerRadius = 2;
        _sDefaultBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:_sDefaultBtn];
        [_sDefaultBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        [_sDefaultBtn setBackgroundColor:XYGrayColor];
        _sDefaultBtn.titleLabel.font = XYFont_14;
        [_sDefaultBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_sDefaultBtn addTarget:self action:@selector(sDefaultBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sDefaultBtn;

}


-(UIButton *)editBtn
{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setImage:[UIImage imageNamed:@"info_icon_edit"] forState:UIControlStateNormal];
        _editBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        _editBtn.titleLabel.font = XYFont_14;
        [_editBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _editBtn.titleLabel.font = XYFont_14;
        _editBtn.hidden = YES;
        [_editBtn addTarget:self action:@selector(editBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_editBtn];
    }
    return _editBtn;

}

#pragma mark -
//编辑模式下选择按钮
-(void)selectBtnHandler:(UIButton *)sender
{
    if (_dataModel.select) {
        sender.selected = NO;
        _dataModel.select = NO;
    }else
    {
        _dataModel.select = YES;
        sender.selected = YES;
    }
    
}
//设置默认地址
-(void)sDefaultBtnHandler:(id)sender{

    if (self.delegate && [self.delegate respondsToSelector:@selector(selectRowToSetDefaultAddress:)]) {
        [self.delegate selectRowToSetDefaultAddress:self.index];
    }
    
}

//点击编辑
-(void)editBtnHandler:(id)sender{

    if (self.delegate && [self.delegate respondsToSelector:@selector(selectRowToEdit:)]) {
        [self.delegate selectRowToEdit:self.index];
    }

}




@end
