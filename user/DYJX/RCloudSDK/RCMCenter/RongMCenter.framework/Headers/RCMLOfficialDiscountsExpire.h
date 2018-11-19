
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialDiscountsExpire : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 到期通知内容
*/

@property(nonatomic, copy) NSString *content;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 到期通知标题
*/

@property(nonatomic, copy) NSString *contentTitle;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
