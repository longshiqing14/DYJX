//
//  myAnnotation.h
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QMapKit/QMapKit.h>
#import <QMapSearchKit/QMapSearchKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myAnnotation : NSObject <QAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (NSString *)title;

- (NSString *)subtitle;

- (instancetype)initWithAnnotationModelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
