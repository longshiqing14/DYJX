//
//  JXMyAfterSaleDetailsView.h
//  user
//
//  Created by liu_yakai on 2018/4/18.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXMyAfterSaleDetailsView : UIView
@property (weak, nonatomic) IBOutlet UILabel *returnStateLable;
-(void)myAfterSaleDetails:(NSString *)returnState;
@end
