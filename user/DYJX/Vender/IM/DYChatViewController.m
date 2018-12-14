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
#import <RongIMLib/RongIMLib.h>
#import "SimpleMessage.h"
#import "SimpleMessageCell.h"

@interface DYChatViewController()<RCIMReceiveMessageDelegate>

@end

@implementation DYChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.enableUnreadMessageIcon = YES;
    self.navigationItem.title = self.chatModel.conversationTitle;

    [[RCIMClient sharedRCIMClient] registerMessageType:SimpleMessage.class];
//    [[RCIMClient sharedRCIMClient] registerMessageType:SimpleMessage.class];
    [self registerClass:[SimpleMessageCell class] forMessageClass:[SimpleMessage class]];
    [self.conversationMessageCollectionView registerClass:[SimpleMessageCell class] forCellWithReuseIdentifier:@"SimpleMessageCell"];

//    [self.conversationMessageCollectionView reloadData];
    //************************************
    //注意根据需要添加相册、相机、定位、语音等权限
    //************************************
    [self baseUI];

     [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
    [RCIM sharedRCIM].receiveMessageDelegate=self;
    self.conversationMessageCollectionView.backgroundColor = [UIColor whiteColor];

//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveMessageNotification:)]


}

- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent {
    SimpleMessage *model = [[SimpleMessage alloc] init];
    model.senderUserInfo = messageContent.senderUserInfo;
    model.mentionedInfo = messageContent.mentionedInfo;
    model.rawJSONData = messageContent.rawJSONData;
    model.content = @"13612846724";
    model.extra = @"122312";
    return model;
}

//-(RCMessage *)willAppendAndDisplayMessage:(RCMessage *)message {
//    SimpleMessage *model = [[SimpleMessage alloc] init];
////    model.senderUserInfo = message.senderUserInfo;
////    model.mentionedInfo = message.mentionedInfo;
////    model.rawJSONData = message.rawJSONData;
//    model.content = @"123";
//    model.extra = @"122312";
//    return model;
//}


-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    UIBarButtonItem *rightitem=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"dyjx_three_dot") style:(UIBarButtonItemStylePlain) target:self action:@selector(pushDetail)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationItem.rightBarButtonItem=rightitem;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

    
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    if ([cell isKindOfClass:[RCMessageCell class]]) {
//        RCMessageCell *messageCell = (RCMessageCell *)cell;
//        messageCell.messageContentView.backgroundColor = [UIColor yellowColor];
//
//        if ([cell isKindOfClass:[RCTextMessageCell class]]){
//            RCTextMessageCell *textCell = (RCTextMessageCell *)cell;
//        }
//        else if ([cell isKindOfClass:[RCVoiceMessageCell class]])
//        {
//
//        }
//        else if ([cell isKindOfClass:[RCRichContentMessageCell class]])
//        {
//
//        }
//        else if ([cell isKindOfClass:[RCImageMessageCell class]])
//        {
//
//        }
//        else if ([cell isKindOfClass:[RCLocationMessageCell class]])
//        {
//
//        }
//        messageCell.messageTimeLabel.hidden = false;
//        messageCell.messageTimeLabel.text = @"1234566";
//        UILabel *redView = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, messageCell.messageContentView.superview.frame.origin.y - 10, 120, 16)];
//        //    redView.backgroundColor = [UIColor redColor];
//        redView.text = @"hahah";
//        [cell addSubview:redView];
//
////                [redView mas_updateConstraints:^(MASConstraintMaker *make) {
////                    make.bottom.equalTo(messageCell.portraitImageView).offset(-40);
////                    make.right.mas_equalTo(-60);
////                }];
//
//
//        CGRect rect = messageCell.messageContentView.frame;
//        rect.origin.y = 30;
//        messageCell.messageContentView.frame = rect;
//
//        //    cell.baseContentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
//        RCMessageModel *model = self.conversationDataRepository[indexPath.row];
//        model.isDisplayNickname = YES;
//        model.objectName = @"79879879674684654564564654564654";
//        [cell setDataModel:model];
//    }
}
-(RCMessageBaseCell *)rcConversationCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCMessageModel *model = self.conversationDataRepository[indexPath.row];
    NSString * cellIndentifier=@"SimpleMessageCell";
    SimpleMessageCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier           forIndexPath:indexPath];
    [cell setDataModel:model];
    return cell;
}
-(CGSize)rcConversationCollectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //返回自定义cell的实际高度（这里请返回消息的实际大小）
    return CGSizeMake(300, 120);
}
- (CGSize)rcUnkownConversationCollectionView:(UICollectionView *)collectionView
                                      layout:(UICollectionViewLayout *)collectionViewLayout
                      sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(300, 120);
}

//*********************插入自定义Cell*********************//
- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    NSLog(@"%@--\n%d",message,left);
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

@end
