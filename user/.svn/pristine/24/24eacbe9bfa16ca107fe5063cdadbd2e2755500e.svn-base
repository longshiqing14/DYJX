//
//  XYGoodsSearchVC.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYGoodsSearchVC.h"

#import "XYGoodsSearchResultVC.h"

@interface XYGoodsSearchVC ()<UITextFieldDelegate>


/** 输入框  底色 */
@property (nonatomic, strong) UIView * barCodeView;
/** 条形码 输入框 */
@property (nonatomic, strong) UITextField * barCodeTF;

/** 搜索 按钮 */
@property (nonatomic, strong) UIButton * searchBT;


@end

@implementation XYGoodsSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYGlobalBg;
    
    self.navigationItem.title = @"手动输入";
    
    [self addViewAndLayout];
}




- (void)addViewAndLayout
{
    [self.view addSubview:self.barCodeView];
    [self.barCodeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    [self.barCodeView addSubview:self.barCodeTF];
    [self.barCodeTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [self.view addSubview:self.searchBT];
    [self.searchBT mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_barCodeView.mas_bottom).offset(25);
        make.left.mas_equalTo(48);
        make.right.mas_equalTo(-48);
        make.height.mas_equalTo(44);
    }];
    
    
}




#pragma mark - button click

- (void)searchButtonClick:(UIButton*)sender
{
    if ([self.barCodeTF.text isEqualToString:@""]) {
        
        return;
    }
    
    
    XYGoodsSearchResultVC * searchResultVC = [[XYGoodsSearchResultVC alloc]init];
    searchResultVC.barcode = self.barCodeTF.text;
    [self.navigationController pushViewController:searchResultVC animated:YES];
}



#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSUInteger newLength = textField.text.length - range.length + string.length;
    if (newLength != 0) {
        
        _searchBT.backgroundColor = XYMainColor;
        _searchBT.enabled = YES;
        
        
    }else{
        _searchBT.backgroundColor = XYLineColor;
        _searchBT.enabled = NO;
    }
    
    
    
    
    return YES;
}



#pragma mark - 懒加载

- (UIView*)barCodeView
{
    if (_barCodeView == nil) {
        _barCodeView = [[UIView alloc]initWithFrame:CGRectZero];
        _barCodeView.backgroundColor = XYWhiteColor;
    }
    return _barCodeView;
}


- (UITextField*)barCodeTF
{
    if (_barCodeTF == nil) {
        _barCodeTF = [[UITextField alloc]initWithFrame:CGRectZero];
        
        
        _barCodeTF.delegate = self;
        _barCodeTF.font = XYFont_16;
        _barCodeTF.textColor = XYBlackColor;
        
        _barCodeTF.keyboardType = UIKeyboardTypeNumberPad;
        _barCodeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        _barCodeTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"请输入您要查询的商品条码"
                                                                       attributes:@{NSFontAttributeName:XYFont_16,
                                                                                    NSForegroundColorAttributeName:XYGrayColor}];
    }
    
    return _barCodeTF;
}


- (UIButton*)searchBT
{
    if (_searchBT == nil) {
        _searchBT = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _searchBT.backgroundColor = XYLineColor;
        _searchBT.layer.cornerRadius = 5.f;
        _searchBT.layer.masksToBounds = YES;
        [_searchBT setTitle:@"查询" forState:UIControlStateNormal];
        [_searchBT setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        
        
        [_searchBT addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _searchBT;
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
