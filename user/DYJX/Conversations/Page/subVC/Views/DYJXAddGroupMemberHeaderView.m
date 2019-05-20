//
//  DYJXAddGroupMemberHeaderView.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberHeaderView.h"

@interface DYJXAddGroupMemberHeaderView ()

@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UILabel *companyNameLb;
@property (nonatomic, strong) UILabel *allElectionLb;
@property (nonatomic, strong) UIButton *selectionBtn;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation DYJXAddGroupMemberHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
        [self arrowImg];
        [self selectionBtn];
        [self allElectionLb];
        [self companyNameLb];
        self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureClick)];
        [self.contentView addGestureRecognizer:self.tapGesture];
    }
    return self;
}

- (void)tapGestureClick {
    if (self.block) {
        self.model.isOpen = !self.model.isOpen;
        self.block(self);
    }
}

- (void)selectionBtnClick:(UIButton *)btn {
    if (self.model.groupSubMembers <= 0) {
        return;
    }
    self.selectionBtn.selected = !self.selectionBtn.selected;
    self.model.isSelection = self.selectionBtn.selected;
    WeakSelf
    [self.model.groupSubMembers enumerateObjectsUsingBlock:^(DYJXAddGroupSubMemberModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelection = weakSelf.model.isSelection;
    }];
    if (self.allElectionBlock) {
        self.allElectionBlock(self);
    }
}

-(void)setModel:(DYJXAddGroupMemberModel *)model {
    _model = model;
    self.arrowImg.image = [UIImage imageNamed:model.arrowImgName];
    self.companyNameLb.text = model.companyName ? model.companyName : @"";
    self.allElectionLb.text = @"全选";
    self.selectionBtn.selected = model.isSelection;
    [self.selectionBtn setImage:[UIImage imageNamed:model.righImageName] forState:(UIControlStateNormal)];
    [self.selectionBtn setImage:[UIImage imageNamed:model.righSelectionImage] forState:(UIControlStateSelected)];
}

-(UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_arrowImg];
        [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(@(__X(30)));
            make.width.and.height.equalTo(@(__X(40)));
        }];
    }
    return _arrowImg;
}

-(UIButton *)selectionBtn {
    if (!_selectionBtn) {
        _selectionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_selectionBtn];
        [_selectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.right.equalTo(@(__X(-30)));
            make.width.and.height.equalTo(@(__X(100)));
        }];
        [_selectionBtn addTarget:self action:@selector(selectionBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _selectionBtn;
}

-(UILabel *)allElectionLb {
    if (!_allElectionLb) {
        _allElectionLb = [[UILabel alloc]init];
        [self.contentView addSubview:_allElectionLb];
        [_allElectionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.right.equalTo(self.selectionBtn.mas_left).offset(__X(-20));
            make.width.equalTo(@(__X(80)));
        }];
        _allElectionLb.textAlignment = NSTextAlignmentCenter;
    }
    return _allElectionLb;
}

-(UILabel *)companyNameLb {
    if (!_companyNameLb) {
        _companyNameLb = [[UILabel alloc]init];
        [self.contentView addSubview:_companyNameLb];
        [_companyNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(self.arrowImg.mas_right).offset(__X(20));
            make.right.equalTo(self.allElectionLb.mas_left).offset(__X(-20));
        }];
    }
    return _companyNameLb;
}

@end
