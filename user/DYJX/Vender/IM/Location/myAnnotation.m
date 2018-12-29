//
//  myAnnotation.m
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

- (instancetype)initWithAnnotationModelWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {


        self.coordinate = CLLocationCoordinate2DMake([dict[@"latitute"] doubleValue], [dict[@"longitude"] doubleValue]);
//        self.title = dict[@"title"];
//        self.name = dict[@"name"];
//        self.type = dict[@"type"];
    }
    return self;
}

-(NSString *)title {
    return @"";
}

-(NSString *)subtitle {
    return @"";
}
@end
