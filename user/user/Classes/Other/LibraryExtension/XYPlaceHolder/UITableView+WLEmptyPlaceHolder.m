//
//  UITableView+WLEmptyPlaceHolder.m
//  WLPlaceHolder
//
//  Created by 王林 on 16/5/11.
//  Copyright © 2016年 com.ptj. All rights reserved.
//

#import "UITableView+WLEmptyPlaceHolder.h"
#import <objc/runtime.h>

@implementation UITableView (WLEmptyPlaceHolder)
//添加一个方法
- (void) tableViewDisplayMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UILabel *messageLabel = [UILabel new];
        
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        
        self.backgroundView = messageLabel;
//        self.scrollEnabled = NO;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.backgroundView = nil;
//        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}


- (void) tableViewWillDisplayNeccessaryView:(UIView *) view
{
    
}


/**  */
- (void)tableViewDisPlayType:(XYTableViewEmptyType)type ifNecessaryForRowCount:(NSUInteger)rowCount target:(id)target buttonAction:(SEL)buttonAction
{
    if (rowCount == 0) {
        
        UIView * bgView = [[UIView alloc]init];
        bgView.backgroundColor = XYGlobalBg;
        
        NSString * titleString = @"";
        NSString * imageString = @"";
        NSString * buttonString = @"";
        
        if (type == XYTableViewEmptyType_no_cart) {
            
            titleString = @"您的购物车暂无商品哦～";
            imageString = @"no_shopcart";
            buttonString = @"立马去逛逛";
            
        }else if (type == XYTableViewEmptyType_no_net){
            
            titleString = @"当前网络不可用，请检查网络设置";
            imageString = @"no_wifi";
            buttonString = @"重新加载";
            
        }else if (type == XYTableViewEmptyType_no_search){
            
            titleString = @"抱歉，没有找到相关商品~";
            imageString = @"no_search";
            buttonString = @"";

        }else if (type == XYTableViewEmptyType_no_order){
            
            titleString = @"您还没有相关订单，快去逛逛吧～";
            imageString = @"no_order";
            buttonString = @"去逛逛";
        }else if (type == XYTableViewEmptyType_no_boardband){
            
            titleString = @"暂时没有您的续约记录~";
            imageString = @"no-band";
//            buttonString = @"去逛逛";
            
        }
        
        UILabel * titleLB = [[UILabel alloc]init];
        titleLB.textAlignment = NSTextAlignmentCenter;
        titleLB.textColor = XYGrayColor;
        titleLB.font = XYFont_14;
        titleLB.text = titleString;
        [bgView addSubview:titleLB];
        
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bgView.mas_centerY);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        
        UIImageView * bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageString]];
        bgImageView.contentMode = UIViewContentModeBottom;
        [bgView addSubview:bgImageView];
        
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(bgView.mas_centerX);
            make.bottom.mas_equalTo(titleLB.mas_top).offset(-20);
        }];
    
        
        if (type != XYTableViewEmptyType_no_search && type != XYTableViewEmptyType_no_boardband) {
            UIButton * tableBT = [UIButton buttonWithType:UIButtonTypeCustom];
            [tableBT setTitle:buttonString forState:UIControlStateNormal];
            [tableBT setTitleColor:XYMainColor forState:UIControlStateNormal];
            [tableBT.titleLabel setFont:XYFont_14];
            tableBT.layer.cornerRadius = 6;
            tableBT.layer.masksToBounds = YES;
            tableBT.layer.borderWidth = 1;
            tableBT.layer.borderColor = XYMainColor.CGColor;
            [tableBT addTarget:target action:buttonAction forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:tableBT];
            
            [tableBT mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(bgView.mas_centerX);
                make.top.mas_equalTo(titleLB.mas_bottom).offset(18);
                make.width.mas_equalTo(140);
                make.height.mas_equalTo(38);
            }];
        }
        
        self.backgroundView = bgView;
        
    }else{
       self.backgroundView = nil;
    }
}





@end
