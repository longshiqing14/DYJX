//
//  JXDeliverWayVC.m
//  user
//
//  Created by 岩  熊 on 2018/3/14.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXDeliverWayVC.h"
#import "GJOrderingForClientsMoreListCell.h"
#import "JXSelectDeliverToShopPage.h"

#import "JXDeliverWayViewModel.h"
#import "JXDeliverWayCell.h"

@interface JXDeliverWayVC ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger selectIndex;
}
@property (nonatomic, strong)UIView *topGrayView;
@property (nonatomic, strong)UIButton *deliverKnockDoorBtn;
@property (nonatomic, strong)UIButton *deliverToShopBtn;
@property (nonatomic, strong)UIButton *makeSureBtn;
@property (nonatomic, strong)UIColor *selectColor;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)JXDeliverWayViewModel *viewModel;
@end

@implementation JXDeliverWayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"FFFFFF"];
    self.title = @"选择配送方式";
    self.tableView.tableFooterView = [UIView new];
//    self.tableView.estimatedRowHeight = 666;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self initSubViews];
}

- (void)initSubViews{
    [self.view addSubview:self.topGrayView];
    [self.view addSubview:self.deliverToShopBtn];
    [self.view addSubview:self.deliverKnockDoorBtn];
    
    [self.topGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.mas_equalTo(0);
        make.height.mas_equalTo(14);
    }];
    
    [self.view addSubview:self.makeSureBtn];
    
    if ([[self.selectWayText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"到店自提"]) {
        self.deliverToShopBtn.selected =YES;
        self.deliverKnockDoorBtn.selected = NO;
        [self performSelector:@selector(handlerSelectBtn:) withObject:self.deliverToShopBtn];
    }
    
    if ([self.selectWayText isEqualToString:@"送货上门"]) {
        self.deliverToShopBtn.selected =NO;
        self.deliverKnockDoorBtn.selected = YES;
        
    }
    
    [self updateSelectColor];
    
    [self.deliverKnockDoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topGrayView.mas_bottom).mas_equalTo(16);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(110);
        make.centerX.mas_equalTo(-75 - (kScreenWidth - 300)/4.0);
    }];
    
    [self.deliverToShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.topGrayView.mas_bottom).mas_equalTo(16);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(110);
        make.centerX.mas_equalTo(75 + (kScreenWidth - 300)/4.0);
    }];
    
    
    [self.makeSureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
                }
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if ([YWDTools isNil:self.model.shopId]) {
            return 1;
        }else{
            return 2;
        }
        
    }else{
        return 1;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.item == 0) {
        GJOrderingForClientsMoreListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreListCell" forIndexPath:indexPath];
        
//        if (![YWDTools isNil:self.AdressName]) {
//            cell.subLB.text = self.AdressName;
//        }
        
        if (![YWDTools isNil:self.model.name]) {
            cell.subLB.text = @"";
        }
        
        cell.arrowImage.hidden = NO;
        cell.line.hidden = NO;
        return cell;
    }else{
        JXDeliverWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JXDeliverWayCell" forIndexPath:indexPath];
        cell.titleLB.text = [NSString stringWithFormat:@"%@",self.model.name];
        cell.addressLB.text = [NSString stringWithFormat:@"地址：%@",self.model.address];
        cell.phoneLB.text = [NSString stringWithFormat:@"电话：%@",self.model.phone];
           
        return cell;
    }
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        if (indexPath.item == 0) {
//            return 45;
//        }else{
//
//            return 84;
//        }
//    }else{
//        return 45;
//    }
//}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 666;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.section == 0) {
            if (indexPath.item == 0) {
                return 45;
            }else{
    
                return UITableViewAutomaticDimension;
            }
        }else{
            return 45;
        }
//    return UITableViewAutomaticDimension;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[GJOrderingForClientsMoreListCell class] forCellReuseIdentifier:@"MoreListCell"];
        [_tableView registerClass:[JXDeliverWayCell class] forCellReuseIdentifier:@"JXDeliverWayCell"];
    }
    return _tableView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (indexPath.section == 0 && indexPath.item == 0) {
        JXSelectDeliverToShopPage *page = [[JXSelectDeliverToShopPage alloc]init];
        page.shopID = self.model.shopId;
        page.name = self.model.name;
        page.block = ^(JXAdressModel *model) {
            weakSelf.model = model;
            [weakSelf.tableView reloadData];
        };
        [self.navigationController pushViewController:page animated:YES];
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor grayColor];
    }
    return [UIView new];
}

- (UIView *)topGrayView{
    if (!_topGrayView) {
        _topGrayView = [[UIView alloc]init];
        _topGrayView.backgroundColor = [UIColor colorWithHexString:@"F2F2F2"];
    }
    return _topGrayView;
}

-(UIButton *)deliverKnockDoorBtn
{
    if (!_deliverKnockDoorBtn) {
        _deliverKnockDoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deliverKnockDoorBtn setTitle:@"送货上门" forState:UIControlStateNormal];
        _deliverKnockDoorBtn.titleLabel.font = XYFont_15;
        _deliverKnockDoorBtn.tag=1000;
        [_deliverKnockDoorBtn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [_deliverKnockDoorBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_deliverKnockDoorBtn addTarget:self action:@selector(handlerSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _deliverKnockDoorBtn.layer.cornerRadius = 3;
        _deliverKnockDoorBtn.layer.borderColor = XYGrayColor.CGColor;
        _deliverKnockDoorBtn.layer.borderWidth = 0.5;
        _deliverKnockDoorBtn.layer.masksToBounds = YES;
        _deliverKnockDoorBtn.selected = YES;
        [_deliverKnockDoorBtn setImage:[UIImage imageNamed:@"icon_address_gray"] forState:UIControlStateNormal];
        [_deliverKnockDoorBtn setImage:[UIImage imageNamed:@"icon_address_red"] forState:UIControlStateSelected];
        
        _deliverKnockDoorBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 50, 0, 0);
        _deliverKnockDoorBtn.titleEdgeInsets = UIEdgeInsetsMake(40, -38, 0, 0);
    }
    return _deliverKnockDoorBtn;
    
}

-(UIButton *)deliverToShopBtn
{
    if (!_deliverToShopBtn) {
        _deliverToShopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deliverToShopBtn setTitle:@"到店自提" forState:UIControlStateNormal];
        _deliverToShopBtn.titleLabel.font = XYFont_15;
        _deliverToShopBtn.tag=1001;
        [_deliverToShopBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        [_deliverToShopBtn setTitleColor:self.selectColor forState:UIControlStateSelected];
        [_deliverToShopBtn addTarget:self action:@selector(handlerSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_deliverToShopBtn setImage:[UIImage imageNamed:@"icon_shop_gray"] forState:UIControlStateNormal];
        [_deliverToShopBtn setImage:[UIImage imageNamed:@"icon_shop_red"] forState:UIControlStateSelected];
        _deliverToShopBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 50, 0, 0);
        _deliverToShopBtn.titleEdgeInsets = UIEdgeInsetsMake(40, -31, 0, 0);
        _deliverToShopBtn.layer.cornerRadius = 3;
        _deliverToShopBtn.layer.borderColor = XYGrayColor.CGColor;
        _deliverToShopBtn.layer.borderWidth = 0.5;
        _deliverToShopBtn.layer.masksToBounds = YES;
        
    }
    return _deliverToShopBtn;
    
}

- (UIButton *)makeSureBtn{
    if (!_makeSureBtn) {
        _makeSureBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_makeSureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_makeSureBtn setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        _makeSureBtn.backgroundColor = [UIColor colorWithHexString:@"#EC3B2C"];
        _makeSureBtn.layer.cornerRadius = 2.0;
        _makeSureBtn.layer.masksToBounds = YES;
        [_makeSureBtn addTarget:self action:@selector(makeSureSelectBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _makeSureBtn;
}

- (void)sendMSGToClient:(UIButton*)sender
{

//[self sendInvoiceToE_mial:self.invoiceE_mail];
    
}

- (void)sendInvoiceToE_mial:(NSString *)email{
 
    NSDictionary *requstDic = [NSMutableDictionary dictionary];
    //    [requstDic setValue:merchantId forKey:@"merchantId"];
    [requstDic setValue:email forKey:@"invoiceMail"];
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

-(UIColor *)selectColor
{
    if (!_selectColor) {
        _selectColor = [UIColor colorWithRed:236/255.0 green:58/255.0 blue:45/255.0 alpha:1.0];
    }
    
    return _selectColor;
}
-(void)handlerSelectBtn:(UIButton *)sender
{
    selectIndex=sender.tag;
    if (sender == self.deliverToShopBtn) {
        self.selectWayText = self.deliverToShopBtn.titleLabel.text;
        self.deliverToShopBtn.selected = YES;
        self.deliverKnockDoorBtn.selected = NO;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(self.view);
            make.top.mas_equalTo(self.deliverKnockDoorBtn.mas_bottom).mas_equalTo(20);

            make.bottom.mas_equalTo(self.makeSureBtn.mas_top);
        }];
        
        
    }else
    {
        self.selectWayText = self.deliverKnockDoorBtn.titleLabel.text;
        self.deliverKnockDoorBtn.selected  = YES;
        self.deliverToShopBtn.selected = NO;
        [self.tableView removeFromSuperview];
    }
    [self updateSelectColor];
    
    
//    [self viewDiss];
    
}

- (void)makeSureSelectBtn:(UIButton *)sender{

        NSString *str = self.selectWayText;
    NSLog(@"%ld",(long)sender.tag);
    if (selectIndex==1001) {
        NSLog(@"%@",self.model.shopId);
        if ([YWDTools isNil:self.model.shopId]) {
            [YDBAlertView showToast:@"请选择自提地址！"];
            return;
        }
    }
    
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectWay:adressID:)]) {
            [self.delegate selectWay:str adressID:self.model.shopId];
        }
        [self.navigationController popViewControllerAnimated:YES];
        
}

//更新选中颜色
-(void)updateSelectColor{
    
    if (self.deliverToShopBtn.selected) {
        self.deliverToShopBtn.layer.borderColor = self.selectColor.CGColor;
        self.deliverKnockDoorBtn.layer.borderColor = XYGrayColor.CGColor;
    }else
    {
        self.deliverKnockDoorBtn.layer.borderColor = self.selectColor.CGColor;
        self.deliverToShopBtn.layer.borderColor = XYGrayColor.CGColor;
    }
}

- (JXAdressModel *)model{
    if (!_model) {
        _model = [[JXAdressModel alloc]init];
    }
    return _model;
}

- (JXDeliverWayViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JXDeliverWayViewModel alloc]init];
    }
    return _viewModel;
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
