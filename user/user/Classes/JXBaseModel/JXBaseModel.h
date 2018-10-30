//
//  JXBaseModel.h
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXBaseModel : NSObject
@property(nonatomic,strong)NSString *RETURN_CODE;
@property(nonatomic,strong)NSString *RETURN_DESC;
@property(nonatomic,strong)NSString *RETURN_STAMP;
@property(nonatomic,strong)NSDictionary *RETURN_DATA;
@end
