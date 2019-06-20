//
//  JXChatViewController.m
//  user
//
//  Created by longshiqing on 2018/12/15.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXChatViewController.h"
#import "DYJXUserInfoDetailPage.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import "DYJXCompanyInfoDetailPage.h"
#import "IQKeyboardManager.h"
#import "JSExtension.h"
#import "DYJXNewGroupController.h"

@interface JXChatViewController ()

@end

@implementation JXChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"聊天页";
    self.tableView.backgroundColor = [UIColor whiteColor];

    [self baseUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [[IQKeyboardManager sharedManager].disabledToolbarClasses addObject:[self class]];

}

-(void)dealloc {
    [JSExtension shared].chatVC = nil;
    [JSExtension shared].conversionId = @"";
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [[IQKeyboardManager sharedManager].disabledToolbarClasses removeObject:[self class]];

}

- (NSString *)sessionTitle {
    return self.naviTitle;
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"dyjx_three_dot") style:(UIBarButtonItemStylePlain) target:self action:@selector(pushDetail)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationItem.rightBarButtonItem=rightitem;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}


#pragma mark - Action
#pragma mark - NIMMessageCellDelegate
-(BOOL)onTapAvatar:(RCIMMessage *)message {
    [XYUserDefaults readLoginedModel];
    DYJXIdentitySwitchingModel *model = [UserManager shared].swichModel;
    if ([UserManager shared].isCompany == 1) { // 本人详情
        DYJXUserInfoDetailPage *page = [[DYJXUserInfoDetailPage alloc]init];
        page.userIconImageURL = [model.GroupHeadImg XYImageURL];
        [self.navigationController pushViewController:page animated:YES];
        //        target.type = XJGroupTypePerson;
    }
    else {
        if (model.IsPart) { // 子公司详情
            DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
            page.groupNumber = self.chatModel.targetId;
            page.isAdmin = [self isAdmin:model];
            [self.navigationController pushViewController:page animated:YES];
            //            target.type = XJGroupTypeSubCompany;
        }
        else { // 公司详情
            DYJXCompanyInfoDetailPage *page = [[DYJXCompanyInfoDetailPage alloc]init];
            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
            page.isAdmin = [self isAdmin:model];
            [self.navigationController pushViewController:page animated:YES];
            //            target.type = XJGroupTypeCompany;
        }
    }
    return YES;
}
-(void)pushDetail {
    [XYUserDefaults readLoginedModel];
    DYJXIdentitySwitchingModel *model = [UserManager shared].swichModel;
    DYJXNewGroupController *page = [[DYJXNewGroupController alloc]init];
    NSDictionary *dict = (NSDictionary *)self.chatModel.extend;

    if (self.chatModel.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
        page.userIconImageURL = self.chatModel.lastestMessage.senderUserInfo.portraitUri;
    }
    else if (dict[@"extra"]) {
        page.userIconImageURL = [NSString stringWithFormat:@"%@",dict[@"extra"]];
    }
    else {

    }
    page.groupId = self.targetId;//self.chatModel.targetId;
    page.groupType = DYJXGroupType_Details;
//    page.isAdmin = [self isAdmin:model];
    [self.navigationController pushViewController:page animated:YES];

//                target.type = XJGroupTypeSubCompany;

//    if ([UserManager shared].isCompany == 1) { // 本人详情
//        DYJXUserInfoDetailPage *page = [[DYJXUserInfoDetailPage alloc]init];
//        page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//        [self.navigationController pushViewController:page animated:YES];
//        //        target.type = XJGroupTypePerson;
//    }
//    else {
//        if (model.IsPart) { // 子公司详情
//            DYJXSubcompanyInfoDetailPage *page = [[DYJXSubcompanyInfoDetailPage alloc]init];
//            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//            page.groupNumber = self.chatModel.targetId;
//            page.isAdmin = [self isAdmin:model];
//            [self.navigationController pushViewController:page animated:YES];
//            //            target.type = XJGroupTypeSubCompany;
//        }
//        else { // 公司详情
//            DYJXCompanyInfoDetailPage *page = [[DYJXCompanyInfoDetailPage alloc]init];
//            page.userIconImageURL = [model.GroupHeadImg XYImageURL];
//            page.isAdmin = [self isAdmin:model];
//            [self.navigationController pushViewController:page animated:YES];
//            //            target.type = XJGroupTypeCompany;
//        }
//    }
}

-(BOOL)isAdmin:(DYJXIdentitySwitchingModel *)model {
    for (int i = 0; i < model.AdminUserIds.count; i++) {
        NSString *userId = model.AdminUserIds[i];
        if ([userId isEqualToString:[UserManager shared].login.UserID]) {
            return YES;
        }
    }
    return NO;
}

-(void)black_controller{
    [JSExtension shared].chatVC = nil;
    [JSExtension shared].conversionId = @"";
    [self.navigationController popViewControllerAnimated:YES];
}

@end
