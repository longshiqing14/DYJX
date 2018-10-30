//
//  JXRefumdImageCollectionCell.h
//  user
//
//  Created by 岩  熊 on 2018/4/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXRefumdImageCollectionCell : UICollectionViewCell
//@property (strong, nonatomic) MPImageItemModel     *curImageItem;
@property (copy, nonatomic) void (^deleteImageBlock)();
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

//单元格大小
+(CGSize)ccellSize;
@end
