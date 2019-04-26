//
//	DYXJIMInfo.h
//
//	Create by longshiqing on 26/4/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DYXJIMInfo : NSObject

@property (nonatomic, assign) BOOL AdminSay;
@property (nonatomic, assign) BOOL CanNotSearch;
@property (nonatomic, strong) NSString * IdField;
@property (nonatomic, strong) NSString * Images;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end