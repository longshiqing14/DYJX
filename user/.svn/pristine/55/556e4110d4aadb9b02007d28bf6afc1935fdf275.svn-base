//
//  JXRefundStateCell.m
//  user
//
//  Created by 岩  熊 on 2018/4/9.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundStateCell.h"
#import "UITextView+XYPlaceHolder.h"
#import <ZWLimitCounter/UITextView+ZWLimitCounter.h>
@interface JXRefundStateCell ()

@end

@implementation JXRefundStateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellEditingStyleNone;
//    self.stateDescriptionTF.backgroundColor = [UIColor redColor];
    self.stateDescriptionTF.zw_placeHolder = @"请详细描述问题（最少10个字）";
//    self.stateDescriptionTF.text = @"预留信息案点击啊点击";
    
//    CGRect rect = CGRectMake(5, 230, [UIScreen mainScreen].bounds.size.width-10, 80);
//    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    self.stateDescriptionTF.layer.borderWidth = 0;
    self.stateDescriptionTF.font = [UIFont systemFontOfSize:14];
    //文字设置居右、placeHolder会跟随设置
    //    textView.textAlignment = NSTextAlignmentRight;
//    textView.zw_placeHolder = @"向厂家反馈同业相关活动、产品信息、用于市场分析。";
    self.stateDescriptionTF.zw_limitCount = 300;
//    textView.zw_placeHolderColor = [UIColor redColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
