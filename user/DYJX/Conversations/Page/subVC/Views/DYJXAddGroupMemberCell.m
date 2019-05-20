//
//  DYJXAddGroupMemberCell.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberCell.h"

@interface DYJXAddGroupMemberCell ()

@property (nonatomic, strong) UIButton *selectionBtn;
@property (nonatomic, strong) UIImageView *groupIocnImg;
@property (nonatomic, strong) UILabel *groupNameLb;
@property (nonatomic, strong) UILabel *administerLb;

@end

@implementation DYJXAddGroupMemberCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(DYJXAddGroupSubMemberModel *)model {
    _model = model;
    self.selectionBtn.selected = model.isSelection;
    [self.selectionBtn setImage:[UIImage imageNamed:model.leftViewImgName] forState:(UIControlStateNormal)];
    [self.selectionBtn setImage:[UIImage imageNamed:model.leftViewselectionImgName] forState:(UIControlStateSelected)];
    [self.groupIocnImg setImageWithURL:[NSURL URLWithString:[model.iconName XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.groupNameLb.text = model.groupName ? model.groupName : @"";
    self.administerLb.text = model.administer ? model.administer : @"";
}

- (void)selectionBtnClick:(UIButton *)btn {
    self.selectionBtn.selected = !self.selectionBtn.selected;
    self.model.isSelection = self.selectionBtn.selected;
}

-(void)tapSelectionClcik {
   [self selectionBtnClick:nil];
}

-(void)setIsSearchUser:(BOOL)isSearchUser {
    _isSearchUser = isSearchUser;
    CGFloat spacing = 0;
    if (isSearchUser) {
        spacing = 0;
    }else {
        spacing = 60;
    }
    [self.selectionBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(__X(spacing)));
    }];
}

- (UIButton *)selectionBtn {
    if (!_selectionBtn) {
        _selectionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_selectionBtn];
        [_selectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(__X(60)));
            make.centerY.equalTo(@0);
            make.width.and.height.equalTo(@(__X(100)));
        }];
        [_selectionBtn addTarget:self action:@selector(selectionBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectionBtn;
}

-(UIImageView *)groupIocnImg {
    if (!_groupIocnImg) {
        _groupIocnImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_groupIocnImg];
        [_groupIocnImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(self.selectionBtn.mas_right).offset(__X(20));
            make.width.and.height.equalTo(@(__X(80)));
        }];
    }
    return _groupIocnImg;
}

-(UILabel *)administerLb {
    if (!_administerLb) {
        _administerLb = [[UILabel alloc]init];
        [self.contentView addSubview:_administerLb];
        [_administerLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(__X(-30)));
            make.centerY.equalTo(@0);
        }];
    }
    return _administerLb;
}

-(UILabel *)groupNameLb {
    if (!_groupNameLb) {
        _groupNameLb = [[UILabel alloc]init];
        [self.contentView addSubview:_groupNameLb];
        [_groupNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(self.groupIocnImg.mas_right).offset(__X(20));
            make.right.equalTo(self.administerLb.mas_right).offset(__X(-20));
        }];
    }
    return _groupNameLb;
}

@end

