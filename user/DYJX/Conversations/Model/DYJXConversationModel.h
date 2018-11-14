//
//  DYJXConversationModel.h
//  user
//
//  Created by 岩  熊 on 2018/11/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DYJXConversationModel : NSObject
@property (nonatomic, copy)NSString *FromId;
@property (nonatomic, copy)NSString *FromName;
@property (nonatomic, copy)NSString *FromHeadImg;
@property (nonatomic, copy)NSString *TargetId;
@property (nonatomic, copy)NSString *TargetName;
//@property (nonatomic, copy)NSString *FromId;
/*
 "TargetName": "达意软件",
 "TargetHeadImg": "fa21b8ce-d086-4cf8-864c-1d60ee6e8f59.jpg",
 "Type": 0,
 "LastMsg": {
 "FromId": "8cba1012-a5a6-4151-9910-87d83f960621",
 "FromCertifyId": "52f18d77-4957-44e5-9d2b-3a2d4fa4bd7b",
 "TargetType": 0,
 "Target": "b85d3c2e-4083-4642-97c5-014fadcb8a0a",
 "TargetId": "b85d3c2e-4083-4642-97c5-014fadcb8a0a",
 "ConversationId": "00000000-0000-0000-0000-000000000000",
 "MessageType": 0,
 "Body": "{\"content\":\"还是\"}",
 "RowData": "{\"content\":\"还是\",\"extra\":\"{\\\"Id\\\":\\\"933fb374-d39a-48ad-ac32-509c4fbbd383\\\",\\\"ConversationId\\\":\\\"5e25df09-1c49-4b21-9c83-31983fc0b80d\\\",\\\"FromId\\\":\\\"8cba1012-a5a6-4151-9910-87d83f960621\\\",\\\"FromName\\\":\\\"老L\\\",\\\"FromHeadImg\\\":\\\"bd6e02f8-8d91-4e4d-bff8-218364451880.png\\\",\\\"FromCertifyId\\\":\\\"52f18d77-4957-44e5-9d2b-3a2d4fa4bd7b\\\",\\\"FromCertifyName\\\":\\\"xtt有限公司\\\",\\\"FromCertifyHeadImg\\\":\\\"d4c14c3e-33ec-4438-ac58-781ee85bb589.png\\\",\\\"TargetId\\\":\\\"b85d3c2e-4083-4642-97c5-014fadcb8a0a\\\",\\\"TargetName\\\":\\\"达意软件\\\",\\\"TargetHeadImg\\\":\\\"fa21b8ce-d086-4cf8-864c-1d60ee6e8f59.jpg\\\",\\\"TargetType\\\":0,\\\"GType\\\":0,\\\"GMembers\\\":null,\\\"MessageType\\\":0,\\\"ImKey\\\":\\\"RongCloud\\\",\\\"Keywords\\\":\\\"还是\\\",\\\"MsgTime\\\":\\\"2018-10-16T16:23:41.067775+08:00\\\"}\"}",
 "ImKey": "RongCloud",
 "SendType": 3,
 "Keywords": "还是",
 "Deleted": false,
 "Disabled": false,
 "CreateOn": "2018-10-16 16:23:41",
 "CreateBy": "老L[8cba1012-a5a6-4151-9910-87d83f960621]",
 "Id": "933fb374-d39a-48ad-ac32-509c4fbbd383"
 },
 "Deleted": false,
 "Disabled": false,
 "CreateOn": "2018-07-11 09:38:44",
 "CreateBy": "52f18d77-4957-44e5-9d2b-3a2d4fa4bd7b",
 "UpdateOn": "2018-10-16 16:23:41",
 "UpdateBy": "老L[8cba1012-a5a6-4151-9910-87d83f960621]",
 "Id": "5e25df09-1c49-4b21-9c83-31983fc0b80d"
 */
@end
