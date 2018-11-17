
#import <RongIMLib/RongIMLib.h>

@interface RCMLCommunityHelpInfo : RCMessageContent

/**
 求助者的用户Id
*/

@property(nonatomic, copy) NSString *opreatorId;


/**
 求助者的用户昵称
*/

@property(nonatomic, copy) NSString *opreatorName;


/**
 求助者的用户头像图片URL
*/

@property(nonatomic, copy) NSString *opreatorPortraitUrl;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 求助内容
*/

@property(nonatomic, copy) NSString *content;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
