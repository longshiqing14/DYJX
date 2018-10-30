//
//  XYOrderCommentDetailSecondCell.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentDetailSecondCell.h"

#import "XYOrderShowImgCVCell.h"
@interface XYOrderCommentDetailSecondCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString *const XYOrderShowImgCVCellID = @"XYOrderShowImgCVCell";
@implementation XYOrderCommentDetailSecondCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatGui];
    }
    return self;
}

-(void)creatGui{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
  
    

    
    
}

-(void)setModel:(XYOrderReCommentDetail *)model
{
    _model = model;
    self.titleLab.text = [NSString stringWithFormat:@"%@天后追加评论",model.timeDifference];
    self.contentLab.text = model.comment;
    
    
    CGFloat contentH = [self sizeWithString:model.comment fontOfSize:14 viewWidth:(XYScreenW - 20)].height;
    
    
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(37);
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_titleLab.mas_bottom);
           make.height.mas_offset(contentH);
    }];
    
    
    
    [self.photoImgCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_contentLab.mas_bottom).offset(5);
         make.bottom.mas_offset(0);
        
    }];
  
//    
//    [self.photoImgCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
//       
//    }];
//    
//    [self.photoImgCollectionView reloadData];
    
    

}
-(CGFloat )recommentCollectionH{
    
    if (_model.images.count%3 == 0) {
        return ([self cellWidth] +10) *(_model.images.count/3) ;
    }else
    {
        return ([self cellWidth]+10)*(_model.images.count/3 +1) -10;
    }
}


/** 计算字符串长度 */
- (CGSize)sizeWithString:(NSString*)string fontOfSize:(CGFloat)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, 8000)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName :
                                            [UIFont systemFontOfSize:font]
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGSizeMake(textRect.size.width, textRect.size.height);
    } else {
        return CGSizeZero;
    }
}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.font = XYFont_13;
        _titleLab.textColor = XYMainColor;
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}
-(UICollectionView *)photoImgCollectionView
{
    if (!_photoImgCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.headerReferenceSize = CGSizeZero;
        layout.footerReferenceSize = CGSizeZero;
        
        layout.itemSize = CGSizeMake([self cellWidth], [self cellWidth]);
        _photoImgCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _photoImgCollectionView.delegate = self;
        _photoImgCollectionView.dataSource = self;
        _photoImgCollectionView.scrollEnabled = NO;
        _photoImgCollectionView.showsVerticalScrollIndicator = NO;
        _photoImgCollectionView.showsHorizontalScrollIndicator = NO;
        
        _photoImgCollectionView.backgroundColor = XYWhiteColor;
        [self.contentView addSubview:_photoImgCollectionView];
        [_photoImgCollectionView registerClass:[XYOrderShowImgCVCell class] forCellWithReuseIdentifier:XYOrderShowImgCVCellID];
    }
    return _photoImgCollectionView;
    
}
-(UILabel *)contentLab
{
    if (!_contentLab) {
        _contentLab = [UILabel new];
        _contentLab.font = XYFont_14;
        _contentLab.numberOfLines = 0;
        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLab.textColor = XYRGBColor(51, 51, 51);
        [self.contentView addSubview:_contentLab];
    }
    
    return _contentLab;
}




-(CGFloat)cellWidth{
    
    return (XYScreenW - 20 - 30)/3;
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return _model.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYOrderShowImgCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XYOrderShowImgCVCellID forIndexPath:indexPath];
    
    [cell.photoImgView sd_setImageWithURL:[NSURL URLWithString:_model.images[indexPath.item]]];
    
    return cell;
    
}



@end
