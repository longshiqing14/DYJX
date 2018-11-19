
#import <RongIMLib/RongIMLib.h>

@interface RCMLOfficialHelpImgTxt : RCMessageContent

/**
 图片的Url
*/

@property(nonatomic, copy) NSString *imageUrl;


/**
 帮助的内容
*/

@property(nonatomic, copy) NSString *helpTitle;


/**
 点击内容跳转的Url
*/

@property(nonatomic, copy) NSString *contentUrl;


/**
 按钮的标题
*/

@property(nonatomic, copy) NSString *buttonTitle;


/**
 附加信息
*/

@property(nonatomic, copy) NSString *extra;



@end
