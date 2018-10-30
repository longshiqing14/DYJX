//
//  XYHomeTVCHeaderView.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeTVCHeaderView.h"

#import "XYHomeHotGoodsModel.h"

@interface XYHomeTVCHeaderView ()

/** 底图 */
@property (nonatomic, strong) UIView * bgView;
/** 左视图 */
@property (nonatomic, strong) UIImageView * leftImageView;
/** 右视图 */
@property (nonatomic, strong) UIImageView * rightImageView;
/** 标题 */
@property (nonatomic, strong) UILabel * titleLB;

@end

@implementation XYHomeTVCHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.leftImageView];
        
        [self.bgView addSubview:self.rightImageView];
        
        [self.bgView addSubview:self.titleLB];
        
        
    }
    return self;
}

- (void)setHeaderModel:(XYHomeHotGoodsModel *)headerModel
{
    
    _headerModel = headerModel;
    
    [self updateCellLayout];
    
}

- (void)updateCellLayout
{
    
    self.titleLB.text = _headerModel.catName;
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
    }];
    
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView.mas_centerX);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_titleLB.mas_left).offset(-10);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(27);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLB.mas_right).offset(10);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(38);
        make.bottom.mas_equalTo(0);
    }];
    
}

- (void)updataTitleColorAndImageNum:(NSInteger)num
{
    UIColor * color;
    NSString * imageNum;
    
    if (num % 3 == 0) {
        color = XYRGBColor(230, 98, 128);
        imageNum = @"1";
    }else if (num % 3 == 1){
        color = XYRGBColor(251, 93, 58);
        imageNum = @"2";
    }else if (num % 3 == 2){
        color = XYRGBColor(97, 171, 248);
        imageNum = @"3";
    }else{
        color = XYRGBColor(230, 171, 248);
        imageNum = @"1";
    }
    
    self.titleLB.textColor = color;
    
    NSString * leftImageName = [NSString stringWithFormat:@"home_tab_header_left_%@",imageNum];
    NSString * rightImageName = [NSString stringWithFormat:@"home_tab_header_right_%@",imageNum];

    self.leftImageView.image = [UIImage imageNamed:leftImageName];
    self.rightImageView.image = [UIImage imageNamed:rightImageName];
    
}



#pragma mark - 懒加载

- (UIView*)bgView
{
    if (_bgView == nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = XYWhiteColor;
    }
    return _bgView;
}

- (UIImageView*)leftImageView
{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        
    }
    return _leftImageView;
}

- (UIImageView*)rightImageView
{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _rightImageView;
}

- (UILabel*)titleLB
{
    if (_titleLB == nil) {
        _titleLB = [[UILabel alloc]initWithFrame:CGRectZero];

        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.textColor = XYBlackColor;
        
    }
    return _titleLB;
}

#pragma mark -  headerView init

+ (instancetype)headerWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYHomeTVCHeaderView";
    XYHomeTVCHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[XYHomeTVCHeaderView alloc] initWithReuseIdentifier:ID];
        
    }
    return headerView;
}

@end
