//
//  JXDiscountCell.h
//  user
//
//  Created by liu_yakai on 2017/12/3.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXDiscountCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *cellButton;
-(void)cell_init:(NSString *)title;
@end
