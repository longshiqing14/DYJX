//
//  DYJXCompanyInfoDetailViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXUserInfoModel.h"

@interface DYJXCompanyInfoDetailViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property(nonatomic, strong) NSMutableArray<NSArray<NSString*>*> *dataArray;
- (NSInteger)numberOfSection;
- (NSString *)content:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCell:(NSInteger)indexPath;
//获取用户信息
- (void)getGroupInfoSuccess:(void(^)(DYJXUserInfoModel*))success failed:(void(^)(NSString *errorMsg))fail;
//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;
@end
