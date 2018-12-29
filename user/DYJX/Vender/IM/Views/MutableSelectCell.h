//
//  MutableSelectCell.h
//  user
//
//  Created by longshiqing on 2018/12/28.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MutableSelectCell : UITableViewCell

@property (nonatomic, strong)UIImageView *porityImage;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *content;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *dotLabel;
@property (nonatomic, strong)UILabel *line;
@property (nonatomic, strong)UIImageView *selectButton;

-(void)setNumber:(NSInteger)number;
-(void)setCircle:(BOOL)isCircle;

-(void)setIsMutble:(BOOL)isMutble;

@end

NS_ASSUME_NONNULL_END
