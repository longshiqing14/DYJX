//
//  DYJXContactDetailsTopView.h
//  user
//
//  Created by YP on 2019/5/12.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYJXUserInfoModel.h"

typedef void(^InviteIngGroupBlock)(void);

typedef NS_ENUM(NSUInteger, ContactType) {
    ContactType_Normal,
    ContactType_Friend,
    ContactType_Ordinary,
    ContactType_Black,
    ContactType_Delete
};

NS_ASSUME_NONNULL_BEGIN

@interface DYJXContactDetailsTopView : UIView

@property (nonatomic, assign) ContactType type;

-(instancetype)initWithTitle:(NSString *)title topBtnArray:(NSArray *)topBtnArray inviteIngGroupBlocki:(InviteIngGroupBlock)inviteIngGroupBlocki;

- (void)setTypeWithRelation:(NSDictionary *)relation;

@end

NS_ASSUME_NONNULL_END
