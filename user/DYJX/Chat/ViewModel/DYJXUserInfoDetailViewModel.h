//
//  DYJXUserInfoDetailViewModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/30.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXUserInfoModel.h"
#import "DYJXAddressModel.h"

@interface DYJXUserInfoDetailViewModel : NSObject
@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property(nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel*>*> *dataArray;
- (NSInteger)numberOfSection;
- (NSString *)content:(NSIndexPath *)indexPath;
- (NSInteger)numberOfCell:(NSInteger)indexPath;

- (NSDictionary *)getUpDataParameters;

//获取用户信息
- (void)getUserInfoSuccess:(void(^)(DYJXUserInfoModel*))success failed:(void(^)(NSString *errorMsg))fail;
//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;
//提交个人信息
- (void)CommitUserInfoSuccess:(void(^)())success failed:(void(^)(NSString *errorMsg))fail;
//（子）公司所属省市
- (void)getProvincesWithSuccess:(void(^)(DYJXAddressModel *addressModel))success failed:(void(^)(NSString *errorMsg))fail;
@end
