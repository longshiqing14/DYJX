//
//  DYJXAddCompanyPageHeaderCell.m
//  user
//
//  Created by YP on 2019/4/24.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageHeaderCell.h"

@interface DYJXAddCompanyPageHeaderCell ()
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@end

@implementation DYJXAddCompanyPageHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.porityImageView addGestureRecognizer:self.tapGestureRecognizer];
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

- (void)tapPorityImageView{
    if (self.block) {
        self.block();
    }
}

#pragma mark - UI
-(UIImageView *)porityImageView {
    if (!_porityImageView) {
        WeakSelf
        _porityImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_porityImageView];
        [_porityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(weakSelf);
            make.size.mas_equalTo(CGSizeMake(120, 120));
        }];
        _porityImageView.userInteractionEnabled = YES;
        _porityImageView.layer.masksToBounds = YES;
        _porityImageView.layer.cornerRadius = 60;
        [_porityImageView setImage:[UIImage imageNamed:@"btn_group"]];
    }
    return _porityImageView;
}

- (UITapGestureRecognizer *)tapGestureRecognizer{
    if (!_tapGestureRecognizer) {
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc]init];
        [_tapGestureRecognizer addTarget:self action:@selector(tapPorityImageView)];
    }
    return _tapGestureRecognizer;
}

@end
