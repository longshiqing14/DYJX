//
//  JXShoppingCartViewController.m
//  user
//
//  Created by liu_yakai on 2018/1/5.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXShoppingCartViewController.h"
#import "JXSettlementView.h"
#import "BaseTableView.h"

@interface JXShoppingCartViewController (){

}
//结算
@property(nonatomic,strong)JXSettlementView *settlementView;
@property(nonatomic,strong)BaseTableView *shoppingCartTableView;
@property(nonatomic,strong)UIButton *editButton;
@end

@implementation JXShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self shoppingCartUI];
    [self automaticLayout];
}

-(void)shoppingCartUI{
     self.title=@"购物车";

    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.editButton];
}

-(UIButton *)editButton{
    if (!_editButton) {
        _editButton =[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_editButton setTitle:@"编辑" forState:(UIControlStateNormal)];
         [_editButton setTitle:@"完成" forState:(UIControlStateSelected)];
        _editButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [_editButton setTitleColor:XYRGBAColor(0, 0, 0, 1) forState:(UIControlStateNormal)];
        [_editButton setTitleColor:XYRGBAColor(0, 0, 0, 1) forState:(UIControlStateSelected)];
        [_editButton addTarget:self action:@selector(editClock:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _editButton;
}


-(void)automaticLayout{
    WeakSelf;
    [self.view addSubview:self.settlementView];
    [self.settlementView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(46); make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
    }];
    [self.view addSubview:self.shoppingCartTableView];
    [self.shoppingCartTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
     make.bottom.mas_equalTo(weakSelf.settlementView.mas_bottom);
    }];
}


-(JXSettlementView *)settlementView{
    if (!_settlementView) {
        _settlementView=[[[NSBundle mainBundle]loadNibNamed:@"JXSettlementView" owner:self options:nil]lastObject];
        
    }
    return _settlementView;
}

-(BaseTableView *)shoppingCartTableView{
    if (!_shoppingCartTableView) {
        _shoppingCartTableView=[[BaseTableView alloc]init];
    }
    return _shoppingCartTableView;
}

-(void)editClock:(UIButton *)sender{
    sender.selected=!sender.isSelected;
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
