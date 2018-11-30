//
//  BaseTableViewCell.h
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupDetailModel.h"

typedef void(^CallBack)(id data, NSInteger type);

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, copy)CallBack callBack;
//@property (nonatomic, strong)GroupDetailModel *model;

-(void)setModel:( GroupDetailModel *)model;

@end

NS_ASSUME_NONNULL_END
