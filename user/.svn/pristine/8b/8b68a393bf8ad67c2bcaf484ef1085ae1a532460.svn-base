//
//  XYHomeTVCell.m
//  user
//
//  Created by xingyun on 2017/9/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYHomeTVCell.h"

#import "XYHomeHotGoodsCVC.h"   //商品

@interface XYHomeTVCell () <XYHomeHotGoodsCVCDelegate>

/** 商品推荐 列表 */
@property (nonatomic, strong) XYHomeHotGoodsCVC * hotGoodsCVC;

@end

@implementation XYHomeTVCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self.contentView addSubview:self.hotGoodsCVC.collectionView];
        
        [self.hotGoodsCVC.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.bottom.mas_equalTo(0);
        }];
//
        
    }
    return self;
}


#pragma mark - 懒加载
- (XYHomeHotGoodsCVC *)hotGoodsCVC
{
    if (_hotGoodsCVC == nil) {
        _hotGoodsCVC = [[XYHomeHotGoodsCVC alloc]init];
        
        _hotGoodsCVC.collectionView.frame = CGRectZero;
        _hotGoodsCVC.delegate = self;
//        [self addChildViewController:_hotGoodsCVC];
    }
    return _hotGoodsCVC;
}


- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    
    self.hotGoodsCVC.dataSource = _dataSource;
    
}





#pragma mark - cell 初始化

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"XYHomeTVCell";
    XYHomeTVCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XYHomeTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - XYHomeHotGoodsCVCDelegate

- (void)homeHotGoodsSelectProductId:(NSString *)productId
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(homeTVCellpushGoodsDetailWithProductId:)]) {
        [self.delegate homeTVCellpushGoodsDetailWithProductId:productId];
    }
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
