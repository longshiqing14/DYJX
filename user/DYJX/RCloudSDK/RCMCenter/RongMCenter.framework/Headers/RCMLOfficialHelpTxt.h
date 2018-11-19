
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialHelpTxt : RCMessageContent

/**
 帮助内容
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
