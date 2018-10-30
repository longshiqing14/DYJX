//
//  JXOderDistributionTypeView.h
//  user
//  到店自提还是送货上门
//  Created by liu_yakai on 2018/4/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXOderDistributionTypeView : UIView
@property(nonatomic,copy)void (^ SelectClock)();
//配送方式
@property (weak, nonatomic) IBOutlet UILabel *distributionTitleLable;
@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;

//送货上门还是到店自提
@property (weak, nonatomic) IBOutlet UILabel *distributionTypeLable;
-(void)oderDistributionInit:(NSString *)type;
@end
