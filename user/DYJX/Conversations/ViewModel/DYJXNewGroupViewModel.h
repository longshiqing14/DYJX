//
//  DYJXNewGroupViewModel.h
//  user
//
//  Created by YP on 2019/5/6.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYJXNewGroupViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *dataArray;
- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

//上传图片
- (void)uploadFile:(UIImage*)image Success:(void(^)(id  _Nullable responseObject))success failed:(void(^)(NSString *errorMsg))fail;

// 提交数据
- (void)uploadGroupWithGroupType:(NSInteger)groupType success:(void (^)(id responseObject))success failed:(void (^)(NSString *errMsg))fail;

@end

NS_ASSUME_NONNULL_END
