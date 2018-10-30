//
//  XYDeliveryAddressListTVCell.h
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYAddressListModel.h"


@protocol XYDeliveryAddressListTVCellDelegate <NSObject>

-(void)selectRowToSetDefaultAddress:(NSIndexPath *) index;
@optional
-(void)selectRowToEdit:(NSIndexPath *)index;
@end

@interface XYDeliveryAddressListTVCell : UITableViewCell

/** 选中按钮 */
@property(nonatomic,strong)UIButton *selectBtn;
/** 姓名 */
@property(strong,nonatomic) UILabel *nameLab ;

/** 手机号 */
@property(strong,nonatomic) UILabel *mobileLab ;
/** 地址标签 */
@property(strong,nonatomic) UILabel *addressLab ;
/** 线视图 */
@property(strong,nonatomic) UIView *lineView ;
/**设为默认*/
@property(strong,nonatomic) UIButton *sDefaultBtn ;
/** 编辑按钮 */
@property(strong,nonatomic) UIButton *editBtn ;

@property(strong,nonatomic) XYAddressListModel *dataModel ;


/******  非外部 *****/
@property(assign,nonatomic) BOOL edit ;

@property(assign,nonatomic) id <XYDeliveryAddressListTVCellDelegate> delegate ;

@property(strong,nonatomic) NSIndexPath *index ;

@end
