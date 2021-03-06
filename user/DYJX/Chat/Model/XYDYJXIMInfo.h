//
//	XYDYJXIMInfo.h
//
//	Create by 岩 熊 on 18/12/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface XYDYJXIMInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSString * HeadImgUrl;
@property (nonatomic, strong) NSString * Id;
@property (nonatomic, strong) NSString * Images;
@property (nonatomic, strong) NSString * NickName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
