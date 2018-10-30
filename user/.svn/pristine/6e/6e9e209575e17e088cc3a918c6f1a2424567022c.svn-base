//
//  JXElectronicInvoicePage.m
//  user
//
//  Created by 岩  熊 on 2018/3/1.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXElectronicInvoicePage.h"
#import "XYBaseModel.h"
@interface JXElectronicInvoicePage ()
@property (nonatomic, strong)UIButton *sendMSGBtn;
@end

@implementation JXElectronicInvoicePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"电子发票";
//    if ([YWDTools isNil:self.webURLstr]) {
//        
//     self.webURLstr = @"http://113.105.135.250:5019/AisinoFp3/pd?id=201801140915021769558_044001611111_72628348.pdf";
//        
//    }

    
    [self loadRequestUrl];
    [self initSubViews];
    
}

- (void)initSubViews{
    [self.myWebView addSubview:self.sendMSGBtn];
    
    [self.sendMSGBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)sendMSGBtn{
    if (!_sendMSGBtn) {
        _sendMSGBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_sendMSGBtn setTitle:@"发送到邮箱" forState:(UIControlStateNormal)];
        [_sendMSGBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        _sendMSGBtn.backgroundColor = [UIColor colorWithHexString:@"#EC3B2C"];
        _sendMSGBtn.layer.cornerRadius = 2.0;
        _sendMSGBtn.layer.masksToBounds = YES;
        [_sendMSGBtn addTarget:self action:@selector(sendMSGToClient:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _sendMSGBtn;
}

- (void)sendMSGToClient:(UIButton*)sender
{
    WeakSelf;
    
    [[UIAlertController alertWithTitle:@"发送电子发票"
                                  text:nil
                       leftButtonTitle:@"取消"
                      rightButtonTitle:@"确定"
                  textFieldPlaceHolder:self.invoiceE_mail
                destructiveButtonIndex:1
           textFieldConfigurationBlock:^(UITextField *textField) {
               
           } handleBlock:^(NSUInteger buttonIndex, NSString *text) {
               if (buttonIndex == 1) {
                   
              
               if ([YWDTools isNil:self.invoiceE_mail] && [YWDTools isNil:text]) {
                   [YDBAlertView showToast:@"请填写邮箱"];
                   return;
               }
               if (![YWDTools isNil:text]) {
                   //发送到填写的邮箱
                   [self sendInvoiceToE_mial:text];
               }
               if (![YWDTools isNil:self.invoiceE_mail]) {
                   //发送到默认邮箱
                   [self sendInvoiceToE_mial:self.invoiceE_mail];
               }
                    }
               
           }] show];
    


}

- (void)sendInvoiceToE_mial:(NSString *)email{
    /*
     merchantId
     invoiceMail
     invoiceURL
     */
//    NSString * merchantId = [XYUserDefaults readAppDlegateOfUser_cityOfMerchantId];
    NSDictionary *requstDic = [NSMutableDictionary dictionary];
//    [requstDic setValue:merchantId forKey:@"merchantId"];
    [requstDic setValue:email forKey:@"invoiceMail"];
    [requstDic setValue:self.webURLstr forKey:@"invoiceURL"];
    [requstDic setValue:self.orderId forKey:@"orderId"];
    [self network:requstDic relativePath:kJXAPI_user_orderInvoiceSendMail ShowAndDismiss:NO success:^(id responseObject) {
        
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0)), dispatch_get_main_queue(), ^{
                [YDBAlertView showToast:@"发送成功"];
            });
        }];
        [[NSOperationQueue mainQueue] addOperation:op];

    } failure:^{
        
    } UnusualFailure:^{
        
    }];
    
    
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
