//
//  DYJXAddCompanyPageViewModel.h
//  user
//
//  Created by YP on 2019/4/26.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXXYGroupByIdResponse.h"
#import "DYJXAddressModel.h"

typedef NS_OPTIONS (NSInteger ,DYJXAddCompanyType){
    DYJXAddCompanyType_None,        // 默认公司
    DYJXAddCompanyType_Sub,         // 子公司
    DYJXAddCompanyType_Details,     // 公司详情
    DYJXAddCompanyType_SubDetails   // 子公司详情
};

NS_ASSUME_NONNULL_BEGIN

@interface DYJXAddCompanyPageViewModel : NSObject

- (instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType;

@property (nonatomic, assign) DYJXAddCompanyType companyType;
/** 添加（子）公司 */
@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property (nonatomic,strong) DYJXXYResult *result;
/** （子）公司详情 */
@property (nonatomic, strong) DYJXXYGroupByIdResponse *response;

@property (nonatomic, copy) NSString *userIconImageURL;

@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *dataArray;
- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

//获取用户信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;
//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;
// 上传执业照片
- (void)uploadFileWithImages:(NSArray<UIImage *> *)images success:(void(^)(NSString  *responseObject))success failed:(void(^)(NSString *errorMsg))fail;

//删除公司
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;
//退出公司
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;
// 提交用户数据
- (void)uploadCompanySuccess:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;

//（子）公司所属省市
- (void)getProvincesWithSuccess:(void(^)(DYJXAddressModel *addressModel))success failed:(void(^)(NSString *errorMsg))fail;

- (NSDictionary *)getUpDataParameters;

@end

NS_ASSUME_NONNULL_END
