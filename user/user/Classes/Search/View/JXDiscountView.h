//
//  JXDiscountView.h
//  user
//
//  Created by liu_yakai on 2017/12/3.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXDiscountView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *discountCollectionView;

@property(nonatomic,strong)NSMutableArray <NSString *>*dataArray;
-(void)setDataArray:(NSMutableArray *)dataArray;

-(void)cell_init;
@end
