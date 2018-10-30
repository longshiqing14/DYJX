//
//  JXHomeViewController.h
//  user
//
//  Created by liu_yakai on 2017/12/7.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "BaseViewController.h"

@interface JXHomeViewController : BaseViewController
@property(nonatomic,strong)NSString *type;
@property (weak, nonatomic) IBOutlet UICollectionView *homeTableView;
-(void)getHomeAlldata;
@end
