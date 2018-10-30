//
//  JXHomeChannelModel.h
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JXHomeColumnListModel : NSObject
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *linkTo;
@property(nonatomic,copy)NSString *openInNewPage;
@property(nonatomic,copy)NSString *recordId;
@end

@interface JXHomeChannelModel : NSObject
@property(nonatomic,strong)NSArray *columnList;
@end

