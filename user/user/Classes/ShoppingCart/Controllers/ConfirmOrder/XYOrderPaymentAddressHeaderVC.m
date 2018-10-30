//
//  XYOrderPaymentAddressHeaderVC.m
//  XY
//
//  Created by xingyun on 2017/9/9.
//  Copyright © 2017年 yongxing. All rights reserved.
//

#import "XYOrderPaymentAddressHeaderVC.h"

#import "XYDeliveryWayPopView.h"
#import "XYDelieveryAddressVC.h"

#import "XYOrderFromDetailModel.h"
#import "XYShoppingCartNet.h"
#import "JXDeliverWayVC.h"

@interface XYOrderPaymentAddressHeaderVC ()<XYDelieveryAddressVCDelegate,XYDeliveryWayPopViewDelegate>
/** 配送方式 */
@property(nonatomic,strong) UILabel *deliverStyleLab;
/** 送货上门 */
@property(strong,nonatomic) UILabel *deliverLab ;
/** 送货上门右侧按钮 */
@property(strong,nonatomic) UIImageView *deliverNextImgV ;

/** 配送方式背景图 */
@property(strong,nonatomic) UIView *deliverBgView ;

/** 按钮覆盖层 */
@property(strong,nonatomic) UIButton *deliverCoverBtn ;

/************************* 上面配送层 *****************************/
/** 地址背景层 */
@property(strong,nonatomic) UIImageView *addressBackgroundImgV ;
/** 收货人 */
@property(strong,nonatomic) UILabel *receiverLab ;

/** 收货人姓名标签 */
@property(strong,nonatomic) UILabel *receiverNameLab ;
/** 手机号码 */
@property(strong,nonatomic) UILabel *phoneNumLab ;
/** 地址图片 */
@property(strong,nonatomic) UIImageView *addressImgV ;
/** 地址标签 */
@property(strong,nonatomic) UILabel *addressLab ;
/** 地址下一侧 */
@property(strong,nonatomic) UIImageView *addressNextImgV ;

/** 地址覆盖层按钮 */
@property(strong,nonatomic) UIButton *addressCoverBtn ;

/** 定义个字体颜色 */
@property(strong,nonatomic) UIColor *KAddressColor ;





/***--------------------------------------**/

/** 配送方式下的线 */
@property(strong,nonatomic) UIView *deliveryBottomLineView ;
/** 取货地址视图 */
@property(strong,nonatomic) UIView *pickupAddressView ;
/** 自提地址 */
@property(strong,nonatomic) UILabel *pickupAddressLab ;
/** 自提联系电话 */
@property(strong,nonatomic) UILabel *pickupContractMobileLab ;
/** 底边线 */
@property(strong,nonatomic) UIView *bottomLineView ;


@property(nonatomic ,copy)NSString *AdressName;
@end


@implementation XYOrderPaymentAddressHeaderVC


/** view  高度 */
const CGFloat payment_address_height = 200;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XYWhiteColor;
    

  

    
}

-(void)setIsdefault:(BOOL)isdefault
{
    _isdefault = isdefault;
    
    if (_isdefault) {
        
        self.pickupAddressView.hidden = NO;
    }else
    {
        self.pickupAddressView.hidden = YES;
    }
  
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)setAddressModel:(XYAddressListModel *)addressModel
{
    _addressModel = addressModel;


    
    [self creatGui];
}

-(void)setCartId:(NSString *)cartId
{
    _cartId = cartId;
}

-(void)setDeliveryWay:(NSString *)deliveryWay
{
    _deliveryWay = deliveryWay;
    
    self.deliverLab.text = deliveryWay;
  
//    [self creatGui];


    
    
}

-(void)setDeliveryWayArr:(NSArray *)deliveryWayArr
{
    _deliveryWayArr = deliveryWayArr;
    if (deliveryWayArr.count<2) {
        self.deliverNextImgV.image = [UIImage imageNamed:@""];
    }else
    {
        self.deliverNextImgV.image = [UIImage imageNamed:@"order_icon_more"];
    }
}



-(void)setPonitInfoModel:(XYOrderFromDetailDeliveryPointInfoModel *)ponitInfoModel
{
    _ponitInfoModel = ponitInfoModel;
 
    self.pickupAddressLab.text = [NSString stringWithFormat:@"自提地址:%@",ponitInfoModel.address ];
    self.pickupContractMobileLab.text = [NSString stringWithFormat:@"联系电话:%@",ponitInfoModel.mobile ];
//    self.AdressName = ponitInfoModel.name;

}

-(void)creatGui{

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    
    self.view.backgroundColor = XYWhiteColor;
    

   
    

  NSLog(@"%@",self.warnLab.text);
    if (self.addressModel.address.length != 0) {
        [self updateInfoWithModel:self.addressModel];
        self.deliverBgView.hidden = NO;
        if (self.isdefault) {//是自提
//            if (self.warnLab.text.length<=0) {
//                self.warnLab.frame = CGRectZero;
//                self.deliverBgView.frame = CGRectMake(0, 65, XYScreenW, 44);;//配送方式背景图
//                self.deliveryBottomLineView.frame = CGRectMake(0, 138.5-30, XYScreenW, 0.5);
//                self.pickupAddressView.hidden = NO;
//            }else{
            if (self.warnLab.text.length<=1) {
                 self.warnLab.frame = CGRectZero;
                self.deliverBgView.frame = CGRectMake(0, 65, XYScreenW, 44);
                self.deliveryBottomLineView.frame = CGRectMake(0, 138.5-30, XYScreenW, 0.5);
//                self.deliverBgView.backgroundColor=[UIColor greenColor];
            }else{
               self.warnLab.frame = CGRectMake(0, 0, XYScreenW, 30);
                self.deliverBgView.frame = CGRectMake(0, 95, XYScreenW, 44);
                self.deliveryBottomLineView.frame = CGRectMake(0, 138.5, XYScreenW, 0.5); 
            }
            
//            self.deliverBgView.frame = CGRectMake(0, 95, XYScreenW, 44);
           
            self.pickupAddressView.hidden = NO;
//        }
            
        }else
        {
           
            if (self.warnLab.text.length>1) {
//                self.warnLab.text=_addressModel;
                self.warnLab.frame = CGRectMake(0, 0, XYScreenW, 30);
                self.deliverBgView.frame = CGRectMake(0, 95, XYScreenW, 44);
                self.deliveryBottomLineView.frame = CGRectMake(0, 138.5, XYScreenW, 0.5);
            }else{
                self.warnLab.frame = CGRectZero;
                self.deliverBgView.frame = CGRectMake(0, 65, XYScreenW, 44);//配送方式背景图
                self.deliveryBottomLineView.frame = CGRectMake(0, 138.5-30, XYScreenW, 0.5);
            }
//            
        }
        
    }else
    {
        self.addressImgV.frame = CGRectMake(10, 25, 14, 15);
        self.addressLab.frame = CGRectMake(35, 25, screenWidth-25-31, 13);
        self.addressNextImgV.frame = CGRectMake(screenWidth-20, 27, 13, 13);
        self.addressLab.text = @"请先设置收货地址";
        self.phoneNumLab.text = @"";
        self.receiverLab.text = @"";
        self.receiverNameLab.text = @"";
        self.deliverBgView.hidden = YES;
        self.pickupAddressView.hidden = YES;
        self.warnLab.frame = CGRectZero;
//        self.deliveryBottomLineView.backgroundColor=[UIColor redColor];
        self.deliverBgView.frame = CGRectMake(0, 65, XYScreenW, 44);//配送方式背景图
        self.deliveryBottomLineView.frame = CGRectMake(0, 138.5-30, XYScreenW, 0);
    }
    self.addressBackgroundImgV.frame = CGRectMake(0, _warnLab.frame.origin.y+_warnLab.frame.size.height, screenWidth, 65);
    self.addressCoverBtn.frame = CGRectMake(0, 0, screenWidth, 65);
    
    
    
    
    
    self.deliverStyleLab.frame = CGRectMake(10, 16, 80, 13);
    self.deliverLab.frame = CGRectMake(90, 16, screenWidth -120, 13);
    self.deliverNextImgV.frame = CGRectMake(screenWidth-20, 16, 13, 13);
    self.deliverCoverBtn.frame = CGRectMake(0, 0, XYScreenW, 44);
    //    self.deliverCoverBtn.backgroundColor = [UIColor redColor];
    
    
//    self.pickupAddressView.backgroundColor=[UIColor redColor];
    self.pickupAddressView.frame = CGRectMake(0, self.deliverBgView.frame.origin.y+self.deliverBgView.frame.size.height, XYScreenW, 61);
    self.pickupAddressLab.frame = CGRectMake(10, 4, XYScreenW-20, 26);
    self.pickupContractMobileLab.frame = CGRectMake(10, 30, XYScreenW-20, 26);
    self.bottomLineView.frame = CGRectMake(0, 0, XYScreenW, 0.5);

}



-(void)updateGui{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.receiverLab.text = @"收货人：";
    self.receiverLab.frame = CGRectMake(10, 14, 60, 14);
    self.receiverNameLab.frame = CGRectMake(70, 14, 100, 14);
    CGFloat phoneWidth = screenWidth - 155- 28;
    self.phoneNumLab.frame = CGRectMake(155, 14, phoneWidth, 13);
    self.addressImgV.frame = CGRectMake(10, 33, 14, 15);
    CGFloat addressWidth = screenWidth - 25 - 31;
    self.addressLab.frame = CGRectMake(35, 37, addressWidth, 13);
    self.addressNextImgV.frame = CGRectMake(screenWidth-20, 27, 13, 13);
    
}
#pragma mark - lazy


-(UILabel *)warnLab
{
    if (!_warnLab) {
        _warnLab = [UILabel new];
        [self.view addSubview:_warnLab];
        _warnLab.backgroundColor = [UIColor colorWithRed:255/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
        _warnLab.textColor = XYGrayColor;
//        _warnLab.text = @"  提示：到店自提订单，需订单状态为“待收货”才能到店取货!   ";
        _warnLab.font = XYFont_12;
        _warnLab.adjustsFontSizeToFitWidth = YES;
    }
    return _warnLab;
}

-(UILabel *)deliverStyleLab
{
    if (!_deliverStyleLab ) {
        _deliverStyleLab = [UILabel new];
        _deliverStyleLab.font = XYFont_12;
        _deliverStyleLab.text = @"配送方式";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickToSelectDeliverStyle:)];
        tap.numberOfTapsRequired = 1;
        [_deliverStyleLab addGestureRecognizer:tap];
        _deliverStyleLab.userInteractionEnabled = YES;
        _deliverStyleLab.textColor = self.KAddressColor;
        [self.deliverBgView addSubview:_deliverStyleLab];
    }
    return _deliverStyleLab;
}

-(UILabel *)deliverLab
{
    if (!_deliverLab) {
        _deliverLab = [UILabel new];
        _deliverLab.font = XYFont_12;
        _deliverLab.textColor = self.KAddressColor;
//        _deliverLab.text = @"到店自提";
        _deliverLab.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickToSelectDeliverStyle:)];
        tap.numberOfTapsRequired = 1;
        [_deliverLab addGestureRecognizer:tap];
        _deliverLab.textAlignment = NSTextAlignmentRight;
        [self.deliverBgView addSubview:_deliverLab];

    }
    return _deliverLab;
}

-(UIImageView *)deliverNextImgV
{
    if (!_deliverNextImgV) {
        _deliverNextImgV = [[UIImageView alloc] init];
        _deliverNextImgV.contentMode = UIViewContentModeCenter;
        _deliverNextImgV.image = [UIImage imageNamed:@"order_icon_more"];
        [self.deliverBgView addSubview:_deliverNextImgV];
    }
    return _deliverNextImgV;
}


-(UIView *)deliverBgView
{
    if (!_deliverBgView) {
        _deliverBgView = [[UIView alloc] init];
        [self.view addSubview:_deliverBgView];
    }
    return _deliverBgView;
}

-(UIButton *)deliverCoverBtn
{
    if (!_deliverCoverBtn) {
        _deliverCoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deliverCoverBtn setBackgroundColor:[UIColor clearColor]];
        [_deliverCoverBtn addTarget:self action:@selector(clickToSelectDeliverStyle:) forControlEvents:UIControlEventTouchUpInside];
        [self.deliverBgView addSubview:_deliverCoverBtn];
    }
    return _deliverCoverBtn;
}

/******************分割线********************/
-(UIImageView *)addressBackgroundImgV
{
    if (!_addressBackgroundImgV) {
        _addressBackgroundImgV = [[UIImageView alloc] init];
        _addressBackgroundImgV.contentMode = UIViewContentModeScaleToFill;
        _addressBackgroundImgV.userInteractionEnabled = YES;
        _addressBackgroundImgV.backgroundColor = XYWhiteColor;
        _addressBackgroundImgV.image = [UIImage imageNamed:@"order_bg_add"];
        [self.view addSubview:_addressBackgroundImgV];
    }
    return _addressBackgroundImgV;

}
-(UILabel *)receiverLab
{

    if (!_receiverLab) {
        _receiverLab = [UILabel new];
        _receiverLab.text = @"收货人：";
        _receiverLab.font = XYFont_12;
        [_receiverLab sizeToFit];
        _receiverLab.textColor = self.KAddressColor;
        [self.addressBackgroundImgV addSubview:_receiverLab];
    }
    return _receiverLab;
}
-(UILabel *)receiverNameLab
{
    if (!_receiverNameLab) {
        _receiverNameLab = [UILabel new];
//        _receiverNameLab.text = @"隔壁老王";
        _receiverNameLab.font = XYFont_12;
        _receiverNameLab.textColor = self.KAddressColor;
        [self.addressBackgroundImgV addSubview:_receiverNameLab];
    }
    return _receiverNameLab;

}
-(UILabel *)phoneNumLab
{
    if (!_phoneNumLab) {
        _phoneNumLab = [UILabel new];
//        _phoneNumLab.text = @"15889771550";
        _phoneNumLab.textColor = self.KAddressColor;
        _phoneNumLab.font = XYFont_12;
        _phoneNumLab.textAlignment = NSTextAlignmentRight;
        [self.addressBackgroundImgV addSubview:_phoneNumLab];
    }
    return _phoneNumLab;
}

-(UIImageView *)addressNextImgV
{

    if (!_addressNextImgV) {
        _addressNextImgV = [[UIImageView alloc] init];
        _addressNextImgV.contentMode = UIViewContentModeCenter;
        _addressNextImgV.image = [UIImage imageNamed:@"order_icon_more"];
        [self.addressBackgroundImgV addSubview:_addressNextImgV];
    }
    return _addressNextImgV;
}

-(UIImageView *)addressImgV
{
    if (!_addressImgV) {
        _addressImgV = [[UIImageView alloc] init];
        _addressImgV.contentMode = UIViewContentModeCenter;
        [self.addressBackgroundImgV addSubview:_addressImgV];
        _addressImgV.image = [UIImage imageNamed:@"order_add_icon"];
    }
    return _addressImgV;

}

-(UILabel *)addressLab
{
    if (!_addressLab) {
        _addressLab = [UILabel new];
        _addressLab.font = XYFont_12;
//        _addressLab.text = @"深圳市南山区桃源街道办世纪春城2栋208";
        _addressLab.textColor = XYBlackColor;
        [self.addressBackgroundImgV addSubview:_addressLab];
    }
    return _addressLab;

}

-(UIButton *)addressCoverBtn
{
    if (!_addressCoverBtn) {
        _addressCoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addressCoverBtn addTarget:self action:@selector(selectReceiver:) forControlEvents:UIControlEventTouchUpInside];
        [self.addressBackgroundImgV addSubview:_addressCoverBtn];
    }
    return _addressCoverBtn;

}

//-(UIColor *)KAddressColor
//{
//    if (!_KAddressColor) {
//        _KAddressColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
//    }
//    return _KAddressColor;
//}



-(UIView *)deliveryBottomLineView
{
    if (!_deliveryBottomLineView) {
        _deliveryBottomLineView = [[UIView alloc] init];
        [self.view addSubview:_deliveryBottomLineView];
        _deliveryBottomLineView.backgroundColor = XYLineColor;
    }
    return _deliveryBottomLineView;

}


-(UIView *)pickupAddressView
{
    if (!_pickupAddressView) {
        _pickupAddressView = [[UIView alloc] init];
        [self.view addSubview:_pickupAddressView];
        _pickupAddressView.backgroundColor = XYWhiteColor;
    }
    return _pickupAddressView;

}

-(UILabel *)pickupAddressLab
{
    if (!_pickupAddressLab) {
        _pickupAddressLab = [[UILabel alloc] init];
        [self.pickupAddressView addSubview:_pickupAddressLab];
        _pickupAddressLab.font = XYFont_12;
        _pickupAddressLab.textColor = XYBlackColor;
    }
    return _pickupAddressLab;

}

-(UILabel *)pickupContractMobileLab
{
    
        if (!_pickupContractMobileLab) {
            _pickupContractMobileLab = [[UILabel alloc] init];
            [self.pickupAddressView addSubview:_pickupContractMobileLab];
            _pickupContractMobileLab.font = XYFont_12;
            _pickupContractMobileLab.textColor = XYBlackColor;
        }
        return _pickupContractMobileLab;
}


-(UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = XYLineColor;
        [self.pickupAddressView addSubview:_bottomLineView];
    }
    return _bottomLineView;

}


#pragma mark - 点击事件处理
//点选配送方式
-(void)clickToSelectDeliverStyle:(id )sender{
    
    if (self.deliveryWayArr.count<2) {

        return;
    }

//    XYDeliveryWayPopView *popView = [[XYDeliveryWayPopView alloc] init];
//    [popView showWithStr:self.deliveryWay];
//    popView.dataArr = self.deliveryWayArr;
//    popView.delegate = self;
    
    JXDeliverWayVC *deliverWayVC = [[JXDeliverWayVC alloc]init];
    deliverWayVC.delegate = self;
    deliverWayVC.selectWayText = self.deliveryWay;
//    deliverWayVC.AdressName = self.AdressName;
    
    deliverWayVC.model.name = self.ponitInfoModel.name;
    deliverWayVC.model.address = self.ponitInfoModel.address;
    deliverWayVC.model.phone = self.ponitInfoModel.mobile;
    deliverWayVC.model.shopId = self.ponitInfoModel.delivery_id;
    [self.navigationController pushViewController:deliverWayVC animated:YES];

}
-(void)selectReceiver:(UIButton *)sender
{

    XYDelieveryAddressVC *addressVC = [[XYDelieveryAddressVC alloc] init];
    addressVC.delegate = self;
    addressVC.type = @"1";
    [self.navigationController pushViewController:addressVC animated:YES];

}

#pragma mark - 代理

-(void)selectAddressWith:(XYAddressListModel *)model
{


    if (self.delegate && [self.delegate respondsToSelector:@selector(needReloadData)]) {
        [self.delegate needReloadData];
    }
//    [self updateInfoWithModel:model];
    
}

-(void)updateInfoWithModel:(XYAddressListModel*)model
{
    self.receiverNameLab.text = model.userName;
    self.addressLab.text = model.address;
    self.phoneNumLab.text = model.mobile;
    if (model != self.addressModel) {
        self.addressModel = model;
    }
    
    [self updateGui];
}



#pragma mark- 选择送货地址回调

-(void)selectWay:(NSString *)way adressID:(NSString*)adressID
{
    NSString *wayId = @"";
    
    for (XYOrderFromDetailAvailableDeliveryRuleResultsModel *model in self.deliveryWayArr) {
        
        
        if ([[model.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:[way stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]]) {
//            NSString *strUrl = [NSString stringWithFormat:@"  %@",[model.DEScription stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
//            NSLog(@"%@",strUrl);
//            self.warnLab.text=strUrl;
            wayId = model.deliveryRule_id;
            break;
        }
        
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (_addressModel.addressId == nil) {
         param[@"addressId"] = _addressModel.id;
    }else
    {
        param[@"addressId"] = _addressModel.addressId;
    }
    param[@"selectShopId"] = adressID;
    param[@"cartId"] = self.cartId;
    param[@"ruleId"] = wayId;
    WeakSelf;
    [XYShoppingCartNet netCartChangeDeliveryWayWithDic:param block:^(NSDictionary *blockDictionary, NSError *error) {
        
        if (error == nil) {
            weakSelf.deliverLab.text = way;
            weakSelf.deliveryWay = way;
            
        
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(needFatherViewChangeHeaderFrame)]) {
                [weakSelf.delegate needReloadData];
            }
        }
    }];
    

}



@end
