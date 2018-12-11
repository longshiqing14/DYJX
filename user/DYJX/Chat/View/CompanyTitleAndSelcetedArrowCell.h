//
//  CompanyTitleAndSelcetedArrowCell.h
//  user
//
//  Created by 岩  熊 on 2018/12/6.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SelcetedType) {
    SelcetedTypeNone,
    SelcetedTypeActive,
};

typedef void(^SelcetedTypeBlcok)(NSInteger);

@interface CompanyTitleAndSelcetedArrowCell : UITableViewCell
@property(nonatomic, strong) UILabel *titleLb;
@property(nonatomic, strong) UIButton *ArrowBTN;
@property (nonatomic, strong) UIView *separatorLineView;
@property (nonatomic, copy) SelcetedTypeBlcok block;
@end
