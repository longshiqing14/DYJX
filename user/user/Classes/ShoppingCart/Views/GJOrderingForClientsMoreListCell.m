//
//  GJOrderingForClientsMoreListCell.m
//  bis
//  选择配送方式
//  Created by 岩  熊 on 2018/3/6.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "GJOrderingForClientsMoreListCell.h"

@implementation GJOrderingForClientsMoreListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = XYWhiteColor;
        
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.subLB];
        [self.contentView addSubview:self.arrowImage];
        [self.contentView addSubview:self.line];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    WeakSelf;
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
//        make.centerY.mas_equalTo(0);
        make.bottom.mas_equalTo(-15);
        make.top.mas_equalTo(15);
    }];
    
    [self.arrowImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-8);
        //        make.top.mas_equalTo(10);
    }];
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(weakSelf.arrowImage.mas_left).mas_equalTo(-10);
        //        make.top.mas_equalTo(10);
    }];
    
    [self.line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
        //        make.top.mas_equalTo(10);
    }];
    
    
    
    
}


#pragma mark - 懒加载

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = [UIColor colorWithHexString:@"#202020"];
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.text = @"自提地址";
    }
    return _titleLB;
}


- (UILabel *)subLB {
    if (_subLB == nil) {
        _subLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _subLB.textColor     = [UIColor colorWithHexString:@"#333333"];
        _subLB.font          = XYFont_14;
        _subLB.textAlignment = NSTextAlignmentLeft;
        _subLB.text = @"请选自提地点";
    }
    return _subLB;
}


- (UIImageView *)arrowImage{
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc]init];
        _arrowImage.image = [UIImage imageNamed:@"order_icon_more"];
    }
    return _arrowImage;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.hidden = YES;
        _line.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    }
    return _line;
}

@end
