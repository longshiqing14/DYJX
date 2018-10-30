//
//  HomelDataModel.m
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXHomelDataModel.h"

@implementation JXHomelDataModel
+(nullable NSDictionary<NSString *, id>*)modelContainerPropertyGenericClass{
    return @{@"carousel":HomelCarouselModel.class,@"categories":HomelCategoriesModel.class,@"imageList":HomelRotateaModel.class,@"recommendList":HomelRecommendListModel.class};
}

@end

@implementation HomelProductsModel


@end

@implementation HomeRecommendListModel
+(nullable NSDictionary<NSString *, id>*)modelContainerPropertyGenericClass{
    return @{@"products":HomelRecommendListModel.class};
}

@end

@implementation HomelImageModel


@end
@implementation HomelCatNameModel


@end



@implementation HomelCategoriesModel
+(nullable NSDictionary<NSString *, id>*)modelContainerPropertyGenericClass{
    return @{@"products":HomelRecommendListModel.class,@"rotatea":HomelRotateaModel.class,};
}

@end


//+(nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
//    return @{@"rotatea":HomelRecommendListModel.class,@"products": HomelCategoriesModel.class};
//}

    
    
//+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
//
//        return @{@"rotateaID":@"id"};
//}
@implementation HomelRecommendListModel


@end


@implementation HomelCarouselModel


@end




@implementation HomelRotateaModel
+ (nullable NSDictionary<NSString *, id>*)modelCustomPropertyMapper{
        
        return @{@"rotateaID":@"id"};
}
+(nullable NSDictionary<NSString *, id>*)modelContainerPropertyGenericClass{
    return @{@"rotatea":HomelRotateaModel.class};
}
    
@end
