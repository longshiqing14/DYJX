//
//  XYAppyChinaPayModel.h
//  user
//
//  Created by liu_yakai on 2018/1/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXAppyChinaPayInforModel : NSObject
@property(nonatomic,strong)NSString *androidPayInfo;
@property(nonatomic,strong)NSString *paySign;

@end

@interface JXAppyChinaPayModel : NSObject
@property(nonatomic,strong)NSString *RETURN_CODE;
@property(nonatomic,strong)JXAppyChinaPayInforModel *RETURN_DATA;
@property(nonatomic,strong)NSString *RETURN_DESC;
@property(nonatomic,strong)NSString *RETURN_STAMP;
@end
