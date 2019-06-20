//
//  LPXNewCustomerCellModel.h
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LPXNewCustomerCellModel : NSObject

/** cell标识 */
@property (nonatomic, copy) NSString *cellIdentity;
/** cell左边title */
@property (nonatomic, copy) NSString *leftViewText;
/** cell左边image */
@property (nonatomic, copy) NSString *leftViewImage;
/** placeholder */
@property (nonatomic, copy) NSString *placeholder;
/** 键盘类型 */
@property (nonatomic, assign) UIKeyboardType keyboardType;
/** UITextFieldViewMode */
@property (nonatomic, assign) UITextFieldViewMode rightViewMode;
/** rigthTextAlignment */
@property (nonatomic, assign) NSTextAlignment rigthTextAlignment;
/** 是否隐藏输入框 */
@property (nonatomic, assign) BOOL isHiddenField;
/** text */
@property (nonatomic, copy) NSString *text;
/** cell右边可点击图片(默认) */
@property (nonatomic, copy) NSString *righImageName;
/** cell右边可点击图片(选中) */
@property (nonatomic, copy) NSString *righSelectedImageName;
/** 是否选中 */
@property (nonatomic, assign) BOOL isSelected;
/** 是否显示选中框 */
@property (nonatomic, assign) BOOL isShowSelectetView;
/** 点击celld响应 */
@property (nonatomic, copy) void (^didSelectedBlock)(NSIndexPath *indexPath);
/** 输入框长度限制 */
@property (nonatomic, assign) NSInteger maxLength;
/** 备用数组 */
@property (nonatomic, strong) NSMutableArray *spareArray;
/** 备用字符串 */
@property (nonatomic, copy) NSString *spareString;
/** 备用图片 */
@property (nonatomic, strong) UIImage *spareImage;
/** 是否开启用户交互 () */
@property (nonatomic, assign)BOOL userInteractionEnabled;

@end

@interface LPXPhotoModel : NSObject

@property (nonatomic, strong) UIImage *photoImage;
@property (nonatomic, strong) NSDictionary *photo;

@end

NS_ASSUME_NONNULL_END
