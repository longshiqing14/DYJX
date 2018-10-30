//
//  XYBindingBoardBandVC.m
//  user
//
//  Created by xingyun on 2017/11/1.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYBindingBoardBandVC.h"
#import "XYBoardBandNet.h"
#import "XYMyBoardBandVC.h"
#import "JXMyOderDetailsViewController.h"
@interface XYBindingBoardBandVC ()<UITextFieldDelegate>

@property(nonatomic,strong) UILabel *headLab;
/** 账户 */
@property(strong,nonatomic) UITextField *accountTF ;
/**身份证*/
@property(strong,nonatomic) UITextField *cardTF ;
/**绑定按钮*/
@property(strong,nonatomic) UIButton *bindingBtn ;
/** 账户背景图*/
@property(strong,nonatomic) UIView *accountBgView ;
/** 身份证背景图 */
@property(strong,nonatomic) UIView *cardBgView ;
@end

@implementation XYBindingBoardBandVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"绑定已有宽带账号";
    self.view.backgroundColor = XYGlobalBg;
//    WeakSelf;
    [self.headLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(XY_Left_Margin);
        make.right.mas_offset(XY_Right_Margin);
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.height.mas_offset(47);
    }];
    [self.accountBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(_headLab.mas_bottom);
        make.height.mas_offset(46);
    }];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    [self.cardBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_equalTo(_accountBgView.mas_bottom).offset(0.5);
        make.height.mas_equalTo(46);
    }];
    [self.cardTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        make.right.mas_equalTo(XY_Right_Margin);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [self.bindingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.left.mas_equalTo(47);
        make.right.mas_equalTo(-47);
        make.height.mas_equalTo(46);
        make.top.mas_equalTo(_cardBgView.mas_bottom).offset(28);
    }];
    
}
-(UILabel *)headLab
{
    if (!_headLab) {
        _headLab = [UILabel new];
        _headLab.font = XYFont_14;
        _headLab.text = @"绑定后可查看您的宽带信息";
        [self.view addSubview:_headLab];
    }
    return _headLab;
}
-(UITextField *)accountTF
{
    if (!_accountTF) {
        _accountTF = [[UITextField alloc] init];
        _accountTF.placeholder = @"请输入宽带账号";
        _accountTF.keyboardType = UIKeyboardTypeNumberPad;
        _accountTF.backgroundColor = XYWhiteColor;
        _accountTF.font = XYFont_14;
        _accountTF.delegate = self;
        
        [self.accountBgView addSubview:_accountTF];
    }
    return _accountTF;
}
-(UIView *)cardBgView
{
    if (!_cardBgView) {
        _cardBgView = [[UIView alloc] init];
        _cardBgView.backgroundColor = XYWhiteColor;
        [self.view addSubview:_cardBgView];
    }
    return _cardBgView;
}
-(UIView *)accountBgView
{
    if (!_accountBgView) {
        _accountBgView = [UIView new];
        _accountBgView.backgroundColor = XYWhiteColor;
        [self.view addSubview:_accountBgView];
    }
    return _accountBgView;
}

-(UITextField *)cardTF
{
    if (!_cardTF) {
        _cardTF = [[UITextField alloc] init];
        _cardTF.placeholder = @"请输入身份证号";
        _cardTF.backgroundColor = XYWhiteColor;
        _cardTF.font = XYFont_14;
        _cardTF.delegate = self;
        [self.cardBgView addSubview:_cardTF];
    }
    return _cardTF;
}

-(UIButton *)bindingBtn
{
    if (!_bindingBtn) {
        _bindingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bindingBtn setTitle:@"绑定" forState:UIControlStateNormal];
        _bindingBtn.titleLabel.font = XYFont_14;
        [_bindingBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_bindingBtn setBackgroundColor:XYMainColor];
        _bindingBtn.layer.cornerRadius =5;
        _bindingBtn.layer.masksToBounds = YES;
        [_bindingBtn addTarget:self action:@selector(bindingBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bindingBtn];
    }
    return _bindingBtn;
}
-(void)bindingBtnHandler:(id)sender{
    
    if (self.accountTF.text.length == 0 ) {
        [YDBAlertView showToast:@"绑定账户不能为空" dismissDelay:1.0];
        return;
    }
    if ([self judgeIdentityStringValid:self.cardTF.text] == false) {
        [YDBAlertView showToast:@"身份证格式错误" dismissDelay:1.0];
        return;
    }
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"serviceNumber"] = self.accountTF.text;
    param[@"idNum"] = self.cardTF.text;
    WeakSelf;
    [XYBoardBandNet netBindingBoardbandParam:param block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
                //这个字符串是你要跳转面板的名字
                JXMyOderDetailsViewController *myOderDetailsViewController =[board instantiateViewControllerWithIdentifier:@"MyOderDetailsID"];
                myOderDetailsViewController.serviceNum=self.accountTF.text;
                    [weakSelf.navigationController pushViewController:myOderDetailsViewController animated:YES];
            });

        }
    }];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    return YES;
}
- (BOOL)judgeIdentityStringValid:(NSString *)identityString {
    
    if (identityString.length != 18) return NO;
    // 正则表达式判断基本 身份证号是否满足格式
    NSString *regex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    //  NSString *regex = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityStringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(![identityStringPredicate evaluateWithObject:identityString]) return NO;
    
    //** 开始进行校验 *//
    
    //将前17位加权因子保存在数组里
    NSArray *idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
    
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    NSArray *idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    
    //用来保存前17位各自乖以加权因子后的总和
    NSInteger idCardWiSum = 0;
    for(int i = 0;i < 17;i++) {
        NSInteger subStrIndex = [[identityString substringWithRange:NSMakeRange(i, 1)] integerValue];
        NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
        idCardWiSum+= subStrIndex * idCardWiIndex;
    }
    
    //计算出校验码所在数组的位置
    NSInteger idCardMod=idCardWiSum%11;
    //得到最后一位身份证号码
    NSString *idCardLast= [identityString substringWithRange:NSMakeRange(17, 1)];
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if(idCardMod==2) {
        if(![idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"]) {
            return NO;
        }
    }
    else{
        //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
        if(![idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]]) {
            return NO;
        }
    }
    return YES;
}



@end
