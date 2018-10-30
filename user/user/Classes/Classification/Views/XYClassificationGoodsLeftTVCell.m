//
//  XYClassificationGoodsLeftTVCell.m
//  user
//
//  Created by xingyun on 2017/11/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationGoodsLeftTVCell.h"

@implementation XYClassificationGoodsLeftTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = XYGlobalBg;
        
        [self.contentView addSubview:self.titleLB];
        
        
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    

    
}

#pragma mark - 懒加载


- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.font = XYFont_14;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYFontTitleColor;
        
    }
    return _titleLB;
}



#pragma mark - cell 初始化

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYClassificationGoodsLeftTVCell";
    XYClassificationGoodsLeftTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XYClassificationGoodsLeftTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.titleLB.backgroundColor = [UIColor whiteColor];
        self.titleLB.textColor = [UIColor colorWithHexString:@"#EC3B2C"];
    }else{
        self.titleLB.backgroundColor = XYGlobalBg;
        self.titleLB.textColor = XYFontTitleColor;
    }
    // Configure the view for the selected state
}

@end
