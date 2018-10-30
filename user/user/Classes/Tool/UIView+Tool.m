//
//  UIView+Tool.m
//  JLYP
//
//  Created by liu_yakai on 17/6/23.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UIView+Tool.h"
#import "POGeometry.h"
#import "POViewFrameBuilder.h"
#import "UIView+POViewFrameBuilder.h"
#import "KLCPopup.h"

static NSInteger const kNetworkErrorTipViewTag = 645353534;

@interface UIView ()

@end


static NSInteger const kNoNetworkErrorTipViewTag = 645353535;

static KLCPopup *klcPopup;

@implementation UIView (Tool)
-(void)reat:(NSInteger)reatNumber{
    
    self.layer.cornerRadius = reatNumber;
    self.layer.masksToBounds = true;
}

-(void)sideLine:(NSInteger)sideLineNumber SideLineColor:(UIColor *)sideLineColor{
    
    self.layer.borderWidth = sideLineNumber;
    self.layer.borderColor = [sideLineColor CGColor];
}

-(void)showNoDataCustomTipViewWithText:(NSString *)string imageString:(NSString *)image WithInset:(CGFloat)offset
{
    if ([self isKindOfClass:[UIScrollView class]]) {
//        [(UIScrollView *)self setScrollEnabled:NO];
    }
    [self addSubview:[self noDataTipViewString:string imageString:image WithInset:offset]];
}

-(UIView *)noDataTipViewString:(NSString *)string imageString:(NSString *)image WithInset:(CGFloat)offset
{
    self.width = kScreenWidth;
    UIView *tipview = [self viewWithTag:kNetworkErrorTipViewTag];
    tipview.backgroundColor = [UIColor clearColor];
    if (!tipview) {
        tipview = [[UIView alloc] initWithFrame:self.bounds];
        tipview.backgroundColor = [UIColor clearColor];
        tipview.tag = kNetworkErrorTipViewTag;
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        [tipview addSubview:imageview];
        
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tipLabel.text = string;
        CGRect rect = [tipLabel.text boundingRectWithSize:CGSizeMake(240, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:AutoSize(17)]} context:nil];
        float height = ceilf(rect.size.height);
        tipLabel.size = CGSizeMake(240, height);
        tipLabel.hidden = NO;
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.lineBreakMode=NSLineBreakByWordWrapping;
        tipLabel.numberOfLines = 0;
        tipLabel.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
        tipLabel.font = [UIFont systemFontOfSize:AutoSize(13)];
        tipLabel.textColor = [UIColor colorWithHexString:@"999999"];
        [tipLabel sizeToFit];
        [tipview addSubview:tipLabel];
        
        //        UIButton *button = [UIButton buttonWithRadius:kEABAGlobalCornerRadius borderColor:[UIColor clearColor] borderWidth:0 backgroundColor:KEABAColorMagenta];
        //        [button setButtonWithNormalTitle:@"重新加载" normalTitleColor:<#(UIColor *)#> normalTitleSize:16];
        
        [[imageview.po_frameBuilder alignToTopInSuperviewWithInset: offset] centerHorizontallyInSuperview];
        [[tipLabel.po_frameBuilder alignToBottomOfView:imageview offset:40 ]centerHorizontallyInSuperview];
    }
    return tipview;
}

-(void)reload{
}

- (void)removeTipViewFromSelf{
    UIView *view = [self viewWithTag:kNetworkErrorTipViewTag];
    [view removeFromSuperview];
    view = nil;
}

-(NoNetworkView *)showNoNetWorkData:(NSString *)imageName HintContent:(NSString *)hintContent{
    NoNetworkView *tipview = [self viewWithTag:kNoNetworkErrorTipViewTag];
    tipview.backgroundColor = [UIColor clearColor];
    if (!tipview) {
        tipview = [[[NSBundle mainBundle]loadNibNamed:@"NoNetworkView" owner:self options:nil]lastObject];
        tipview.tag=kNoNetworkErrorTipViewTag; tipview.frame=CGRectMake(0,0,self.frame.size.width,self.frame.size.height);
        NSLog(@"%f    %f    %f      %f",self.frame.origin.x,self.frame.origin.y,self.frame.size.width-self.frame.origin.x,self.frame.size.height);
        [tipview noNetwork:imageName Title:hintContent];
        tipview.backgroundColor = [UIColor clearColor];
    
    }
    [self addSubview:tipview];
    return tipview;
}


-(void)hideNoNetWorkData{
    NoNetworkView *tipview = [self viewWithTag:kNoNetworkErrorTipViewTag];
    NSLog(@"%@",[self viewWithTag:kNoNetworkErrorTipViewTag]);
    [tipview removeFromSuperview];
    tipview=nil;
}

-(void)bombBoxPOP{
    klcPopup=[KLCPopup popupWithContentView:self showType:(KLCPopupShowTypeFadeIn) dismissType:(KLCPopupDismissTypeFadeOut) maskType:(KLCPopupMaskTypeDimmed) dismissOnBackgroundTouch:YES dismissOnContentTouch:NO ];
    [klcPopup show];
    
}

-(void)bombBoxPOP:(NSInteger)index{
    klcPopup=[KLCPopup popupWithContentView:self showType:(index) dismissType:(KLCPopupDismissTypeBounceOutToBottom) maskType:(KLCPopupMaskTypeDimmed) dismissOnBackgroundTouch:YES dismissOnContentTouch:NO ];
    [klcPopup show];
    
}

-(void)dismissPOP{
    [klcPopup dismiss:YES];
}

@end
