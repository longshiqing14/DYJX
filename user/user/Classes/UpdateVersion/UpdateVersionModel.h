//
//  UpdateVersionModel.h
//  user
//
//  Created by 岩  熊 on 2018/3/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateVersionModel : NSObject

@property (nonatomic, copy)NSString *target_size;
@property (nonatomic, copy)NSString *update;
@property (nonatomic, copy)NSString *constraint;
//new_version --> Version
@property (nonatomic, copy)NSString *version;
@property (nonatomic, copy)NSString *apk_file_url;
@property (nonatomic, copy)NSString *update_log;
@end
