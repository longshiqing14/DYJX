//
//  ImageUploadCell.m
//  user
//
//  Created by 岩  熊 on 2018/11/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "ImageUploadCell.h"
#import "JXRefumdImageCollectionCell.h"
#import "JXRefumdImageCameraCollectionCell.h"


static NSString *const RefumdImageCollectionCell = @"ImageCollectionCell";
static NSString *const RefumdImageCameraCollectionCell = @"ImageCameraCollectionCell";

@interface ImageUploadCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@end
@implementation ImageUploadCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
    
}


-(void)initSubViews{
    [self layoutIfNeeded];
//    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(XY_Left_Margin);
//        make.right.mas_equalTo(XY_Right_Margin);
//        make.top.mas_equalTo(14);
//
//    }];
    
    [self.photoImgCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.mas_equalTo(14);
        make.bottom.mas_equalTo(-15);
        //        make.height.mas_equalTo([self cellWidth] + 10 * 2);
    }];
    
    
}


-(void)setModel:(XYOrderCommentDetailModel *)model
{
    _model =model;
    CGSize size = [self sizeWithString:@"_model.comment" fontOfSize:14 viewWidth:(XYScreenW -20)];
    
    
    [self.photoImgCollectionView reloadData];
    
    
}


-(void)setImagesArray:(NSMutableArray *)imagesArray{
    _imagesArray = imagesArray;
    if (imagesArray.count / 4 == 0) {
        [self.photoImgCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([self cellWidth]  );
        }];
    }else if (imagesArray.count / 4 == 1) {
        [self.photoImgCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo([self cellWidth]*2 + 15 * 1);
        }];
    }
    [self.photoImgCollectionView reloadData];
}

-(CGFloat)cellWidth{
    
    return (XYScreenW - 10 * 5)/4;
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

//-(UILabel *)contentLab
//{
//    if (!_contentLab) {
//        _contentLab = [UILabel new];
//        _contentLab.font = XYFont_14;
//        _contentLab.numberOfLines = 0;
//        _contentLab.lineBreakMode = NSLineBreakByWordWrapping;
//        _contentLab.textColor = XYRGBColor(51, 51, 51);
//        [self.contentView addSubview:_contentLab];
//    }
//
//    return _contentLab;
//}

#pragma mark -



-(UICollectionView *)photoImgCollectionView
{
    if (!_photoImgCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 15;
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
        [_photoImgCollectionView registerNib:[UINib nibWithNibName:@"JXRefumdImageCollectionCell" bundle:nil] forCellWithReuseIdentifier:RefumdImageCollectionCell];
        [_photoImgCollectionView registerNib:[UINib nibWithNibName:@"JXRefumdImageCameraCollectionCell" bundle:nil] forCellWithReuseIdentifier:RefumdImageCameraCollectionCell];
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
    if (self.imagesArray.count == 4) {
        return self.imagesArray.count;
    }
    return self.imagesArray.count + 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    if (self.imagesArray.count <= 3) {
        
        if (indexPath.row == self.imagesArray.count) {
            JXRefumdImageCameraCollectionCell *ImageCameraCollectioncell = [collectionView dequeueReusableCellWithReuseIdentifier:RefumdImageCameraCollectionCell forIndexPath:indexPath];
            ImageCameraCollectioncell.countLb.text = [NSString stringWithFormat:@"%ld/4",self.imagesArray.count];
            cell = ImageCameraCollectioncell;
            
        }else{
            JXRefumdImageCollectionCell *ImageCollectioncell = [collectionView dequeueReusableCellWithReuseIdentifier:RefumdImageCollectionCell forIndexPath:indexPath];
            [ImageCollectioncell.imgView setImage:self.imagesArray[indexPath.item]];
            ImageCollectioncell.deleteImageBlock = ^{
                if (self.deleteImageBlock) {
                    self.deleteImageBlock(indexPath.item);
                }
            };
            cell = ImageCollectioncell;
        }
        
    }else{
        JXRefumdImageCollectionCell *ImageCollectioncell = [collectionView dequeueReusableCellWithReuseIdentifier:RefumdImageCollectionCell forIndexPath:indexPath];
        [ImageCollectioncell.imgView setImage:self.imagesArray[indexPath.item]];
        ImageCollectioncell.deleteImageBlock = ^{
            if (self.deleteImageBlock) {
                self.deleteImageBlock(indexPath.item);
            }
        };
        cell = ImageCollectioncell;
    }
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //区分是增加图片事件还是点浏览大图
    if (indexPath.row == self.imagesArray.count) {
        if (_addPicturesBlock) {
            _addPicturesBlock();
        }
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
