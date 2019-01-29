//
//	GSCCListCompareItem.h
//
//	Create by longshiqing on 29/1/2019
//	Copyright © 2019. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "MyWebPage.h"

@interface GSCCListCompareItem : NSObject

@property (nonatomic, strong) NSString * ImgUrl;
@property (nonatomic, strong) NSString * Link;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) MyWebPage *webpage;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
