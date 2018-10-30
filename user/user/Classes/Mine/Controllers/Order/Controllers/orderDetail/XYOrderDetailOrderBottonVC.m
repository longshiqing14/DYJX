//
//  XYOrderDetailOrderBottonVC.m
//  user
//
//  Created by xingyun on 2017/9/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailOrderBottonVC.h"
#import "XYPay.h"
#import "XYPlayModel.h"
#import "XYOrderDetailOrderNumQRcodeVC.h" //提货码
#import "XYOrderDetailSubClassOrderStatusVC.h"  //物流
#import "XYPayOrderSuccessVC.h"
#import "XYOrderDetailModel.h"
#import "JXConfirmSuccessViewController.h"
#import "XYOrderAllNet.h"  //请求

#import "XYOrderDetailPayPickView.h"  //选择  支付方式
#import "JXAppyChinaPayModel.h"

@interface XYOrderDetailOrderBottonVC ()<XYOrderDetailPayPickViewDelegate>

/** 取消订单  按钮 */
@property (nonatomic, strong) UIButton * orderCancelBT;

/** 物流信息  按钮 */
@property (nonatomic, strong) UIButton * orderEliveryBT;

/** 订单 提取码 按钮 */
@property (nonatomic, strong) UIButton * orderNumBT;

/** 订单 支付 按钮 */
@property (nonatomic, strong) UIButton * orderPayBT;

@end

@implementation XYOrderDetailOrderBottonVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYWhiteColor;
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(receiveNotificiationUN:) name:@"playUN" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotificiation:) name:@"play" object:nil];
    
    [self addViewAndLayout];

}

- (void)receiveNotificiationUN:(NSNotification*)sender{
    WeakSelf;
    NSString *key=[sender.userInfo valueForKey:@"code"];
    if ([key isEqualToString:@"success"]) {
         [weakSelf pushController:@"银联支付"];
    }else{
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
    }
    //    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
    //    NSLog(@"%@",plaAlBBModel);
    //    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
    //        [weakSelf pushcontroller];
    //    }else{
    //        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:plaAlBBModel.memo dismissTimeInterval:1.0];
    //        if (self.aliasCode != nil) {
    //            XYOrderDetailSubClassOrderDetailVC * orderDetailVC = [[XYOrderDetailSubClassOrderDetailVC alloc]init];
    //            orderDetailVC.order_ID = self.aliasCode;
    //            orderDetailVC.isOrderConfirmPush = YES;
    //            [weakSelf.navigationController pushViewController:orderDetailVC animated:YES];
    //        }else{
    //            [self.navigationController popViewControllerAnimated:YES];
    //            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"请前往订单详情页查看订单状态" dismissTimeInterval:1.0];
    //        }
    //    }
}

- (void)receiveNotificiation:(NSNotification*)sender{
    WeakSelf;
    XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:sender.userInfo];
    NSLog(@"%@",plaAlBBModel);
    if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
        [weakSelf pushController:@"支付宝支付"];
    }else{
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        
    }
}

- (void)setDetailModel:(XYOrderDetailModel *)detailModel
{
    _detailModel = detailModel;
    
    //    p100:待付款,p101:待发货,p102:待收货,p112:已完成,p111:已取消
    
    
    if ([_detailModel.processStateInfo.state isEqualToString:@"p100"]){
        [self updateView:self.orderCancelBT width:80 height:33];
        [self updateView:self.orderPayBT width:80 height:33];
        [self updateView:self.orderNumBT width:0 height:0];
        [self updateView:self.orderEliveryBT width:0 height:0];
    }else if ([_detailModel.processStateInfo.state isEqualToString:@"p101"]) {
        
        [self updateView:self.orderCancelBT width:0 height:0];
        [self updateView:self.orderPayBT width:0 height:0];
        [self updateView:self.orderNumBT width:0 height:0];
        [self updateView:self.orderEliveryBT width:80 height:33];
    }else if ([_detailModel.processStateInfo.state isEqualToString:@"p102"]){
        [self.orderNumBT setTitle:@"确认收货" forState:UIControlStateNormal];
        [self updateView:self.orderCancelBT width:0 height:0];
        [self updateView:self.orderPayBT width:0 height:0];
        [self updateView:self.orderNumBT width:80 height:33];
        [self updateView:self.orderEliveryBT width:80 height:33];
    }else if ([_detailModel.processStateInfo.state isEqualToString:@"p111"]){
        [self updateView:self.orderCancelBT width:0 height:0];
        [self updateView:self.orderPayBT width:0 height:0];
        [self updateView:self.orderNumBT width:0 height:0];
        [self updateView:self.orderEliveryBT width:80 height:33];
    }else if ([_detailModel.processStateInfo.state isEqualToString:@"p112"]){
        [self updateView:self.orderCancelBT width:0 height:0];
        [self updateView:self.orderPayBT width:0 height:0];
        [self updateView:self.orderNumBT width:0 height:0];
        [self updateView:self.orderEliveryBT width:80 height:33];

    }
    
    

    
}

- (void)updateView:(UIButton*)sender width:(CGFloat)width height:(CGFloat)height
{
    [sender mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
}


/** 添加 view */
- (void)addViewAndLayout
{
    UIView * supperView = self.view;
    
    [self.view addSubview:self.orderNumBT];
    [self.orderNumBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.orderPayBT];
    [self.orderPayBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.orderCancelBT];
    [self.orderCancelBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_orderPayBT.mas_left).offset(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.orderEliveryBT];
    [self.orderEliveryBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_orderNumBT.mas_left).offset(XY_Right_Margin);
        make.centerY.mas_equalTo(supperView.mas_centerY);
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
    }];
    
}




#pragma mark - 懒加载

- (UIButton*)orderCancelBT
{
    if (_orderCancelBT == nil) {
        _orderCancelBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderCancelBT.frame = CGRectZero;
        
        [_orderCancelBT setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _orderCancelBT.titleLabel.font = XYFont_14;
        
        _orderCancelBT.layer.cornerRadius = 5;
        _orderCancelBT.layer.masksToBounds = YES;
        
        _orderCancelBT.layer.borderWidth = 0.5;
        _orderCancelBT.layer.borderColor = XYGrayColor.CGColor;
        
        [_orderCancelBT setTitle:@"取消" forState:UIControlStateNormal];
        
        [_orderCancelBT addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _orderCancelBT;
}

- (UIButton*)orderEliveryBT
{
    if (_orderEliveryBT == nil) {
        _orderEliveryBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderEliveryBT.frame = CGRectZero;
        
        [_orderEliveryBT setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
        _orderEliveryBT.titleLabel.font = XYFont_14;
        
        _orderEliveryBT.layer.cornerRadius = 5;
        _orderEliveryBT.layer.masksToBounds = YES;
        
        _orderEliveryBT.layer.borderWidth = 0.5;
        _orderEliveryBT.layer.borderColor = XYFontTitleColor.CGColor;
        
        [_orderEliveryBT setTitle:@"配送状态" forState:UIControlStateNormal];
        
        [_orderEliveryBT addTarget:self action:@selector(eliveryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _orderEliveryBT;
}

- (UIButton*)orderNumBT
{
    if (_orderNumBT == nil) {
        _orderNumBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderNumBT.frame = CGRectZero;
        
        [_orderNumBT setTitleColor:XYMainColor forState:UIControlStateNormal];
        _orderNumBT.titleLabel.font = XYFont_14;
        
        _orderNumBT.layer.cornerRadius = 5;
        _orderNumBT.layer.masksToBounds = YES;
        
        _orderNumBT.layer.borderWidth = 0.5;
        _orderNumBT.layer.borderColor = XYMainColor.CGColor;
        
        [_orderNumBT setTitle:@"查看提货码" forState:UIControlStateNormal];
        
        [_orderNumBT addTarget:self action:@selector(orderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _orderNumBT;
}

- (UIButton*)orderPayBT
{
    if (_orderPayBT == nil) {
        _orderPayBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderPayBT.frame = CGRectZero;
        
        [_orderPayBT setTitleColor:XYMainColor forState:UIControlStateNormal];
        _orderPayBT.titleLabel.font = XYFont_14;
        
        _orderPayBT.layer.cornerRadius = 5;
        _orderPayBT.layer.masksToBounds = YES;
        
        _orderPayBT.layer.borderWidth = 0.5;
        _orderPayBT.layer.borderColor = XYMainColor.CGColor;
        
        [_orderPayBT setTitle:@"立即支付" forState:UIControlStateNormal];
        
        [_orderPayBT addTarget:self action:@selector(payButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _orderPayBT;
}

#pragma mark - button click

/** 取消 订单 */
- (void)cancelButtonClick:(UIButton*)sender
{
    if (_detailModel == nil) {
        return;
    }
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定取消这个订单？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    WeakSelf;
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf netOrderCancelData];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
    

}
/**  物流状态 */
- (void)eliveryButtonClick:(UIButton*)sender
{
    if (_detailModel == nil) {
        return;
    }
    
    XYOrderDetailSubClassOrderStatusVC * statusVC = [[XYOrderDetailSubClassOrderStatusVC alloc]init];
    statusVC.order_ID = _detailModel.aliasCode;
    [self.navigationController pushViewController:statusVC animated:YES];
    
}

/** 查看提货码 */
- (void)orderButtonClick:(UIButton*)sender
{
    if (_detailModel == nil) {
        return;
    }
    
    if([_detailModel.processStateInfo.state isEqualToString:@"p102"]){
        NSLog(@"确认收货");
        WeakSelf;
//        UIAlertView *AlertView=[[UIAlertView alloc]initWithTitle:@"确认收货" message:@"是否已收到商品?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        UIAlertController
//        [AlertView show];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确认收货" message:@"是否已收到商品?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [weakSelf ConfirmationReceipt];                       //响应事件
                                                                  NSLog(@"action = %@", action);
                                                              }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                             }];
        [defaultAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
        [alert addAction:cancelAction];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        XYOrderDetailOrderNumQRcodeVC * qrcodeVC = [[XYOrderDetailOrderNumQRcodeVC alloc]init];
        qrcodeVC.orderNum = _detailModel.aliasCode;
        [self.navigationController pushViewController:qrcodeVC animated:YES];
    }

}


//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    NSLog(@"%d",buttonIndex);
//    if (buttonIndex==1) {
//        [self ConfirmationReceipt];
//    }
//}


/** 订单确认页 */
- (void)ConfirmationReceipt
{
    WeakSelf;
    [XYOrderAllNet ConfirmationReceiptOder:_detailModel.aliasCode Block:^(NSDictionary *blockDictionary, NSError *error) {
        if (!error) {
            if ([[blockDictionary objectForKey:@"status"] isEqualToString:@"0"]) {
                JXConfirmSuccessViewController *confirmSuccessViewController=[[JXConfirmSuccessViewController alloc]init];
                [weakSelf.navigationController pushViewController:confirmSuccessViewController animated:YES];
            }
        }
    }];
    
    
}

/** 支付 */
- (void)payButtonClick:(UIButton*)sender
{
    if (_detailModel == nil) {
        return;
    }
    XYOrderDetailPayPickView * pickView = [[XYOrderDetailPayPickView alloc]initWithPayTotal:_detailModel.totalOrderNeedPayPrice paymentTypes:self.paymentModel.paymentArr];
    pickView.delegate = self;
    [pickView show];
    

}

#pragma mark - XYOrderDetailPayPickViewDelegate

- (void)pickPayType:(NSString*)payType needTotal:(NSString*)needTotal
{
    if (payType==nil) {
        [YDBAlertView showToast:@"请选择支付类型" dismissDelay:1.0];
    }else{
       if ([payType isEqualToString:JX_PAYMENT_TYPE_UNION]){
            [self UNIONplay:_detailModel.aliasCode PlayType:JX_PAYMENT_TYPE_UNION];
       }else{
           
       [self encryptedOrder:_detailModel.aliasCode PlayType:payType];
    }
    
    }
    
}

    

-(void)UNIONplay:(NSString *)oderID PlayType:(NSString *)playType{
    //    @{@"orderIds":oderID,@"payi":playType}
    [XYPay requestParameter:@{@"orderIds":oderID,@"payId":playType} relativePath:kJXAPI_user_ChinaPay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        JXAppyChinaPayModel *appyChinaPayModel=[JXAppyChinaPayModel modelWithJSON:responseObject];
        if ([appyChinaPayModel.RETURN_CODE isEqualToString:ERROR_NUM_STRING]) {
            [XYPay unionPay:appyChinaPayModel.RETURN_DATA.paySign ViewController:self];
        }else{
            [YDBAlertView showToast:appyChinaPayModel.RETURN_DESC dismissDelay:1.0];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

-(void)encryptedOrder:(NSString *)oder PlayType:(NSString *)playType{
    __weak typeof(self)SelfWeek=self;
    if (oder!=nil&&![oder isEqualToString:@""]) {
        [XYPay requestParameter:@{@"payId":playType,@"orderIds":oder} relativePath:@"pay.handler" success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            XYBaseModel *xyBaseModel=[XYBaseModel mj_objectWithKeyValues:responseObject];
            if ([xyBaseModel.RETURN_CODE isEqualToString:@"S0A00000"]) {
               
                //            支付宝
                if ([playType isEqualToString:@"payi_132"]) {
                     XYPlayInfoModel *xyPlayInfoModel=[XYPlayInfoModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek playAlipay:xyPlayInfoModel.androidPayInfo];
                }else{
                    //                微信
                    XYWXPayModel *xyWXPayModel=[XYWXPayModel mj_objectWithKeyValues:xyBaseModel.RETURN_DATA];
                    [SelfWeek wxpay:xyWXPayModel.paySign];
                }
            }else{
                [YDBAlertView showToast:xyBaseModel.RETURN_DESC dismissDelay:1.0];
                
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }
}


-(void)wxpay:(XYWXPaySignModel *)wXPaySignModel{
    [XYPay wxpay:wXPaySignModel];
    WeakSelf;
    [XYPay shareXYPay].Failure = ^(BaseResp *baseResp) {
        NSLog(@"%@",baseResp);
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        
    } ;
    [XYPay shareXYPay].Success = ^(PayResp *payResp) {
        NSLog(@"%@",payResp);
        [weakSelf pushController:@"微信支付"];
        
    } ;
}

-(void)playAlipay:(NSString *)alipay{
    WeakSelf;
    [XYPay alipay:alipay success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        XYPlaAlBBModel *plaAlBBModel=[XYPlaAlBBModel mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",plaAlBBModel);
        if ([plaAlBBModel.resultStatus isEqualToString:@"9000"]) {
            [weakSelf pushController:@"支付宝支付"];
            
        }else{
//            [XYProgressHUD svHUDShowStyle:XYHUDStyleError title:@"充值失败" dismissTimeInterval:1.0];
            [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"支付失败" dismissTimeInterval:1.0];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)pushController:(NSString *)playStr{
    XYPayOrderSuccessVC *xyPayOrderSuccessVC=[[XYPayOrderSuccessVC alloc]init];
    xyPayOrderSuccessVC.paymentAmountString=_detailModel.totalOrderNeedPayPrice;
    xyPayOrderSuccessVC.paymentType=playStr;
    [self.navigationController pushViewController:xyPayOrderSuccessVC animated:YES];
    
}


#pragma mark - data net
/** 取消订单 */
- (void)netOrderCancelData
{
    WeakSelf;
    [XYOrderAllNet netOrderCancelWithOrderid:self.detailModel.aliasCode Block:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(orderDetailBottomCancelButton)]) {
                [weakSelf.delegate orderDetailBottomCancelButton];
            }
            
        }
    }];
    
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
