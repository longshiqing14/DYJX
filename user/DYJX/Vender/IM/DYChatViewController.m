//
//  DYChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYChatViewController.h"

@interface DYChatViewController()

@end

@implementation DYChatViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.enableUnreadMessageIcon = YES;

    //************************************
    //注意根据需要添加相册、相机、定位、语音等权限
    //************************************

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadUI:) name:self.targetId object:nil];
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
