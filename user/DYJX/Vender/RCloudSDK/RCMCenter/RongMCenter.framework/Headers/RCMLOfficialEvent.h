
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialEvent : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 活动标题
*/

@property(nonatomic, copy) NSString *eventTitle;


/**
 活动内容
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
