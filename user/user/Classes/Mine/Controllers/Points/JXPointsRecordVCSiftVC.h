//
//  JXPointsRecordVCSiftVC.h
//  user
//
//  Created by 岩  熊 on 2017/12/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBestVC.h"
@protocol JXPointsRecordVCSiftVCDelegate <NSObject>

-(void)backStartTime:(NSString *)startTimeStr endTimeStr:(NSString *)endTimeStr Type:(NSInteger )type;

@end
@interface JXPointsRecordVCSiftVC : XYBestVC
@property(assign,nonatomic) id<JXPointsRecordVCSiftVCDelegate> delegate  ;

@end
