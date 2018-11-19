
#import <RongIMLib/RongIMLib.h>

@interface RCMLWelfareRedPacket : RCMessageContent


/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 红包内容
*/

@property(nonatomic, copy) NSString *content;


/**
 红包点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
