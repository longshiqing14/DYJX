//
//  XYMineTVCell.m
//  user
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMineTVCell.h"

#import "XYMineListModel.h"

@interface XYMineTVCell ()

@property (nonatomic, strong) UIImageView * leftImageView;

@property (nonatomic, strong) UILabel * titleLB;

@property (nonatomic, strong) UIImageView * rightImageView;

@property (nonatomic, strong) UILabel * subLB;

@end

@implementation XYMineTVCell

static CGFloat const iconImageHeight = 20;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背影色
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.leftImageView];
        
        [self.contentView addSubview:self.titleLB];
        
        [self.contentView addSubview:self.rightImageView];
        
        [self.contentView addSubview:self.subLB];
        
    }
    return self;
}

- (void)setButtonModel:(XYMineListModel *)buttonModel
{
    _buttonModel = buttonModel;
    
    self.leftImageView.image = [UIImage imageNamed:_buttonModel.image];
    
    self.titleLB.text = _buttonModel.title;
    
    if ([_buttonModel.haveArrow isEqualToString:@"1"]) {
        self.rightImageView.hidden = NO;
    }else{
        self.rightImageView.hidden = YES;
    }
    
    self.subLB.text = _buttonModel.sub;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView * supperView = self.contentView;
    
    [self.leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(_leftImageView.mas_right).offset(10);
    }];
    
    [self.rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.height.width.mas_equalTo(iconImageHeight);
    }];
    
    [self.subLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
  
}



#pragma mark - 懒加载

- (UIImageView*)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _leftImageView.contentMode = UIViewContentModeCenter;
    }
    return _leftImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _titleLB.textColor     = XYBlackColor;
        _titleLB.font          = XYFont_15;
        _titleLB.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLB;
}

- (UIImageView*)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _rightImageView.contentMode = UIViewContentModeCenter;
        
        _rightImageView.image = [UIImage imageNamed:@"order_icon_more"];
    }
    return _rightImageView;
}

- (UILabel*)subLB
{
    if (_subLB == nil) {
        _subLB = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _subLB.textColor     = XYMainColor;
        _subLB.font          = XYFont_15;
        _subLB.textAlignment = NSTextAlignmentRight;
        
    }
    return _subLB;
}


#pragma mark - 创建 cell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYMineTVCell";
    XYMineTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XYMineTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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

    // Configure the view for the selected state
}

@end
