//
//  JXQueryConditionItem.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXQueryConditionItem.h"

@implementation JXQueryConditionItem

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview];
    }
    return self;
}
-(void)addSubview{
    [self addSubview:self.titleLabel];
    [self addSubview:self.iconImage];
    
}

-(void)setArrowType:(EABAItemArrowType)arrowType{
    _arrowType = arrowType;
    if (_arrowType == EABAItemArrowDown) {
        self.iconImage.image = [UIImage imageNamed:@"ic_prolist_price_1"];
    }
    else if (_arrowType == EABAItemArrowUp) {
        self.iconImage.image = [UIImage imageNamed:@"ic_prolist_price_2"];
    }
    else {
        self.iconImage.image = [UIImage imageNamed:@"ic_prolist_price_normal"];
    }
    
}

-(void)setShowArrow:(BOOL)showArrow{
    
    _showArrow = showArrow;
    self.iconImage.hidden = ! showArrow;
}

-(void)layoutSubviews{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        //        make.top.mas_equalTo(self).with.offset(self.height/4);
        make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(5);
        //        make.bottom.mas_equalTo(self).with.offset(-self.height/4);
        make.size.mas_equalTo(CGSizeMake(7, 13));
        //        make.width.mas_equalTo(7);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        //        make.left.mas_equalTo(self).with.offset(5);
        //        make.right.mas_equalTo(self.iconImage.left).with.offset(-5);
        //        make.bottom.mas_equalTo(self).with.offset(0);
        //        make.height.mas_equalTo(13);
        make.centerX.mas_equalTo(self.mas_centerX);
        
    }];
    
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [EABAUITools sampleLabelFont:[UIFont systemFontOfSize:13] text:@"销量" textColor:[UIColor colorWithHexString:@"333333"] textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}
-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_prolist_price_normal"]];
    }
    return _iconImage;
}


@end
