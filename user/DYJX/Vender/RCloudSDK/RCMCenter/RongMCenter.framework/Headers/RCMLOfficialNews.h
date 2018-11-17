
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialNews : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 新闻内容
*/

@property(nonatomic, copy) NSString *content;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 新闻标题
*/

@property(nonatomic, copy) NSString *newsTitle;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
