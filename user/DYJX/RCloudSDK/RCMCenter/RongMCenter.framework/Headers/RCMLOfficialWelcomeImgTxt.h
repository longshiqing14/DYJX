
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialWelcomeImgTxt : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 欢迎标题
*/

@property(nonatomic, copy) NSString *welcomeTitle;


/**
 欢迎内容
*/

@property(nonatomic, copy) NSString *content;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
