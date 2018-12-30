//
//  JXApiDefineMacro.h
//  user
//
//  Created by 岩  熊 on 2017/11/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#ifndef JXApiDefineMacro_h
#define JXApiDefineMacro_h


#endif /* JXApiDefineMacro_h */


#define  BEST_URL @"http://www.xtt168.com:9000/zim/"
#define BEST_H5_URL  @"http://bisdevh5.xiaopenglife.com/"
#define BEST_IMAGE_URL  @"http://www.xtt168.com:9000/Files/Images/"
#define BEST_GET_URL @"http://www.xtt168.com:9000/zim/GetImg?"
//* 生产
//#define BEST_URL  @"https://bisapi.xiaopenglife.com/api/rest"
//#define BEST_H5_URL  @"https://bish5.xiaopenglife.com/"



///** 2017-10-21 更新 UAT */
//#define BEST_URL  @"http://bisuatapi.xiaopenglife.com/api/rest"
//#define BEST_H5_URL  @"http://bisuath5.xiaopenglife.com/"

//-------------------达意简讯------------------

//登录
static NSString * const kDYJXAPI_user_Login = @"Login";

//注册-获取验证码
static NSString * const kDYJXAPI_user_GetRegisterAuthorizationCode = @"GetRegisterAuthorizationCode";

//注册-获取验证码
static NSString * const kDYJXAPI_user_Register = @"Register";

//找回密码-获取验证码
static NSString * const kDYJXAPI_user_GetBackPwdAuthorizationCode = @"GetBackPwdAuthorizationCode";

//找回密码-重设密码
static NSString * const kDYJXAPI_user_GetBackPwd = @"GetBackPwd";

//获取用户信息
static NSString * const kDYJXAPI_user_GetUserById = @"GetUserById";

//获取用户公司信息
static NSString * const kDYJXAPI_user_MyEnterprises = @"MyEnterprises";

//退出登录
static NSString * const kDYJXAPI_user_Logout = @"Logout";

//我的应用
static NSString * const kDYJXAPI_user_MyApps = @"MyApps";

//最近会话
static NSString * const kDYJXAPI_user_Conversations = @"Conversations";

//上传图片
static NSString * const kDYJXAPI_user_UploadFile = @"UploadFile";

//编辑个人信息
static NSString * const kDYJXAPI_user_UpdateIMUserInfo = @"UpdateIMUserInfo";

//获取（子）公司信息
static NSString * const kDYJXAPI_user_GetGroupById = @"GetGroupById";

//好友联系人
static NSString * const kDYJXAPI_user_SearchContact = @"SearchContact";

//我创建或参与的公司
static NSString * const kDYJXAPI_user_MyGroups = @"MyGroups";

//我的公司或内部群
static NSString * const kDYJXAPI_user_MyCompanyAndGroup = @"MyCompanyAndGroup";

//外部群
static NSString * const kDYJXAPI_user_MyWildGroups = @"MyWildGroups";










//我的宽带账号列表
static NSString * const kJXAPI_user_CkServiceList = @"ck.service.list";

//帮助中心
static NSString * const kJXAPI_user_HelpCenter = @"APPHelp/#/";

//确认收货传订单号orderId
static NSString * const kJXAPI_user_ConfirmOrder = @"order.userConfirmOrder";

//获取购物车列表
static NSString * const kJXAPI_user_getCartList = @"cart.list";

//static NSString * const kJXAPI_user_getCartList = @"order.list_v2";
//根据条形码搜索 商品
static NSString * const kJXAPI_user_productSearch = @"product.search_v2";

//获取小区列表
static NSString * const kJXAPI_user_commuityList = @"commuity.orderlist";

//搜索城市列表

static NSString * const kJXAPI_user_search = @"commuity.search";

//获取选择 城市
static NSString * const kJXAPI_user_selectCommuity = @"user.selectCommuity";

//获取热销商品列表
static NSString * const kJXAPI_user_indexProductList = @"index.product.list";

//获取未读信息数量
static NSString * const kJXAPI_user_messageUnreadCount = @"message.unread.count";

//获取预存款成功返回的字段。
static NSString * const kJXAPI_user_orderRechargeDetail = @"order.recharge.detail";

//添加 购物车
static NSString * const kJXAPI_user_cartAdd = @"cart.add";

//购物车  删除
static NSString * const kJXAPI_user_cartRemoveItem = @"cart.removeItem";

//购物车  修改 数量
//static NSString * const kJXAPI_user_cartChangeAmount = @"cart.changeAmount_2018_03_27";
static NSString * const kJXAPI_user_cartChangeAmount = @"cart.changeAmount";

//购物车  数量
static NSString * const kJXAPI_user_cartCount = @"cart.count";

//购物车  选中 取消
static NSString * const kJXAPI_user_cartCheckItem = @"cart.checkItem";

//购物车  全选  全部取消
static NSString * const kJXAPI_user_cartCheckAll = @"cart.checkAll";

//切换提货方式
static NSString * const kJXAPI_user_orderDeliveryRuleSelect = @"order.delivery.rule.select";

//获取 发票 信息
static NSString * const kJXAPI_user_orderInvoiceList = @"order.invoice.list";

//保存 发票 信息
static NSString * const kJXAPI_user_orderInvoiceSave = @"order.invoice.save";

//我的宽带信息
static NSString * const kJXAPI_user_userCkList = @"user.ck.list";

//我的续约列表
static NSString * const kJXAPI_user_userCkRenewlist = @"user.ck.renewlist";

//我的续约详情
static NSString * const kJXAPI_user_userCkRenewDetail = @"user.ck.renew.detail";

//补充宽带安装信息
static NSString * const kJXAPI_user_userCkBook = @"ck.renewOrAdd.data";

//绑定宽带账号
static NSString * const kJXAPI_user_userCkBind = @"user.ck.bind";

//地址列表
//static NSString * const kJXAPI_user_userAddressList =@"user.address.list";
static NSString * const kJXAPI_user_userAddressList =@"user.address.list_180324";

//删除地址
static NSString * const kJXAPI_user_userAddressDel = @"user.address.del";

//设为默认
static NSString * const kJXAPI_user_addressSetDefault = @"address.setDefault";

//添加或者修改地址
static NSString * const kJXAPI_user_userAddressAddOrUpdate = @"user.address.addOrUpdate";

//获取市区
//static NSString * const kJXAPI_user_userCommonRegion = @"common.region";
static NSString * const kJXAPI_user_userCommonRegion = @"common.Region.v1.0";

//设为收货地址
static NSString * const kJXAPI_user_userCartAddressSelect = @"cart.address.select";

//余额 列表
static NSString * const kJXAPI_user_userPredepositLogs = @"user.predeposit.logs";

//余额详情
static NSString * const kJXAPI_user_userDepositLogDetail = @"user.deposit.log.detail";

//预存款分期返现 列表
static NSString * const kJXAPI_user_userPredepositBackList = @"user.predeposit.backList";

//预存款分期返现 - 单次详情
static NSString * const kJXAPI_user_userPredepositBackDetail = @"user.predeposit.back.detail";

//修改个人信息
static NSString * const kJXAPI_user_userUpdate = @"user.update";

//调用修改支付密码时  获取的验证码
static NSString * const kJXAPI_user_smsVcode = @"sms.vcode";

//修改支付密码
static NSString * const kJXAPI_user_userSetPayPassword = @"user.setPayPassword";

//退出登录
static NSString * const kJXAPI_user_userLogout = @"user.logout";

//
static NSString * const kJXAPI_user_productWaitforcomments = @"product.waitforcomments";

//增加评论
static NSString * const kJXAPI_user_productCommentAdd = @"product.comment.add";

//单个商品评论详情
static NSString * const kJXAPI_user_productCommentDetail = @"product.comment.detail";

//预提交订单的信息
//static NSString * const kJXAPI_user_orderForm = @"order.form";
static NSString * const kJXAPI_user_orderForm = @"order.form_1220";

//提交订单 支付
static NSString * const kJXAPI_user_orderSubmit = @"order.submit";

//银联支付
static NSString * const kJXAPI_user_ChinaPay = @"appyChinaPay";

//立即购买
static NSString * const kJXAPI_user_cartBuyNow = @"cart.buyNow";

//订单  列表  数量
static NSString * const kJXAPI_user_userOrderCount = @"user.order.count";

//检查用户是否有设置支付密码
static NSString * const kJXAPI_user_userPaywdCheck = @"user.paywd.check";

//订单  列表
//static NSString * const kJXAPI_user_orderList = @"order.list_v2";
static NSString * const kJXAPI_user_orderList = @"order.list_20180202";
//@"order.list";
//订单 详情
//static NSString * const kJXAPI_user_orderDetail = @"order.detail";
static NSString * const kJXAPI_user_orderDetail = @"order.detail_20180202";

//订单 详情 状态
static NSString * const kJXAPI_user_orderTrack = @"order.track";

//订单  取消订单
static NSString * const kJXAPI_user_userOrderCancel = @"user.order.cancel";

//订单 套餐 列表
static NSString * const kJXAPI_user_productIndexPromotions = @"product.indexPromotions";

//套餐订单 创建
static NSString * const kJXAPI_user_orderDirect = @"order.direct";

//套餐订单 支付  pay 测试用
static NSString * const kJXAPI_user_orderXpPay = @"order.xpPay";

//获取客服电话
static NSString * const kJXAPI_user_csPhone = @"cs.phone";

//登陆
static NSString * const kJXAPI_user_userLogin = @"user.login";

//获取  SessionId
static NSString * const kJXAPI_user_sessionGet = @"session.get";

//获取 个人信息
static NSString * const kJXAPI_user_userInfo = @"user.info";

//绑定 极光 cid
static NSString * const kJXAPI_user_userCidBind = @"user.cid.bind";

//获取首页Banner列表
static NSString * const kJXAPI_user_bannerList = @"banner.list";

//获取所有分类
static NSString * const kJXAPI_user_categoryListall = @"category.listall";


//图片上传
static NSString * const kJXAPI_user_commonPicUpload = @"common.pic.upload";

//通用搜索
static NSString * const kJXAPI_user_productSearchList = @"product.search_v2";


//宽带账号详情
static NSString * const kJXAPI_user_ckServiceDetail = @"ck.service.detail";

static NSString * const kJXAPI_user_unbind = @"user.ck.unbind";

static NSString * const kJXAPI_user_user_CkRenewlist = @"user.ck.renewlist";


//热搜词汇
static NSString * const kJXAPI_user_productHotsearch = @"product.hotsearch";

//我的优惠券活动商品列表
static NSString * const kJXAPI_user_productShowPromotionProductList =
@"product.showPromotionProductList";

//我的优惠券列表
static NSString * const kJXAPI_user_productGetCouponList =
@"product.getCouponList";

//订单优惠券列表
static NSString * const kJXAPI_user_CardSelectList =
@"product.getUserCardSelectList";

//订单优惠选中
static NSString * const kJXAPI_user_SelectedCard =
@"order.setSelectedCard";

//获取优惠券数量.
static NSString * const kJXAPI_user_CouponNumber =
@"product.getCouponNumber";

//获取优惠券数量.
static NSString * const kJXAPI_user_productExchangeCoupons =
@"product.exchangeCoupons";


//首页获取频道列表
static NSString * const kJXAPI_user_Channels =
@"index.channels";

//首页获取内容接口
//static NSString * const kJXAPI_user_Template =
//@"index.template";
static NSString * const kJXAPI_user_Template =
@"index.template_v1220";

//商品详情页 优惠券 列表弹窗.
static NSString * const kJXAPI_user_productDetailCard =
@"product.productDetailCard";

//商品详情页 优惠券 领取.
static NSString * const kJXAPI_user_productAddSalePromotion =
@"product.addSalePromotion";

//首页频道页
static NSString * const kJXAPI_user_channelDetail = @"channel.detail";

//我的分享
static NSString * const kJXAPI_user_GetShare = @"shareList";

//截屏分享
static NSString * const kJXAPI_user_shareGetPrintscreen = @"share.getPrintscreen";
//商品详情 首页 活动页 分享
static NSString * const kJXAPI_user_shareCustomSharing = @"share.customSharing";
//分类
static NSString * const kJXAPI_user_categoryFrontLiLst = @"category.front.list";

//积分规则
static NSString * const kJXAPI_user_pointsDescription = @"pointsDescription";

//发送电子发票到邮箱
static NSString * const kJXAPI_user_orderInvoiceSendMail = @"order.invoice.sendMail";

//分类右边商品列表
//static NSString * const kJXAPI_user_productShowPromotionProductList = @"product.showPromotionProductList";

//版本更新提示
static NSString * const kJXAPI_user_infrastructureCheckUpdate =
@"infrastructure.check.update";

//自提地址列表
static NSString * const kJXAPI_user_warehouseGetList =@"warehouse.getList";

//退货单详情
static NSString * const kJXAPI_user_OrderRefundDetail =@"orderRefund.orderRefundDetail";
//退货单列表
static NSString * const kJXAPI_user_OrderRefundList =@"xplServices.orderRefundList";

//退货退款 原因
static NSString * const kJXAPI_user_xplServicesRefundReasons = @"xplServices.refundReasons";

//提交 退货退款申请单
static NSString * const kJXAPI_user_xplServicesOrderRefund = @"xplServices.orderRefund";
//重复提交 退货退款申请单
static NSString * const kJXAPI_user_xplServicesRepeatOrderRefund = @"xplServices.repeatOrderRefund";
//退货退款申请单  头部提示语
static NSString * const kJXAPI_user_orderRefundText = @"orderRefund.text";
