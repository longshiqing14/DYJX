//
//  DYChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYChatViewController.h"
#import "IQKeyboardManager.h"
#import "DYJXUserInfoDetailPage.h"
#import "DYJXSubcompanyInfoDetailPage.h"
#import "DYJXCompanyInfoDetailPage.h"

@interface DYChatViewController()

@end

@implementation DYChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.enableUnreadMessageIcon = YES;
    self.navigationItem.title = self.chatModel.conversationTitle;

    //************************************
    //注意根据需要添加相册、相机、定位、语音等权限
    //************************************
    [self baseUI];

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

-(void)pushDetail {
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

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:false];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadUI:) name:self.targetId object:nil];
}

-(void)dealloc {
    [[IQKeyboardManager sharedManager] setEnable:true];
}

-(void)reloadUI:(NSNotification *)notif{

    RCMessage *message = notif.object;
    //刷新UI----在会话页面中插入一条消息并展示
    [self appendAndDisplayMessage:message];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
