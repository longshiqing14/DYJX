//
//  OwnerImageCell.m
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "OwnerImageCell.h"

@implementation OwnerImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.porityImageView];
        [self addSubview:self.qcoreImageView];
    }
    return self;
}

- (void)setModel:(GroupDetailModel *)model{
//    _model = (GroupDetailModel *)model;

}
//-(void)setModel:(id)model {
//}

-(void)layoutSubviews {
    WeakSelf
    [self.porityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(20, 30, 0, 0));
        make.size.mas_equalTo(CGSizeMake(110, 110));
    }];

    [self.qcoreImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(weakSelf).insets(UIEdgeInsetsMake(20, 0, 0, 30));
        make.size.mas_equalTo(CGSizeMake(110, 110));
    }];
}

#pragma mark - UI
-(UIImageView *)porityImageView {
    if (!_porityImageView) {
        _porityImageView = [[UIImageView alloc] init];
        _porityImageView.layer.masksToBounds = YES;
        _porityImageView.layer.cornerRadius = 55;
        [_porityImageView setImage:[UIImage imageNamed:@"ic_prolist_1"]];
    }
    return _porityImageView;
}

-(UIImageView *)qcoreImageView {
    if (!_qcoreImageView) {
        _qcoreImageView = [[UIImageView alloc] init];
        [_qcoreImageView setImage:[UIImage imageNamed:@"ic_prolist_1"]];
    }
    return _qcoreImageView;
}

@end
