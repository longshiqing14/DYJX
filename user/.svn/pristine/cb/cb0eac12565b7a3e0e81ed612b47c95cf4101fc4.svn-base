//
//  AppConfigMacro.h
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#ifndef AppConfigMacro_h
#define AppConfigMacro_h



typedef NS_ENUM(NSInteger, Payment_Type) {
//    微信
    PAYMENT_TYPE_WEIXIN,
    //支付宝
	PAYMENT_TYPE_ALI,
    //余额
	PAYMENT_TYPE_BLANCE,
    //银联
	PAYMENT_TYPE_UNION,
//    混合支付银联——余额
    PAYMENT_TYPE_UNION_AND_BLANCE,
    //    混合支付微信——余额
    PAYMENT_TYPE_WEIXIN_AND_BLANCE,
    //    混合支付支付宝——余额
    PAYMENT_TYPE_ALI_AND_BLANCE,
//    混合未知类型
    PAYMENT_TYPE_UN

} ;


//订单状态
//待付款
#define JX_PAYMENT_ODERSTATE_PENDINGPAYMENT @"p100"
//代发货
#define JX_PAYMENT_ODERSTATE_PENDINGDELIVERY @"p101"
//待收货
#define JX_PAYMENT_ODERSTATE_GOODSRECEIVED @"p102"
//已取消
#define JX_PAYMENT_ODERSTATE_CANCELED @"p111"
//已完成
#define JX_PAYMENT_ODERSTATE_COMPLETED @"p112"


// 支付编码
//微信
#define JX_PAYMENT_TYPE_WEIXIN @"payi_129"
//支付宝
#define JX_PAYMENT_TYPE_ALI @"payi_132"
//余额
#define JX_PAYMENT_TYPE_BLANCE @"payi_5"
//银联
#define JX_PAYMENT_TYPE_UNION @"payi_220"

// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

// 屏幕大小
#define kScreenSize [UIScreen mainScreen].bounds.size

//适配合适尺寸
#define AutoSize(x) ((x)*kScreenWidth/320.f)

// 黑色
#define kEABAColorBlack    [UIColor colorWithHexString:@"#333333"]
// 50%黑色
#define kEABAColorBlackAlpha50    [UIColor colorWithHexString:@"#333333" alpha:0.5]

// 白色
#define kEABAColorWhite [UIColor colorWithHexString:@"#FFFFFF"]
// white
#define KEABAColorwhiteAlpha [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
// hightedWhite
#define KEABAColorwhiteHighted [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]
//分割线
#define kEABASEPARATOR_LINE_COLOR [UIColor colorWithRed:0.8667 green:0.8667 blue:0.8667 alpha:1.0]
//中性灰
#define kEABANeutralGray [UIColor colorWithHexString:@"#F7F7F7"]
//blue
#define kEABAColorBlue    [UIColor colorWithHexString:@"#066B89"]
//light blue
#define kEABAColorLightBlue    [UIColor colorWithHexString:@"#82B5C4"]
// red
#define KEABAColorRed [UIColor colorWithHexString:@"#FE3F35"]
//洋红色(eg:确认按钮之类)
#define KEABAColorMagenta [UIColor colorWithHexString:@"#FA5E71"]
//浅洋红色
#define KEABAColorLightMagenta [UIColor colorWithHexString:@"#FF9BA7"]
// blue
#define kEABAColorBlueHighted    [UIColor colorWithRed:6.0f/255.0 green:107.f/255.0 blue:137.f/255 alpha:0.3]
// borderHighted
#define KEABABorderHighted [UIColor colorWithHexString:@"#74BCD1"]
// lightblue/borderColor
#define kEABAColorlightBlue [UIColor colorWithHexString:@"#82B5C4"]
//gray
#define kEABAColorGray    [UIColor colorWithHexString:@"#626262"]
//lightgray
#define kEABAColorLightGray    [UIColor colorWithHexString:@"#B0B0B0"]
//占位字gray颜色
#define kEABAPlaceholderColorGray [UIColor colorWithHexString:@"#B2B2B2"]
//普通灰
#define kEABAColorNormalGray [UIColor colorWithHexString:@"#B2B2B2"]
// navigationBarColro
#define kEABAColorNavBar [UIColor colorWithHexString:@"#F2F2F2"]
// 背景灰
#define kEABAColorBgGray [UIColor colorWithHexString:@"#F2F2F2"]
//主题蓝
#define kEABAColorBackgroudColor [UIColor colorWithHexString:@"#066B89"]
//字迹searchplaceHoder灰
#define kEABAFontGray [UIColor colorWithHexString:@"#8F8F90"]
//imageBack
#define kEABAIMAGE_BACK [UIColor colorWithHexString:@"#929292"]
//pink
#define KEABAColorPink [UIColor colorWithHexString:@"#FFECEE"]
//lightpink
#define KEABAColorlightPink [UIColor colorWithHexString:@"#FA5E71"]
//shopBlack
#define kEABAColorBlackOfShop [UIColor colorWithHexString:@"#3E3E3E"]
//Gray888
#define KEABAColorlightGray888 [UIColor colorWithHexString:@"#888888"]
// tagborderColor
#define KEABAColorTagBorderColor [UIColor colorWithHexString:@"#979797"]
// lightGrayD8
#define kEABAColorLightGrayEight [UIColor colorWithHexString:@"#D8D8D8"]
// lightBACKRed
#define kEABAColorBackColorRed [UIColor colorWithHexString:@"#F88795"]
// textViewBorderColor
/**
 *  分割线的width
 */
#define kEABAColorTextViewBorderColor [UIColor colorWithHexString:@"#D8D8D8"]
// labelInfo
#define KEABAColorInfoRed [UIColor colorWithHexString:@"#FF9BA7"]
// tabBarBoarderColor
#define kEABADefaultBorderColor [UIColor colorWithHexString:@"#DFDFDD"]
#define kNavgationBarAndStatusBarHeight 64
#define kEABAGlobalbottomlineHeight 0.5
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255 green:(CGFloat)G/255 blue:(CGFloat)B/255 alpha:A]
#define kEABAGlobalCornerRadius 4
#define SETIMAGENAME(imageName) [UIImage imageNamed:imageName]

#endif /* AppConfigMacro_h */

