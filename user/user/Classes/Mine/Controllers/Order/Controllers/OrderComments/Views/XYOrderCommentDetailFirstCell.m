//
//  XYOrderCommentDetailFirstCell.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentDetailFirstCell.h"

#import "XYOrderShowImgCVCell.h"

#import "XYUserInfoModel.h"
@interface XYOrderCommentDetailFirstCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString *const XYOrderShowImgCVCellID = @"XYOrderShowImgCVCell";

@implementation XYOrderCommentDetailFirstCell


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
    
    NSDictionary *dic=   [XYUserDefaults readUserDefaultsInfo];
    
    XYUserInfoModel *userInfoModel = [XYUserInfoModel mj_objectWithKeyValues:dic];
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:userInfoModel.userImage]];
    self.nameLab.text = userInfoModel.nickName;
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(13);
        make.left.mas_offset(XY_Left_Margin);
        make.width.height.mas_equalTo(25);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImgView.mas_right).offset(6);
        make.centerY.mas_equalTo(_iconImgView.mas_centerY);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(100);
    }];
    
    
    for (NSInteger i=0; i<5; i++) {
        UIImageView *img = [[UIImageView alloc] init];
        img.tag = 5-i;
        [self.contentView addSubview:img];
        img.image = [UIImage imageNamed:@"order_comment_littlestar-check"] ;
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(XY_Right_Margin -12*i);
            make.width.height.mas_equalTo(8);
            make.centerY.mas_equalTo(_nameLab.mas_centerY);
        }];
        
    }
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_iconImgView.mas_bottom).offset(10);
        
    }];
    
    
    [self.photoImgCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(_contentLab.mas_bottom).offset(5);
        
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-11);
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.height.mas_equalTo(12);
    }];
    
    [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(36);
    }];
    
}


-(void)setModel:(XYOrderCommentDetailModel *)model
{
    _model = model;
    self.contentLab.text = model.comment;
    
    self.timeLab.text = [self timeWithTimeIntervalString:model.certifyTime];
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

#pragma mark -

-(UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImgView];
        _iconImgView.layer.cornerRadius = 25/2.0;
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

-(UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.font = XYFont_12;
        _nameLab.textColor = XYBlackColor;
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
    
}

-(UIButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setImage:[UIImage imageNamed:@"order_comment_icon-like"] forState:UIControlStateNormal];
        _zanBtn.enabled = NO;
        [self.contentView addSubview:_zanBtn];
    }
    return _zanBtn;
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
-(CGFloat)cellWidth{
    
    return (XYScreenW - 20 - 30)/3;
}



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
