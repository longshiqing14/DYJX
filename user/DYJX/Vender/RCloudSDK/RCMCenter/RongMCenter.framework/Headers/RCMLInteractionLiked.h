
#import <RongIMLib/RongIMLib.h>

@interface RCMLInteractionLiked : RCMessageContent

/**
 点赞者的用户Id
*/

@property(nonatomic, copy) NSString *opreatorId;


/**
 点赞者的用户昵称
*/

@property(nonatomic, copy) NSString *opreatorName;


/**
 点赞者的用户头像图片URL
*/

@property(nonatomic, copy) NSString *opreatorPortraitUrl;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
