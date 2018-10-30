//
//  JXRefumdImageCollectionCell.m
//  user
//
//  Created by 岩  熊 on 2018/4/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefumdImageCollectionCell.h"

//上传图片相关
#define kImageCollectionCell_Width  ((kScreenWidth- 10*2- 10*3)/3)

@implementation JXRefumdImageCollectionCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+(CGSize)ccellSize{
    return CGSizeMake(kImageCollectionCell_Width,kImageCollectionCell_Width);
}
- (IBAction)clickDeleteButton:(UIButton *)sender {
    if (self.deleteImageBlock) {
        self.deleteImageBlock();
    }
}


@end
