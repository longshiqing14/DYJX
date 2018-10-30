//
//  JXMyAfterSaleDetailImageControllerCell.m
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXMyAfterSaleDetailImageControllerCell.h"
#import "JXMyAfterSaleDetailImageView.h"


static NSString *cellID=@"cellID";

@interface JXMyAfterSaleDetailImageControllerCell()
@property(strong,nonatomic)JXMyAfterSaleDetailImageView *ImageView;
@end
@implementation JXMyAfterSaleDetailImageControllerCell

-(void)cell_init:(NSArray *)imageMinArray ImageMaxArray:(NSArray *)imageMaxArray{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    if (imageMinArray.count>0) {
        self.titleLable.text=@"图片";
    }else{
        self.titleLable.text=@"";
    }
    
     self.flowPhotosView.thumbnailUrls = imageMinArray;
    // 设置原图地址
    self.flowPhotosView.originalUrls = imageMaxArray;
//    [self.flowPhotosView sizeWithPhotoCount:imageMaxArray.count photosState:0];
//    self.flowPhotosView.replaceThumbnailWhenOriginalDownloaded = YES;
//    // 设置分页指示类型
//    self.flowPhotosView.pageType = PYPhotosViewPageTypeLabel;
//    self.flowPhotosView.photosMaxCol=4;
//
//    //    flowPhotosView.py_centerX = self.view.py_centerX;
//    self.flowPhotosView.py_y = 0;
//    self.flowPhotosView.py_x = 0;
//    self.flowPhotosView.photoWidth=XYScreenW/4-20;
//    self.flowPhotosView.photoHeight=XYScreenW/4-20;
////    flowPhotosView.backgroundColor=[UIColor redColor];
}

-(PYPhotosView *)flowPhotosView{
    // 2.1 创建一个流水布局photosView(默认为流水布局)
    if (!_flowPhotosView) {
        _flowPhotosView = [PYPhotosView photosView];
        // 设置缩略图数组
        _flowPhotosView.autoLayoutWithWeChatSytle=NO; _flowPhotosView.replaceThumbnailWhenOriginalDownloaded = NO;
        _flowPhotosView.photoWidth=(XYScreenW-55)/4;
        _flowPhotosView.photoHeight=(XYScreenW-55)/4;
//        _flowPhotosView.photoMargin=10;
        // 设置分页指示类型
        _flowPhotosView.pageType = PYPhotosViewPageTypeControll;
        //    flowPhotosView.py_centerX = self.view.py_centerX;
//        _flowPhotosView.py_y = 0;
//        _flowPhotosView.py_x = 0;
        _flowPhotosView.photosMaxCol=4;
        _flowPhotosView.imagesMaxCountWhenWillCompose=8;
        
//        _flowPhotosView.backgroundColor=[UIColor greenColor];
        // 2.2创建线性布局
        //    PYPhotosView *linePhotosView = [PYPhotosView photosViewWithThumbnailUrls:thumbnailImageUrls originalUrls:originalImageUrls layoutType:PYPhotosViewLayoutTypeLine];
        // 设置Frame
        //    linePhotosView.py_y = CGRectGetMaxY(flowPhotosView.frame) + PYMargin * 2;
        //    linePhotosView.py_x = PYMargin;
        //    linePhotosView.py_width = self.view.py_width - linePhotosView.py_x * 2;

        // 3. 添加到指定视图中
        [self.contentView addSubview:_flowPhotosView];
    }

    return _flowPhotosView;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.flowPhotosView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(43);
        make.left.right.mas_equalTo(20);
        make.right.mas_equalTo(-20);
            make.bottom.mas_equalTo(-25);
    }];
//    [self.contentView addSubview: self.imageView];
//    self.ImageView.backgroundColor=[UIColor redColor];
//    [self.ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(40);
//                make.right.mas_equalTo(-20);
//        make.left.mas_equalTo(20);
//                    make.bottom.mas_equalTo(-10);
//            }];
}

//-(JXMyAfterSaleDetailImageView *)ImageView{
//    if (!_ImageView) {
//        _ImageView=[[JXMyAfterSaleDetailImageView alloc]init];
//    }
//    return _ImageView;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
