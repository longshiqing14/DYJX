
#import <RongIMLib/RongIMLib.h>

@interface RCMLWelfareGift : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 福利的标题
*/

@property(nonatomic, copy) NSString *welfareTitle;


/**
 福利的内容
*/

@property(nonatomic, copy) NSString *welfareContent;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
