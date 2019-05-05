//
//  OwnerImageCell.m
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "OwnerImageCell.h"

@interface OwnerImageCell()
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) UITapGestureRecognizer *tapQRCodeGestureRecognizer;
@end

@implementation OwnerImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.porityImageView];
        [self.porityImageView addGestureRecognizer:self.tapGestureRecognizer];
        [self addSubview:self.qcoreImageView];
        [self.qcoreImageView addGestureRecognizer:self.tapQRCodeGestureRecognizer];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setModel:(GroupDetailModel *)model{
//    _model = (GroupDetailModel *)model;

}
//-(void)setModel:(id)model {
//}
-(void)setCellmodel:(LPXNewCustomerCellModel *)cellmodel {
    _cellmodel = cellmodel;
    [self setPorityImageViewWithURL];
}

- (void)setPorityImageViewWithURL {
    if (self.cellmodel.spareImage) {
        self.porityImageView.image = self.cellmodel.spareImage;
    }else {
        [self.porityImageView setImageWithURL:[NSURL URLWithString:[self.cellmodel.spareString XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    }
}

-(void)layoutSubviews {
    WeakSelf
    [self.porityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(20, 30, 0, 0));
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];

    [self.qcoreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(20, 0, 0, 30));
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
}

- (void)tapPorityImageView{
    if (self.block) {
        self.block();
    }
}

- (void)tapQRCodeImageView{
    if (self.qrCcodeblock) {
        self.qrCcodeblock();
    }
}

#pragma mark - UI
-(UIImageView *)porityImageView {
    if (!_porityImageView) {
        _porityImageView = [[UIImageView alloc] init];
        _porityImageView.userInteractionEnabled = YES;
        _porityImageView.layer.masksToBounds = YES;
        _porityImageView.layer.cornerRadius = 60;
        [_porityImageView setImage:[UIImage imageNamed:@"btn_group"]];
    }
    return _porityImageView;
}

-(UIImageView *)qcoreImageView {
    if (!_qcoreImageView) {
        _qcoreImageView = [[UIImageView alloc] init];
        _qcoreImageView.userInteractionEnabled = YES;
        [_qcoreImageView setImage:[UIImage imageNamed:@"myqrcode"]];
    }
    return _qcoreImageView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]init];
        [_tapGestureRecognizer addTarget:self action:@selector(tapPorityImageView)];
    }
    return _tapGestureRecognizer;
}

- (UITapGestureRecognizer *)tapQRCodeGestureRecognizer{
    if (!_tapQRCodeGestureRecognizer) {
        _tapQRCodeGestureRecognizer = [[UITapGestureRecognizer alloc]init];
        [_tapQRCodeGestureRecognizer addTarget:self action:@selector(tapQRCodeImageView)];
    }
    return _tapQRCodeGestureRecognizer;
}

@end
