//
//  DYJXMyManageGroupCell.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXMyManageGroupCell.h"

@interface DYJXMyManageGroupCell ()

@property (nonatomic, strong) UIImageView *groupIocnImg;
@property (nonatomic, strong) UILabel *groupNameLb;
@property (nonatomic, strong) UIButton *selectionBtn;

@end

@implementation DYJXMyManageGroupCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setModel:(LPXNewCustomerCellModel *)model {
    _model = model;
    
    [self.groupIocnImg setImageWithURL:[NSURL URLWithString:[model.leftViewImage XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.selectionBtn.hidden = !model.isShowSelectetView;
    if (!self.selectionBtn.hidden) {
        self.selectionBtn.selected = model.isSelected;
        [self.selectionBtn setImage:[UIImage imageNamed:model.righImageName] forState:(UIControlStateNormal)];
        [self.selectionBtn setImage:[UIImage imageNamed:model.righSelectedImageName] forState:(UIControlStateSelected)];
    }
    self.groupNameLb.text = model.text;
}

- (void)selectionBtnClick:(UIButton *)btn {
    self.selectionBtn.selected = !self.selectionBtn.selected;
    self.model.isSelected = self.selectionBtn.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)groupIocnImg {
    if (!_groupIocnImg) {
        _groupIocnImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_groupIocnImg];
        [_groupIocnImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(@(__X(30)));
            make.width.and.height.equalTo(@(__X(80)));
        }];
        _groupIocnImg.backgroundColor = [UIColor orangeColor];
    }
    return _groupIocnImg;
}

- (UIButton *)selectionBtn {
    if (!_selectionBtn) {
        _selectionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_selectionBtn];
        [_selectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.right.equalTo(@(__X(-30)));
            make.width.and.height.equalTo(@(__X(40)));
        }];
        [_selectionBtn addTarget:self action:@selector(selectionBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectionBtn;
}

-(UILabel *)groupNameLb {
    if (!_groupNameLb) {
        _groupNameLb = [[UILabel alloc]init];
        [self.contentView addSubview:_groupNameLb];
        [_groupNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(self.groupIocnImg.mas_right).offset(__X(30));
            make.right.lessThanOrEqualTo(self.selectionBtn.mas_left).offset(__X(-30));
        }];
    }
    return _groupNameLb;
}

@end
