
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialUpgrade : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 升级内容
*/

@property(nonatomic, copy) NSString *content;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 按钮标题
*/

@property(nonatomic, copy) NSString *buttonTitle;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
