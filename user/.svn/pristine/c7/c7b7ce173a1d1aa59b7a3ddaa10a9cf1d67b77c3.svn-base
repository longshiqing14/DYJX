//
//  JXDeliverWayCell.m
//  user
//
//  Created by 岩  熊 on 2018/3/21.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXDeliverWayCell.h"

@implementation JXDeliverWayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = XYWhiteColor;
        
        [self.contentView addSubview:self.titleLB];
        [self.contentView addSubview:self.addressLB];
        [self.contentView addSubview:self.phoneLB];
        [self.contentView addSubview:self.line];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
     [self layoutIfNeeded];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    WeakSelf;

    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(18);
        make.left.mas_equalTo(10);
    
        make.right.mas_greaterThanOrEqualTo(-10);
    }];
    
    [self.addressLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
//        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(8);
    }];

    [self.phoneLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
    make.top.mas_equalTo(self.addressLB.mas_bottom).mas_equalTo(8);
        make.right.mas_greaterThanOrEqualTo(-10);
        make.bottom.mas_equalTo(-18);
    }];
    
    [self.line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        //        make.top.mas_equalTo(10);
    }];
    
    

    
}


#pragma mark - 懒加载

- (UILabel *)titleLB {
    if (_titleLB == nil) {
        _titleLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _titleLB.textColor     = [UIColor colorWithHexString:@"#333333"];
        _titleLB.font          = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.text = @"创业花园39栋驿站";
    }
    return _titleLB;
}

- (UILabel *)addressLB {
    if (_addressLB == nil) {
        _addressLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _addressLB.textColor     = [UIColor colorWithHexString:@"#999999"];
        _addressLB.font          = XYFont_13;
        _addressLB.textAlignment = NSTextAlignmentLeft;
        _addressLB.text = @"地址：广东省深圳市龙华新区民治创业路39栋驿站";
        _addressLB.numberOfLines = 2;
    }
    return _addressLB;
}

- (UILabel *)phoneLB {
    if (_phoneLB == nil) {
        _phoneLB               = [[UILabel alloc] initWithFrame:CGRectZero];
        
        _phoneLB.textColor     = [UIColor colorWithHexString:@"#999999"];
        _phoneLB.font          = XYFont_13;
        _phoneLB.textAlignment = NSTextAlignmentLeft;
        _phoneLB.text = @"电话：13800138000";
    }
    return _phoneLB;
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
