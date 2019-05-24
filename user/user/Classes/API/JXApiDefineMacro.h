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

#define BEST_COMPARA @"http://www.qpq168.com:8080/QPQMobile/"
#define  BEST_URL @"http://www.xtt168.com:9000/zim/"
#define BEST_H5_URL  @"http://bisdevh5.xiaopenglife.com/"
#define BEST_IMAGE_URL  @"http://www.xtt168.com:9000/Files/Images/"
#define BEST_GET_URL @"http://www.xtt168.com:9000/zim/GetImg?"

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

//删除公司
static NSString * const kDYJXAPI_user_DeleteGroup = @"DeleteGroup";

//退出公司
static NSString * const kDYJXAPI_user_QuitGroup2 = @"QuitGroup2";

//添加公司、子公司
static NSString * const kDYJXAPI_user_EditGroup2 = @"EditGroup2";

//（子）公司所属省市
static NSString * const kDYJXAPI_user_GetProvinces = @"GetProvinces";

//（子）公司所属市
static NSString * const kDYJXAPI_user_GetCitys = @"GetCitys";

//（子）公司所属区/县
static NSString * const kDYJXAPI_user_GetDistricts = @"GetDistricts";

// 查找群
static NSString * const kDYJXAPI_SearchGroups = @"SearchGroups";

// 新增群
static NSString * const kDYJXAPI_EditGroup2 = @"EditGroup2";
// 我管理的群
static NSString * const kDYJXAPI_MyManagedGroups = @"MyManagedGroups";

// 选择公司地址通知
static NSString * const kDYJXAPI_CompanyAddress_Notification = @"kDYJXAPICompanyAddressNotification";

// 新增内部群刷新通知
static NSString * const kDYJXAPI_AddInteriorGroup_Notification = @"AddInteriorGroupNotification";

// 新增外部群刷新通知
static NSString * const kDYJXAPI_AddExternalGroup_Notification = @"AddExternalGroupNotification";

// 普通联系人
static NSString * const kDYJXAPI_user_AddUAUserContact = @"AddUAUserContact";
// 好友联系人
static NSString * const kDYJXAPI_user_AddFriendApply = @"AddFriendApply";
// 加入黑名单
static NSString * const kDYJXAPI_user_AddToBlacklist = @"AddToBlacklist";
// 移出黑名单
static NSString * const kDYJXAPI_user_RemoveBlacklist = @"RemoveBlacklist";
// 删除联系人
static NSString * const kDYJXAPI_user_DelContact = @"DelContact";

// 群成员
static NSString * const kDYJXAPI_addGroup_SearchUser = @"SearchUser";

// 屏蔽群消息
static NSString * const kDYJXAPI_SlientGroupMsg = @"SlientGroupMsg";

