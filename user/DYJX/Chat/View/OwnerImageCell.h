//
//  OwnerImageCell.h
//  user
//
//  Created by longshiqing on 2018/11/20.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GroupDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TapPorityImageViewBlock)(void);
typedef void(^TapQRCodeViewBlock)(void);
@interface OwnerImageCell : BaseTableViewCell

@property (nonatomic, strong)UIImageView *porityImageView;
@property (nonatomic, strong)UIImageView *qcoreImageView;

@property (nonatomic, strong)GroupDetailModel *model;
@property (nonatomic, copy)TapPorityImageViewBlock block;
@property (nonatomic, copy)TapQRCodeViewBlock qrCcodeblock;

@property (nonatomic, strong) LPXNewCustomerCellModel *cellmodel;
- (void)setPorityImageViewWithURL;
@end

NS_ASSUME_NONNULL_END
