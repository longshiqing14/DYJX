//
//  JXRefoundReasonPopView.h
//  user
//
//  Created by 岩  熊 on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXXYResult.h"

@interface JXRefoundReasonPopView : UIView
@property (nonatomic,copy)void(^selectReasonBlock)(NSString *enterpriseId);
@property (weak, nonatomic) IBOutlet UITableView *reasonTab;
@property (nonatomic,copy) NSString *reasonID;
@property (nonatomic, strong)NSMutableArray<DYJXXYResult*> *dataArray;

- (void)registCell;
@end
