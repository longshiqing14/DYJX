//
//  XYOrderReAddCommentSecondCell.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderReAddCommentSecondCell.h"
#import "XYOrderShowImgCVCell.h"
@interface XYOrderReAddCommentSecondCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString *const XYOrderShowImgCVCellID = @"XYOrderShowImgCVCell";

@implementation XYOrderReAddCommentSecondCell


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
 
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(11);
   
    }];
    
    

    [self.photoImgCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_contentLab.mas_bottom).offset(5);
      
    }];
    
    self.timeLab.text = self.model.certifyTime;
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-11);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(12);
    }];
    
    
    
}


-(void)setModel:(XYOrderCommentDetailModel *)model
{
    _model =model;
    self.timeLab.text = model.createTimeText;
    self.contentLab.text = model.comment;
   
    CGSize size = [self sizeWithString:_model.comment fontOfSize:14 viewWidth:(XYScreenW -20)];

    [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {

        make.height.mas_equalTo(size.height);
    }];
    CGFloat collH = [self collectionH];
    [self.photoImgCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
          make.height.mas_equalTo(collH);
    }];
    [self.photoImgCollectionView reloadData];
    
    
}

-(CGFloat)collectionH{//有问题

    if (self.model.images.count%3 == 0) {
        return ([self cellWidth] +10) *(self.model.images.count/3) ;
    }else
    {
        return ([self cellWidth]+10)*(self.model.images.count/3 +1) -10;
    }
    
    
}

-(CGFloat)cellWidth{

    return (XYScreenW - 20 - 30)/3;
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
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
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

#pragma mark -

-(UILabel *)timeLab
{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.font = XYFont_12;
        _timeLab.textColor = XYRGBColor(153, 153, 153);
        [self.contentView addSubview:_timeLab];
    }
    return _timeLab;

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




//-(CGFloat)cellWidth{
//    
//    return (XYScreenW - 20 -15*3)/3;
//
//}


#pragma Mark -

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.model.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    XYOrderShowImgCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XYOrderShowImgCVCellID forIndexPath:indexPath];
    [cell.photoImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.model.images[indexPath.item]]]];
    return cell;
}





@end
