//
//  DYJXAddGroupMemberModel.m
//  user
//
//  Created by YP on 2019/5/19.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddGroupMemberModel.h"

@implementation DYJXAddGroupMemberModel

-(NSMutableArray<DYJXAddGroupSubMemberModel *> *)groupSubMembers {
    if (!_groupSubMembers) {
        _groupSubMembers = [[NSMutableArray alloc]init];
    }
    return _groupSubMembers;
}

@end


@implementation DYJXAddGroupSubMemberModel
@end
