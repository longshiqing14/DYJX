//
//  DYJXAddCompanyPageViewModel.h
//  user
//
//  Created by YP on 2019/4/26.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXXYGroupByIdResponse.h"

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

@property (nonatomic,strong) NSMutableDictionary *requestDic;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *dataArray;
- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

//获取用户信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;
//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;
//删除公司
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;
//退出公司
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse*))success failed:(void(^)(NSString *errorMsg))fail;

- (NSDictionary *)getUpDataParameters;

@end

NS_ASSUME_NONNULL_END
