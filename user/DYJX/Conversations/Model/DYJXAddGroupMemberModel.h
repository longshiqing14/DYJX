//
//  DYJXAddGroupMemberModel.h
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DYJXAddGroupSubMemberModel;

@interface DYJXAddGroupMemberModel : NSObject

@property (nonatomic, copy) NSString *arrowImgName;
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, copy) NSString *righSelectionImage;
@property (nonatomic, copy) NSString *righImageName;
@property (nonatomic, assign) BOOL isSelection;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) NSMutableArray<DYJXAddGroupSubMemberModel *> *groupSubMembers;

@end

@interface DYJXAddGroupSubMemberModel : NSObject

@property (nonatomic, copy) NSString *leftViewImgName;
@property (nonatomic, copy) NSString *leftViewselectionImgName;
@property (nonatomic, strong) NSString *iconName;
@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, copy) NSString *administer;
@property (nonatomic, assign) BOOL isSelection;

@end

NS_ASSUME_NONNULL_END
