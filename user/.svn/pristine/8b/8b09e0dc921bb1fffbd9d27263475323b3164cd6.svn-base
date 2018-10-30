//
//  XYQRCodePushCommon.m
//  user
//
//  Created by xingyun on 2017/9/15.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYQRCodePushCommon.h"

#import "XYQRCodeScanningVC.h"

#import "LBXScanNative.h"

@implementation XYQRCodePushCommon


/** 跳转 扫描二维码 */
+ (void)pushToQRCodeTarget:(UIViewController*)target
{
    
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 60;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 3;
    style.photoframeAngleW = 18;
    style.photoframeAngleH = 18;
    style.isNeedShowRetangle = NO;
    
    style.colorAngle = XYWhiteColor;
        
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    style.animationImage = imgLine;
    
    
    XYQRCodeScanningVC * QRcodeVC = [[XYQRCodeScanningVC alloc]init];
    QRcodeVC.style = style;
//    QRcodeVC.scanCodeType = SCT_QRCode;
    
    [target.navigationController pushViewController:QRcodeVC animated:YES];
    
}

/** 生成 二维码 */
+ (UIImage*)createQRCodeWithString:(NSString*)text
{
    
    return [LBXScanNative createQRWithString:text
                                      QRSize:CGSizeMake(275, 275)
                                     QRColor:XYBlackColor
                                     bkColor:XYWhiteColor];
}





@end
