//
//  DYChatViewController.m
//  user
//
//  Created by longshiqing on 2018/11/13.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYChatViewController.h"
#import "IQKeyboardManager.h"

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
    [self baseUI];

}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

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
