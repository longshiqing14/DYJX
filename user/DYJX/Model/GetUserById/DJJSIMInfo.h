//
//	DJJSIMInfo.h
//
//	Create by longshiqing on 18/11/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DJJSIMInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, copy) NSString * HeadImgUrl;
@property (nonatomic, copy) NSString * IdField;
@property (nonatomic, copy) NSString * Images;
@property (nonatomic, copy) NSString * NickName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
