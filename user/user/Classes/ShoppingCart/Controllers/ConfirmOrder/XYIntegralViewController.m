//
//  XYIntegralViewController.m
//  user
//
//  Created by liu_yakai on 2018/1/10.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "XYIntegralViewController.h"

@interface XYIntegralViewController ()
@property(nonatomic,strong)UISwitch *integralSwitch;
@property(nonatomic,strong)UIButton *integralButton;
@property(nonatomic,strong)UILabel *integralLabel;
@end

@implementation XYIntegralViewController

const CGFloat orderConfirm_Integral_height = 45.0;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self integralLayer];
}

-(void)setIntegralModel:(JXIntegralModel *)integralModel{
//
    
    if ([integralModel.integralDisplay isEqualToString:@"1"]) {
        self.integralSwitch.hidden=NO;
        if ([integralModel.integralShow isEqualToString:@"1"]) {
            self.integralSwitch.on=YES;
        }else{
            self.integralSwitch.on=NO;
        }
        
        self.integralLable.attributedText=[self attributedString:[NSString stringWithFormat:@"可用%@积分，抵扣",integralModel.integralBalance] Money:[NSString stringWithFormat:@"¥%@",[integralModel.integralPrice stringByReplacingOccurrencesOfString:@"-" withString:@""]]];
    }else{
        self.integralLable.attributedText=[self attributedString:[NSString stringWithFormat:@"共%@积分，当前不可用",integralModel.integralBalance] Money:@""];
        self.integralSwitch.hidden=YES;
    }
    
    
    
}

-(NSAttributedString *)attributedString:(NSString *)title Money:(NSString *)money{
    NSString *str=[NSString stringWithFormat:@"<html><body><font face=\"PingFang-SC-Regular\" size=\"4\" color=\"#333333\">%@ </font><font face=\"PingFang-SC-Regular\" size=\"4\" color=\"#EC3B2C\">%@</font> </body></html>",title,money];
    return [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];

}


-(void)integralLayer{
    [self.view addSubview: self.integralSwitch];
    [self.integralSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(XY_Right_Margin-5);
        //        make.width.mas_equalTo(8);
        //        make.height.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];

    [self.view addSubview: self.integralLabel];
    [self.integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XY_Left_Margin);
        
        make.centerY.mas_equalTo(0);
    }];
    [self.view addSubview: self.integralLable];
    [self.integralLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_integralLabel.mas_right).offset(10);
        
        make.centerY.mas_equalTo(0);
    }];
    
    [self.view addSubview: self.integralButton];
    [self.integralButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_integralLable.mas_right).offset(-10);
                make.width.height.mas_equalTo(45);
        //        make.height.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
}

-(UIButton *)integralButton{
    if (!_integralButton) {
        _integralButton=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_integralButton addTarget:self action:@selector(integralContentClock:) forControlEvents:(UIControlEventTouchUpInside)];
        [_integralButton setImage:SETIMAGENAME(@"ic_order_hint") forState:UIControlStateNormal];
//        _integralButton.backgroundColor=[UIColor redColor];
    }
    return _integralButton;
}

-(UISwitch *)integralSwitch{
    if (!_integralSwitch) {
        _integralSwitch=[[UISwitch alloc]init];
        [_integralSwitch addTarget:self action:@selector(clockOpenAndClose:) forControlEvents:(UIControlEventValueChanged)];
        _integralSwitch.on=NO;
    }
    return _integralSwitch;
}

-(UILabel *)integralLabel{
    if (!_integralLabel) {
        _integralLabel=[[UILabel alloc]init];
        _integralLabel.font=XYFont_14;
        _integralLabel.text=@"积分";
    }
    return _integralLabel;
}

-(UILabel *)integralLable{
    if (!_integralLable) {
        _integralLable=[[UILabel alloc]init];
        _integralLable.font=XYFont_14;
//        _integralLable.textColor=XYRGBAColor(53,53,53, 1);
        _integralLable.text=@"共100积分，当前不可用";
    }
    return _integralLable;
}

//是否关闭积分
-(void)clockOpenAndClose:(id)sender{
    UISwitch *swithSender=(UISwitch *)sender;
    if (self.OpenAndClose) {
        self.OpenAndClose(swithSender.isOn);
    }
    
    
}

-(void)integralContentClock:(id)sender{
    UIButton *button=(UIButton *)sender;
    button.selected=!button.selected;
    if (self.popIntegralContentClock) {
        self.popIntegralContentClock(button.selected);
    }
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
