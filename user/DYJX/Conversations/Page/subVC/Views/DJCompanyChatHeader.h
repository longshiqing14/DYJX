//
//  DJCompanyChatHeader.h
//  user
//
//  Created by 岩  熊 on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddSubCompanyBlock)(void);

@interface DJCompanyChatHeader : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (nonatomic, copy)AddSubCompanyBlock block;
@end
