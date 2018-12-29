//
//  CQColorfulAlertView.m
//  AlertToastHUD
//
//  Created by caiqiang on 2018/12/6.
//  Copyright © 2018年 Caiqiang. All rights reserved.
//

#import "CQColorfulAlertView.h"
#import <Masonry.h>
#import "UIButton+CQBlockSupport.h"

@implementation CQColorfulAlertView

+ (void)showConversions:(NSArray <RCConversationModel *> *)conversions message:(RCIMMessage *)message isMutble:(BOOL)isMutble buttonClickedBlock:(void (^)(void))checkButtonClickedBlock{
    // 大背景
    UIView *bgView = [[UIView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    NSString *keyWord = message.extraDic[@"Keywords"];

    if (!isMutble) { // 单选
        NSInteger messageType = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;

        RCConversationModel *model = (RCConversationModel *)conversions.firstObject;
        NSDictionary *dict = (NSDictionary *)model.extend;

        if (messageType == 0) { // 文字
            // 白色view
            UIView *whiteView = [[UIView alloc] init];
            [bgView addSubview:whiteView];
            whiteView.clipsToBounds = YES;
            whiteView.backgroundColor = [UIColor whiteColor];
            whiteView.layer.cornerRadius = 5;
            [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(280);
                make.center.mas_equalTo(bgView);
                make.height.mas_equalTo(171);
            }];

            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.font = [UIFont systemFontOfSize:16];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.text = @"发送给：";
            titleLabel.frame = CGRectMake(10, 14, 260, 16);
            [whiteView addSubview:titleLabel];

            UIImageView *porityImage = [[UIImageView alloc] init];
            porityImage.frame = CGRectMake(10, 44, 35, 35);
            if ([dict[@"type"] isEqualToString:@"1"]) {
                porityImage.layer.masksToBounds = YES;
                porityImage.layer.cornerRadius = 2.0;
            }
            else if ([dict[@"type"] isEqualToString:@"0"]) {
                porityImage.layer.masksToBounds = YES;
                porityImage.layer.cornerRadius = 17.5;
            }
            if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
                [porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
            }
            else {
                [porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
            }
            [whiteView addSubview:porityImage];

            UILabel *nameLabel = [[UILabel alloc] init];
            nameLabel.font = [UIFont systemFontOfSize:14];
            nameLabel.textAlignment = NSTextAlignmentLeft;
            nameLabel.text = model.conversationTitle;
            nameLabel.frame = CGRectMake(55, 54.5, 215, 14);
            [whiteView addSubview:nameLabel];

            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(10, 94, 260, 20)];
            backView.backgroundColor = [UIColor colorWithHexString:@"AAAAAA"];
            [whiteView addSubview:backView];

            UILabel *contentLabel = [[UILabel alloc] init];
            contentLabel.font = [UIFont systemFontOfSize:14];
            contentLabel.textAlignment = NSTextAlignmentLeft;
            contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
            contentLabel.text = keyWord;
            contentLabel.frame = CGRectMake(20, 97, 240, 14);
            contentLabel.numberOfLines = 1;
            contentLabel.textColor = [UIColor colorWithHexString:@"333333"];
            [whiteView addSubview:contentLabel];

            // 查看优惠券按钮
            UIButton *checkButton = [[UIButton alloc] init];
            [checkButton setTitle:@"确定" forState:UIControlStateNormal];
            [checkButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [checkButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [checkButton cq_addAction:^(UIButton *button) {
                [bgView removeFromSuperview];
                checkButtonClickedBlock();
            } forControlEvents:UIControlEventTouchUpInside];
            checkButton.frame = CGRectMake(230, 137, 30, 20);
            [whiteView addSubview:checkButton];


            // 取消按钮
            UIButton *cancelButton = [[UIButton alloc] init];
            [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            // 取消按钮点击
            [cancelButton cq_addAction:^(UIButton *button) {
                // 点击取消按钮移除弹窗
                [bgView removeFromSuperview];
            } forControlEvents:UIControlEventTouchUpInside];
            cancelButton.frame = CGRectMake(180, 137, 30, 20);
            [whiteView addSubview:cancelButton];

            // 出场动画
            bgView.alpha = 0;
            whiteView.alpha = 0;
            whiteView.transform = CGAffineTransformScale(whiteView.transform, 0.1, 0.1);
            [UIView animateWithDuration:0.2 animations:^{
                whiteView.transform = CGAffineTransformIdentity;
                bgView.alpha = 1;
                whiteView.alpha = 1;
            }];
        }
        else if (messageType == 1) { // 图片
            // 白色view
            UIView *whiteView = [[UIView alloc] init];
            [bgView addSubview:whiteView];
            whiteView.clipsToBounds = YES;
            whiteView.backgroundColor = [UIColor whiteColor];
            whiteView.layer.cornerRadius = 5;
            [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(280);
                make.center.mas_equalTo(bgView);
                make.height.mas_equalTo(198);
            }];

            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.font = [UIFont systemFontOfSize:16];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.text = @"发送给：";
            titleLabel.frame = CGRectMake(10, 14, 260, 16);
            [whiteView addSubview:titleLabel];

            UIImageView *porityImage = [[UIImageView alloc] init];
            porityImage.frame = CGRectMake(10, 44, 35, 35);
            if ([dict[@"type"] isEqualToString:@"1"]) {
                porityImage.layer.masksToBounds = YES;
                porityImage.layer.cornerRadius = 2.0;
            }
            else if ([dict[@"type"] isEqualToString:@"0"]) {
                porityImage.layer.masksToBounds = YES;
                porityImage.layer.cornerRadius = 17.5;
            }
            if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
                [porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
            }
            else {
                [porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
            }
            [whiteView addSubview:porityImage];

            UILabel *nameLabel = [[UILabel alloc] init];
            nameLabel.font = [UIFont systemFontOfSize:14];
            nameLabel.textAlignment = NSTextAlignmentLeft;
            nameLabel.text = model.conversationTitle;
            nameLabel.frame = CGRectMake(55, 54.5, 215, 14);
            [whiteView addSubview:nameLabel];

            UIImageView *contentImage = [[UIImageView alloc] init];
            contentImage.frame = CGRectMake(0, 75, 280, 80);
            contentImage.contentMode = UIViewContentModeScaleAspectFit;
            if (message.image) {
                contentImage.image = message.image;
            }
            if (!message.image && message.LocalPath.length) {
                contentImage.image = [UIImage imageWithContentsOfFile:message.LocalPath];
            }
            if (!contentImage.image) {
                contentImage.image = [UIImage imageNamed:@"dyjx_default_img"];
            }
            [whiteView addSubview:contentImage];

            // 查看优惠券按钮
            UIButton *checkButton = [[UIButton alloc] init];
            [checkButton setTitle:@"确定" forState:UIControlStateNormal];
            [checkButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [checkButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [checkButton cq_addAction:^(UIButton *button) {
                [bgView removeFromSuperview];
                checkButtonClickedBlock();
            } forControlEvents:UIControlEventTouchUpInside];
            checkButton.frame = CGRectMake(230, 164, 30, 20);
            [whiteView addSubview:checkButton];


            // 取消按钮
            UIButton *cancelButton = [[UIButton alloc] init];
            [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            // 取消按钮点击
            [cancelButton cq_addAction:^(UIButton *button) {
                // 点击取消按钮移除弹窗
                [bgView removeFromSuperview];
            } forControlEvents:UIControlEventTouchUpInside];
            cancelButton.frame = CGRectMake(180, 164, 30, 20);
            [whiteView addSubview:cancelButton];

            // 出场动画
            bgView.alpha = 0;
            whiteView.alpha = 0;
            whiteView.transform = CGAffineTransformScale(whiteView.transform, 0.1, 0.1);
            [UIView animateWithDuration:0.2 animations:^{
                whiteView.transform = CGAffineTransformIdentity;
                bgView.alpha = 1;
                whiteView.alpha = 1;
            }];
        }
    }
    else {
        NSInteger messageType = [NSString stringWithFormat:@"%@",message.extraDic[@"MessageType"]].integerValue;

        if (messageType == 0) { // 文字
            // 白色view
            CGFloat height = conversions.count/5*45 + 171;
            UIView *whiteView = [[UIView alloc] init];
            [bgView addSubview:whiteView];
            whiteView.clipsToBounds = YES;
            whiteView.backgroundColor = [UIColor whiteColor];
            whiteView.layer.cornerRadius = 5;
            [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(280);
                make.center.mas_equalTo(bgView);
                make.height.mas_equalTo(height);
            }];

            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.font = [UIFont systemFontOfSize:16];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.text = @"发送给：";
            titleLabel.frame = CGRectMake(10, 14, 260, 16);
            [whiteView addSubview:titleLabel];

            for (int i = 0; i < conversions.count; i++) {
                RCConversationModel *model = (RCConversationModel *)conversions[i];
                NSDictionary *dict = (NSDictionary *)model.extend;
                NSInteger column = i%5;
                NSInteger line = i/5;

                UIImageView *porityImage = [[UIImageView alloc] init];
                porityImage.frame = CGRectMake(19.1 + 54.1*column, 44 + 45*line, 35, 35);
                if ([dict[@"type"] isEqualToString:@"1"]) {
                    porityImage.layer.masksToBounds = YES;
                    porityImage.layer.cornerRadius = 2.0;
                }
                else if ([dict[@"type"] isEqualToString:@"0"]) {
                    porityImage.layer.masksToBounds = YES;
                    porityImage.layer.cornerRadius = 17.5;
                }
                if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
                    [porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
                }
                else {
                    [porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
                }
                [whiteView addSubview:porityImage];
            }

            UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(10, 94, 260, 20)];
            backView.backgroundColor = [UIColor colorWithHexString:@"AAAAAA"];
            [whiteView addSubview:backView];

            UILabel *contentLabel = [[UILabel alloc] init];
            contentLabel.font = [UIFont systemFontOfSize:14];
            contentLabel.textAlignment = NSTextAlignmentLeft;
            contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
            contentLabel.text = keyWord;
            contentLabel.frame = CGRectMake(20, 97 + 45*(conversions.count/5), 240, 14);
            contentLabel.numberOfLines = 1;
            contentLabel.textColor = [UIColor colorWithHexString:@"333333"];
            [whiteView addSubview:contentLabel];

            // 查看优惠券按钮
            UIButton *checkButton = [[UIButton alloc] init];
            [checkButton setTitle:@"确定" forState:UIControlStateNormal];
            [checkButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [checkButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [checkButton cq_addAction:^(UIButton *button) {
                [bgView removeFromSuperview];
                checkButtonClickedBlock();
            } forControlEvents:UIControlEventTouchUpInside];
            checkButton.frame = CGRectMake(230, 137 + 45*(conversions.count/5), 30, 20);
            [whiteView addSubview:checkButton];


            // 取消按钮
            UIButton *cancelButton = [[UIButton alloc] init];
            [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            // 取消按钮点击
            [cancelButton cq_addAction:^(UIButton *button) {
                // 点击取消按钮移除弹窗
                [bgView removeFromSuperview];
            } forControlEvents:UIControlEventTouchUpInside];
            cancelButton.frame = CGRectMake(180, 137 + 45*(conversions.count/5), 30, 20);
            [whiteView addSubview:cancelButton];

            // 出场动画
            bgView.alpha = 0;
            whiteView.alpha = 0;
            whiteView.transform = CGAffineTransformScale(whiteView.transform, 0.1, 0.1);
            [UIView animateWithDuration:0.2 animations:^{
                whiteView.transform = CGAffineTransformIdentity;
                bgView.alpha = 1;
                whiteView.alpha = 1;
            }];
        }
        else if (messageType == 1) { // 图片
            // 白色view
            UIView *whiteView = [[UIView alloc] init];
            [bgView addSubview:whiteView];
            whiteView.clipsToBounds = YES;
            whiteView.backgroundColor = [UIColor whiteColor];
            whiteView.layer.cornerRadius = 5;
            [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(280);
                make.center.mas_equalTo(bgView);
                make.height.mas_equalTo(213 + conversions.count/5*45);
            }];

            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.font = [UIFont systemFontOfSize:16];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.text = @"发送给：";
            titleLabel.frame = CGRectMake(10, 14, 260, 16);
            [whiteView addSubview:titleLabel];

            for (int i = 0; i < conversions.count; i++) {
                RCConversationModel *model = (RCConversationModel *)conversions[i];
                NSDictionary *dict = (NSDictionary *)model.extend;
                NSInteger column = i%5;
                NSInteger line = i/5;

                UIImageView *porityImage = [[UIImageView alloc] init];
                porityImage.frame = CGRectMake(19.1 + 54.1*column, 44 + 45*line, 35, 35);
                if ([dict[@"type"] isEqualToString:@"1"]) {
                    porityImage.layer.masksToBounds = YES;
                    porityImage.layer.cornerRadius = 2.0;
                }
                else if ([dict[@"type"] isEqualToString:@"0"]) {
                    porityImage.layer.masksToBounds = YES;
                    porityImage.layer.cornerRadius = 17.5;
                }
                if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
                    [porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
                }
                else {
                    [porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
                }
                [whiteView addSubview:porityImage];
            }

            UIImageView *contentImage = [[UIImageView alloc] init];
            contentImage.frame = CGRectMake(0, 90 + conversions.count/5*45, 280, 80);
            contentImage.contentMode = UIViewContentModeScaleAspectFit;
            if (message.image) {
                contentImage.image = message.image;
            }
            if (!message.image && message.LocalPath.length) {
                contentImage.image = [UIImage imageWithContentsOfFile:message.LocalPath];
            }
            if (!contentImage.image) {
                contentImage.image = [UIImage imageNamed:@"dyjx_default_img"];
            }
            [whiteView addSubview:contentImage];

            // 查看优惠券按钮
            UIButton *checkButton = [[UIButton alloc] init];
            [checkButton setTitle:@"确定" forState:UIControlStateNormal];
            [checkButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [checkButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [checkButton cq_addAction:^(UIButton *button) {
                [bgView removeFromSuperview];
                checkButtonClickedBlock();
            } forControlEvents:UIControlEventTouchUpInside];
            checkButton.frame = CGRectMake(230, 179 + conversions.count/5*45, 30, 20);
            [whiteView addSubview:checkButton];


            // 取消按钮
            UIButton *cancelButton = [[UIButton alloc] init];
            [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
            [cancelButton setTitleColor:[UIColor colorWithHexString:@"#F2A73B"] forState:UIControlStateNormal];
            [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            // 取消按钮点击
            [cancelButton cq_addAction:^(UIButton *button) {
                // 点击取消按钮移除弹窗
                [bgView removeFromSuperview];
            } forControlEvents:UIControlEventTouchUpInside];
            cancelButton.frame = CGRectMake(180, 179 + conversions.count/5*45, 30, 20);
            [whiteView addSubview:cancelButton];

            // 出场动画
            bgView.alpha = 0;
            whiteView.alpha = 0;
            whiteView.transform = CGAffineTransformScale(whiteView.transform, 0.1, 0.1);
            [UIView animateWithDuration:0.2 animations:^{
                whiteView.transform = CGAffineTransformIdentity;
                bgView.alpha = 1;
                whiteView.alpha = 1;
            }];
        }
    }
}


/**
 兑换成功后展示的弹窗
 
 @param couponName 优惠券名称
 @param validityTime 有效期
 @param checkButtonClickedBlock “查看优惠券”按钮点击后的回调
 */
+ (void)showConversionSucceedAlertWithCouponName:(NSString *)couponName validityTime:(NSString *)validityTime checkCouponButtonClickedBlock:(void (^)(void))checkButtonClickedBlock {
    // 大背景
    UIView *bgView = [[UIView alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // 白色view
    UIView *whiteView = [[UIView alloc] init];
    [bgView addSubview:whiteView];
    whiteView.clipsToBounds = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(255);
        make.center.mas_equalTo(bgView);
    }];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    [whiteView addSubview:titleLabel];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"兑换成功";
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(8);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(17);
    }];
    
    // 优惠券label
    UILabel *couponLabel = [[UILabel alloc] init];
    [whiteView addSubview:couponLabel];
    couponLabel.text = couponName;
    couponLabel.textAlignment = NSTextAlignmentCenter;
    couponLabel.font = [UIFont systemFontOfSize:14];
    [couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(whiteView);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(13);
        make.height.mas_equalTo(14);
    }];
    
    // 有效期label
    UILabel *timeLabel = [[UILabel alloc] init];
    [whiteView addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.textColor = [UIColor colorWithRed:0.84 green:0.33 blue:0.44 alpha:1.00];
    timeLabel.text = validityTime;
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(couponLabel);
        make.top.mas_equalTo(couponLabel.mas_bottom).mas_offset(10);
    }];
    
    // 取消按钮
    UIButton *cancelButton = [[UIButton alloc] init];
    [whiteView addSubview:cancelButton];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:17]];
    // 取消按钮点击
    [cancelButton cq_addAction:^(UIButton *button) {
        // 点击取消按钮移除弹窗
        [bgView removeFromSuperview];
    } forControlEvents:UIControlEventTouchUpInside];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(whiteView);
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(whiteView.mas_centerX);
        make.height.mas_equalTo(43);
    }];
    
    // 查看优惠券按钮
    UIButton *checkButton = [[UIButton alloc] init];
    [whiteView addSubview:checkButton];
    [checkButton setTitle:@"查看优惠券" forState:UIControlStateNormal];
    [checkButton.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [checkButton setTitleColor:[UIColor colorWithRed:0.42 green:0.74 blue:0.67 alpha:1.00] forState:UIControlStateNormal];
    [checkButton cq_addAction:^(UIButton *button) {
        [bgView removeFromSuperview];
        checkButtonClickedBlock();
    } forControlEvents:UIControlEventTouchUpInside];
    [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.top.mas_equalTo(cancelButton);
        make.left.mas_equalTo(cancelButton.mas_right);
        make.bottom.mas_equalTo(whiteView);
    }];
    
    // 横线灰色线
    UIView *grayLineView1 = [[UIView alloc] init];
    [whiteView addSubview:grayLineView1];
    grayLineView1.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [grayLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_offset(10);
    }];
    
    // 竖向灰色线
    UIView *grayLineView2 = [[UIView alloc] init];
    [whiteView addSubview:grayLineView2];
    grayLineView2.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [grayLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(grayLineView1.mas_bottom);
        make.bottom.mas_equalTo(whiteView);
        make.centerX.mas_equalTo(whiteView);
        make.width.mas_equalTo(1);
    }];
    
    // 出场动画
    bgView.alpha = 0;
    whiteView.alpha = 0;
    whiteView.transform = CGAffineTransformScale(whiteView.transform, 0.1, 0.1);
    [UIView animateWithDuration:0.2 animations:^{
        whiteView.transform = CGAffineTransformIdentity;
        bgView.alpha = 1;
        whiteView.alpha = 1;
    }];
}

@end
