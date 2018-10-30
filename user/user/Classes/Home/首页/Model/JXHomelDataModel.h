//
//  HomelDataModel.h
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomelProductsModel : NSObject
@property(nonatomic,strong)NSString *productId;
@property(nonatomic,strong)NSString *memberPrice;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *sellableCount;
@property(nonatomic,strong)NSString *productName;
@end

@interface HomelRotateaModel : NSObject
@property(nonatomic,strong)NSString *imgUrl;
@property(nonatomic,strong)NSString *linkTo;
@property(nonatomic,strong)NSString *openInNewPage;
@property(nonatomic,strong)NSString *description;
@property(nonatomic,strong)NSString *rotateaID;
@property(nonatomic,strong)NSString *selected;
@property(nonatomic,strong)NSString *fileId;
@property(nonatomic,strong)NSString *weight;
@property(nonatomic,strong)NSString *height;
@end

@interface HomelCatNameModel : NSObject
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *linkTo;
@property(nonatomic,strong)NSString *openInNewPage;
@end


@interface HomelCategoriesModel : NSObject
@property(nonatomic,strong)HomelCatNameModel *catName;
@property(nonatomic,strong)NSArray *products;
@property(nonatomic,strong)NSArray *rotatea;
@end


@interface HomelCarouselModel : NSObject
@property(nonatomic,strong)NSString *imgUrl;
@property(nonatomic,strong)NSString *url;
@property(nonatomic,strong)NSString *weight;
@property(nonatomic,strong)NSString *height;
@property(nonatomic,strong)NSString *sellingPointText;
@end



@interface HomelImageModel : NSObject
@property(nonatomic,strong)NSString *description;
@property(nonatomic,strong)NSString *imgLinkTo;
@property(nonatomic,strong)NSString *imgUrl;
@property(nonatomic,strong)NSString *openInNewPage;
@property(nonatomic,strong)NSString *weight;
@property(nonatomic,strong)NSString *height;
@end

@interface HomeRecommendListModel : NSObject
@property(nonatomic,strong)NSArray *products;
@property(nonatomic,strong)NSString *catName;
@property(nonatomic,strong)NSArray *rotatea;
@property(nonatomic,strong)NSString *title;
@end






@interface JXHomelDataModel : NSObject
@property(nonatomic,strong)NSArray *carousel;
@property(nonatomic,strong)NSArray *categories;
@property(nonatomic,strong)NSArray *imageList;
@property(nonatomic,strong)HomeRecommendListModel *recommendList;
@property(nonatomic,strong)HomelImageModel *image;
@property(nonatomic,strong)NSString *merchantId;
@property(nonatomic,strong)NSString *carouselFrame;
@end

@interface HomelRecommendListModel : NSObject
@property(nonatomic,strong)NSString *productId;
@property(nonatomic,strong)NSString *memberPrice;
@property(nonatomic,strong)NSString *logo;
@property(nonatomic,strong)NSString *productName;
@property(nonatomic,strong)NSString *sellableCount;
@property(nonatomic,strong)NSString *sellingPointText;
@end








