//
//  XYOrderDetailPayPickView.m
//  user
//
//  Created by xingyun on 2017/10/25.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderDetailPayPickView.h"
#import "WXApi.h"
#import "XYPreDepositVCell.h"
#import "XYPaymentListModel.h"

@interface XYOrderDetailPayPickView () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, copy) NSMutableArray * dataSource;

@property (nonatomic,assign)NSInteger pickeviewHeight;


@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIView * headerView;
@property (nonatomic, strong) UIView * footerView;

/** 支付 金额 */
@property (nonatomic, strong) NSString * totalPayString;

/** 选择的 支付方式 */
@property (nonatomic, strong) NSString * selectPayType;

@property (nonatomic, strong) NSArray *payMentArray;

@end

@implementation XYOrderDetailPayPickView

- (instancetype)initWithPayTotal:(NSString*)totalPayString paymentTypes:(NSArray*)paymentTypes
{
    self = [super init];
    if (self) {
        self.payMentArray = paymentTypes;
        [self updateDataSource];
        
        self.totalPayString = totalPayString;
        
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.tableHeaderView = self.headerView;
    _tableView.tableFooterView = self.footerView;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    
    
    self.frame = [UIScreen mainScreen].bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
    
    [self addSubview:self.tableView];
    
    CGFloat tableH = 270;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(tableH);
    }];
    [self layoutIfNeeded];
    
    
}



#pragma mark - 懒加载

- (UIView*)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 45)];
        _headerView.backgroundColor = XYWhiteColor;
        
        UIButton * returnBT = [UIButton buttonWithType:UIButtonTypeCustom];
        returnBT.frame = CGRectZero;
        [returnBT setImage:[UIImage imageNamed:@"nav_btn_black_goback"] forState:UIControlStateNormal];
        [returnBT addTarget:self action:@selector(returnButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:returnBT];
        
        [returnBT mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(40);
        }];
        
        
        UILabel * titleLB = [[UILabel alloc]initWithFrame:CGRectZero];
        titleLB.text = @"选择支付方式";
        titleLB.textColor = XYFontTitleColor;
        titleLB.textAlignment = NSTextAlignmentCenter;
        titleLB.font = XYFont_15;
        [_headerView addSubview:titleLB];
        
        [titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_headerView.mas_centerX);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(200);
        }];
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectZero];
        lineview.backgroundColor = XYLineColor;
        [_headerView addSubview:lineview];
        
        [lineview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return _headerView;
}

- (NSArray *)payMentArray{
    if (_payMentArray == nil) {
        _payMentArray = [NSMutableArray array];
    }
    return _payMentArray;
}

- (UIView*)footerView
{
    if (_footerView == nil) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XYScreenW, 45 + 28)];
        _footerView.backgroundColor = XYWhiteColor;
        
        UIView * lineview = [[UIView alloc]initWithFrame:CGRectZero];
        lineview.backgroundColor = XYLineColor;
        [_footerView addSubview:lineview];
        
        [lineview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        UIButton * ensourceBT = [UIButton buttonWithType:UIButtonTypeCustom];
        ensourceBT.frame = CGRectMake(47, 27, XYScreenW-2*47, 45);
        ensourceBT.backgroundColor = XYMainColor;
        [ensourceBT setTitle:@"确定" forState:UIControlStateNormal];
        [ensourceBT.titleLabel setFont:XYFont_16];
        ensourceBT.layer.cornerRadius = 5;
        ensourceBT.layer.masksToBounds = YES;
        [ensourceBT addTarget:self action:@selector(ensourceButtonClick)  forControlEvents:UIControlEventTouchUpInside];
        
        [_footerView addSubview:ensourceBT];
        
        
    }
    return _footerView;
}


- (NSMutableArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)updateDataSource
{
    if (self.dataSource.count != 0) {
        [self.dataSource removeAllObjects];
    }
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (NSString* payment in self.payMentArray) {
        if ([payment isEqualToString:JX_PAYMENT_TYPE_WEIXIN]) {
            if ([WXApi isWXAppInstalled] ) {
                [array addObject:@{@"image":@"payment_icon_wx",@"title":@"微信支付",@"type":JX_PAYMENT_TYPE_WEIXIN}];
            }
        }else if ([payment isEqualToString:JX_PAYMENT_TYPE_ALI]){
            [array addObject:@{@"image":@"payment_icon_zfb",@"title":@"支付宝支付",@"type":JX_PAYMENT_TYPE_ALI}];
        }else if ([payment isEqualToString:JX_PAYMENT_TYPE_UNION]){
            [array addObject:@{@"image":@"ic_unionpay",@"title":@"银联支付",@"type":JX_PAYMENT_TYPE_UNION}];
        }
    }
    
    for (NSDictionary * dict in array) {
        XYPaymentListModel * model = [[XYPaymentListModel alloc]init];
        
        model.image = dict[@"image"];
        model.title = dict[@"title"];
        model.type = dict[@"type"];
        
        [self.dataSource addObject:model];
    }
//    订单详情页面默认选中第一个支付
    if (self.selectPayType == nil) {
        if (array.count>0) {
            self.selectPayType = [array[0] objectForKey:@"type"];
        }
        
    }
}

#pragma mark - button click
/** 返回 */
- (void)returnButtonClick
{
    [self hide];
}
/** 确定 */
- (void)ensourceButtonClick
{
    if ([self.selectPayType isEqualToString:@""]) {
        [YDBAlertView showToast:@"请选择支付方式" dismissDelay:1.0];
        return;
    }
    NSLog(@"%@    %@",self.selectPayType,self.totalPayString);
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(pickPayType:needTotal:)]) {
        [self.delegate pickPayType:self.selectPayType needTotal:self.totalPayString];
    }
    
    [self hide];
    
}


#pragma mark - animate

- (void)show {
    
    [self animateSelfView:_tableView show:YES completion:nil];
}

- (void)hide {
    
    [self animateSelfView:_tableView show:NO completion:nil];
}

- (void)animateSelfView:(UIView*)view show:(BOOL)show completion:(void(^)())completion {
    
    if (show) {
        
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
        basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, XYScreenH)];
        basic.toValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];;
        basic.duration = 0.2;
        [view.layer addAnimation:basic forKey:[NSString stringWithFormat:@"%@",view]];
        
    } else {
        
        CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
        basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)];
        basic.toValue = [NSValue valueWithCGPoint:CGPointMake(view.center.x,XYScreenH)];
        basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        basic.autoreverses = NO;
        basic.duration = 0.2;
        [view.layer addAnimation:basic forKey:[NSString stringWithFormat:@"hide%@",view]];
        
        [self removeFromSuperview];
        
    }
    
    !completion ? : completion();
}


#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    XYPreDepositVCell * cell = [XYPreDepositVCell cellWithTableView:tableView];
    
    XYPaymentListModel * model = self.dataSource[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:model.image];
    cell.titleLB.text = model.title;
    if ([self.selectPayType isEqualToString:@""]) {
        cell.selectImageView.hidden = YES;
    }else if ([self.selectPayType isEqualToString:model.type]){
        cell.selectImageView.hidden = NO;
    }else{
        cell.selectImageView.hidden = YES;
    }
    
    return cell;
  
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYPaymentListModel * model = self.dataSource[indexPath.row];
    self.selectPayType = model.type;
    [self.tableView reloadData];
    
}


@end
