//
//  DYJXNewGroupViewModel.h
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYJXXYGroupByIdResponse.h"
#import "DYJXAddGroupMemberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYJXNewGroupViewModel : NSObject

@property (nonatomic, assign) DYJXGroupType groupType;

@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *dataArray;
@property (nonatomic, strong) DYJXXYGroupByIdResponse *response;
@property (nonatomic, strong) NSArray<DYJXAddGroupSubMemberModel *> *memberModels;
@property (nonatomic, strong) NSMutableArray<NSString *> *MemberIds;
- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

//获取用户信息
- (void)getGroupInfoWithGroupId:(NSString*)groupId Success:(void(^)(DYJXXYGroupByIdResponse *response))success failed:(void(^)(NSString *errorMsg))fail;

//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;

// 提交数据
- (void)uploadGroupWithGroupType:(NSInteger)groupType success:(void (^)(id responseObject))success failed:(void (^)(NSString *errMsg))fail;

// 屏蔽群消息
- (void)uploadSlientGroupMsgWithNumberString:(NSString *)numberString isSlientGroupMsg:(BOOL)isSlientGroupMsg success:(void (^)(id responseObject))success failed:(void (^)(NSString *errMsg))fail;

//删除公司
- (void)deleteGroupWithGroupId:(NSString*)groupId Success:(void(^)(NSString *successMsg))success failed:(void(^)(NSString *errorMsg))fail;
//退出公司
- (void)QuitGroupWithGroupId:(NSString*)groupId Success:(void(^)(NSString *successMsg))success failed:(void(^)(NSString *errorMsg))fail;

@end

NS_ASSUME_NONNULL_END
