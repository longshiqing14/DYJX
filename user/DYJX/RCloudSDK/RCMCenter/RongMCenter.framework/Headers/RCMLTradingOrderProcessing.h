
#import <RongIMLib/RongIMLib.h>

@interface RCMLTradingOrderProcessing : RCMessageContent

/**
 消息的内容
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
