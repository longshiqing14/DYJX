//
//  XYDelieveryAddressVC.m
//  user
//
//  Created by xingyun on 2017/9/21.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYDelieveryAddressVC.h"
#import "XYDeliveryAddressListTVCell.h"

#import "XYAddAddressVC.h"
#import "XYAddressNet.h"
#import "XYAddressListModel.h"

@interface XYDelieveryAddressVC ()<UITableViewDelegate,UITableViewDataSource,XYDeliveryAddressListTVCellDelegate>
/** 背景图 */
@property(nonatomic,strong) UIView *bgView;
/** 背景图片 */
@property(nonatomic,strong) UIImageView *bgImgView;
/** 背景提示语 */
@property(strong,nonatomic) UILabel *bgLab ;
/** 增加地址 */
@property(strong,nonatomic) UIButton *addAddressBtn ;

/************************** 底层*************************/
/** 导航条右侧按钮 */
@property(strong,nonatomic) UIButton *navRightBtn ;
/** 正常状态下的底图 新增地址*/
@property(strong,nonatomic) UIButton *bottomBtn ;
/**************************************************/
/** 底部视图 */
@property(strong,nonatomic) UIView *bottomView ;
/** 全选按钮 */
@property(strong,nonatomic) UIButton *selectBtn ;
/** 删除按钮 */
@property(strong,nonatomic) UIButton *removeBtn ;

/*********************** 表************************/
/** 表 */
@property(strong,nonatomic) UITableView *tableView ;

/** 编辑模式 */
@property(assign,nonatomic) BOOL editMode ;

/********************* 数据层 **************************/
/** 数据表 */
@property(strong,nonatomic) NSMutableArray *dataSourceArr ;

@end

static NSString *const XYDeliveryAddressListTVCellID = @"XYDeliveryAddressListTVCell";
@implementation XYDelieveryAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"收货地址";
    self.view.backgroundColor = XYGlobalBg;
    [self timeToShowbgView];
    [self.tableView.mj_header beginRefreshing];
    
    if ([self.type isEqualToString:@"1"]) {
        self.navigationItem.rightBarButtonItem.customView = [UIView new];
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self netDataFromSever];
   
}


#pragma Mark - 视图位置层
-(void)timeToShowbgView{
    
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
    }];
    
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_bgView.mas_centerX);
        make.top.mas_equalTo(136);
        make.width.mas_equalTo(215);
        make.height.mas_equalTo(165);
        
    }];
    
    [self.bgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(_bgImgView.mas_bottom).offset(35);
        make.height.mas_equalTo(14);
        
    }];
    
    [self.addAddressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_bgLab.mas_bottom).offset(18);
        make.left.mas_equalTo(47.5);
        make.right.mas_equalTo(-47.5);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(_bgLab.mas_bottom).offset(18);
        
    }];
    
    [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
        make.height.mas_offset(44);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
        make.height.mas_offset(44);
    }];
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(75);
    }];
    [self.removeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    

    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide).offset(-44);
    }];

    [self addNavRight];
    
    [self updateViewVisualization];
}


//更新视图显示效果
-(void)updateViewVisualization{

   
    
    [UIView animateWithDuration:0.5 animations:^{
        if (self.dataSourceArr.count == 0 && !self.editMode) {
            self.tableView.hidden = YES;
            self.bottomBtn.hidden = YES;
            self.bottomView.hidden = YES;
            self.navRightBtn.hidden = YES;
        }else if(self.dataSourceArr.count!= 0 && !self.editMode)
        {
            self.tableView.hidden = NO;
            self.bottomView.hidden = YES;
            self.bottomBtn.hidden = NO;
            self.navRightBtn.hidden = NO;
        }else if(self.dataSourceArr.count== 0 && self.editMode)
        {
            self.tableView.hidden = YES;
            self.bottomBtn.hidden = YES;
            self.bottomView.hidden = YES;
            self.navRightBtn.hidden = YES;
        }else
        {
            self.tableView.hidden = NO;
            self.bottomBtn.hidden = YES;
            self.bottomView.hidden = NO;
            self.navRightBtn.hidden = NO;
        }
        [self.tableView reloadData];
    }];
    
  

}

//添加导航栏
-(void)addNavRight{

    self.navRightBtn.frame = CGRectMake(0, 0, 30, 30);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.navRightBtn];

    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark - 懒加载层
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = XYGlobalBg;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(netDataFromSever)];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;

}


- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = XYWhiteColor;
        
    }
    return _bgView;
}
-(UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = [[UIImageView alloc] init];
        _bgImgView.image = [UIImage imageNamed:@"no-address"];
        _bgImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self.bgView addSubview:_bgImgView];
    }
    return _bgImgView;
}


-(UILabel *)bgLab
{
    if (!_bgLab) {
        _bgLab = [UILabel new];
        _bgLab.font = XYFont_14;
        _bgLab.text = @"您还没有收货地址哦~";
        _bgLab.textAlignment = NSTextAlignmentCenter;
        [self.bgView addSubview:_bgLab];
    }
    return _bgLab;
}

-(UIButton *)addAddressBtn
{
    if (!_addAddressBtn) {
        _addAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addAddressBtn setTitle:@"新增收货地址" forState:UIControlStateNormal];
        _addAddressBtn.backgroundColor = BALANCEColor;
        [_addAddressBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_addAddressBtn addTarget:self action:@selector(addAddressBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        _addAddressBtn.titleLabel.font = XYFont_14;
        _addAddressBtn.layer.cornerRadius = 5;
        _addAddressBtn.layer.masksToBounds = YES;
        
        [self.bgView addSubview:_addAddressBtn];
    }
    return _addAddressBtn;
}


-(UIButton *)navRightBtn
{
    if (!_navRightBtn) {
        _navRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_navRightBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_navRightBtn setTitle:@"完成" forState:UIControlStateSelected];
        [_navRightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_navRightBtn addTarget:self action:@selector(navRightBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        _navRightBtn.titleLabel.font = XYFont_14;
    }
    return _navRightBtn;

}


-(UIButton *)bottomBtn{

    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomBtn setTitle:@"新增收货地址" forState:UIControlStateNormal];
        _bottomBtn.backgroundColor = BALANCEColor;
        _bottomBtn.titleLabel.font = XYFont_14;
        [_bottomBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_bottomBtn addTarget:self action:@selector(addAddressBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomBtn];
    }
    return _bottomBtn;
    
}


-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = XYWhiteColor;
        [self.view addSubview:_bottomView];
    }
    return _bottomView;

}


-(UIButton *)selectBtn
{
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectBtn setTitle:@"全选" forState:UIControlStateNormal];
        [_selectBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _selectBtn.titleLabel.font = XYFont_14;
        [_selectBtn setImage:[UIImage imageNamed:@"buy_icon_cir"] forState:UIControlStateNormal];
        [_selectBtn setImage:[UIImage imageNamed:@"buy_icon_cir_pre"] forState:UIControlStateSelected];
        [_selectBtn addTarget:self action:@selector(selectBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView addSubview:_selectBtn];
        _selectBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0) ;
    }
    return _selectBtn;

}

-(UIButton *)removeBtn
{
    if (!_removeBtn) {
        _removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removeBtn setTitle:@"删除" forState:UIControlStateNormal];
        _removeBtn.titleLabel.font = XYFont_14;
        [_removeBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [_removeBtn setBackgroundColor:XYMainColor];
        [self.bottomView addSubview:_removeBtn];
        [_removeBtn addTarget:self action:@selector(removeBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeBtn;
}

-(NSMutableArray *)dataSourceArr
{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSourceArr;
}
#pragma mark - 点击事件处理层
//背景图添加地址按钮  +  底部新增收货地址按钮
-(void)addAddressBtnHandler:(id)sender
{
    XYAddAddressVC *vc = [[XYAddAddressVC alloc]init];
    WeakSelf;
    vc.refresh = ^{
        [weakSelf netDataFromSever];
    };
    vc.dataArr = self.dataSourceArr;
    [self.navigationController pushViewController:vc animated:YES];
}

//右侧导航按钮点击事件
-(void)navRightBtnHandler:(id)sender{


    if (self.editMode) {
        self.editMode = NO;
        self.navRightBtn.selected = NO;
   
    }else
    {
        self.navRightBtn.selected = YES;
        self.editMode = YES;
       
    }
    
    [self updateViewVisualization];
}

//全选
-(void)selectBtnHandler:(UIButton *)sender{

    if (!sender.selected) {
        sender.selected = YES;
        for (XYAddressListModel *model in self.dataSourceArr) {
            model.select = YES;
        }
        [self.tableView reloadData];
        
    }else
    {
        sender.selected = NO;
        for (XYAddressListModel *model in self.dataSourceArr) {
            model.select = NO;
        }
        [self.tableView reloadData];
    }

}

//删除
-(void)removeBtnHandler:(id)sender{

    NSMutableArray *delArr = [NSMutableArray array];
    for (NSInteger i =0 ; i<self.dataSourceArr.count; i++) {
        XYAddressListModel *model = self.dataSourceArr[i];
        
        if (model.select) {
            [delArr addObject:model];
        }
        
    }
    if (delArr.count == 0) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"当前没有选中删除的地址" dismissTimeInterval:1.0];
        return;
    }
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否要删除所选地址" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
        
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
        [self netAddressDataDelete];
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
#pragma mark - table data source 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYDeliveryAddressListTVCell*cell = [tableView dequeueReusableCellWithIdentifier:XYDeliveryAddressListTVCellID];
    if (!cell) {
        cell = [[XYDeliveryAddressListTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:XYDeliveryAddressListTVCellID];
    }
    
    XYAddressListModel *model = self.dataSourceArr[indexPath.section];
    
    cell.dataModel = model;
    cell.mobileLab.text = model.mobile;
    cell.nameLab.text = model.userName;
    cell.addressLab.text = model.address;
    
    cell.index = indexPath;
    cell.delegate = self;
    cell.edit = self.editMode;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

     XYAddressListModel *modelReturn = self.dataSourceArr[indexPath.section];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectAddressWith:)]) {
   
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"addressId"] = modelReturn.addressId;
        WeakSelf;
        [XYAddressNet netSetDeliveryAddressWithParam:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
            if (error == nil) {
                [weakSelf.delegate selectAddressWith:modelReturn];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        }];
        
        
        return;
    }
    
    
    if (self.editMode) {
            XYAddressListModel *model = self.dataSourceArr[indexPath.section];
        if (model.select) {
            model.select = NO;
        }else
        {
            model.select = YES;
        }
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
        NSInteger i = 0;
        for (XYAddressListModel *model in self.dataSourceArr) {
            if (model.select) {
                i++;
            }
        }
        if (i == self.dataSourceArr.count) {
            self.selectBtn.selected = YES;
        }else
        {
            self.selectBtn.selected = NO;
        }
        
    }else
    {
        XYAddressListModel *model = self.dataSourceArr[indexPath.section];
        XYAddAddressVC *vc = [[XYAddAddressVC alloc] init];
        vc.dataModel = model;
//        vc.dataArr = self.dataSourceArr;
        [self.navigationController pushViewController:vc animated:YES];
    
    
    }
    
    
    
    
}

#pragma mark - 网络层
//获取数据
-(void)netDataFromSever
{
    
    WeakSelf;
 
        [XYAddressNet netGetAddressListResultBlock:^(NSDictionary *blockDictionary, NSError *error) {
    
            
            [weakSelf.tableView.mj_header endRefreshing];
            if (error == nil) {
                [weakSelf.dataSourceArr removeAllObjects];
                NSLog(@"%@",blockDictionary);
                NSArray *arr = [blockDictionary objectForKey:@"addressList"];
               
                if (arr.count == 0) {
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"DEFAULTADDRESS"];
                }
                for (NSDictionary *dic in arr) {
                    NSDictionary *attDic = [XYCommon removeNull:dic];
                    XYAddressListModel *model = [XYAddressListModel mj_objectWithKeyValues:attDic];
                    model.select = NO;
                    
                    if ([model.isDefault boolValue]) {
                        NSDictionary *addressDic = [model mj_keyValues];
                        [[NSUserDefaults standardUserDefaults] setObject:addressDic forKey:@"DEFAULTADDRESS"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                    }
                    
                    [weakSelf.dataSourceArr addObject:model];
                }
                if (weakSelf.dataSourceArr.count == 0) {
                    weakSelf.editMode = NO;
                    if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(selectAddressWith:)]) {
                        [weakSelf.delegate selectAddressWith:nil];
                    }
                }
                weakSelf.selectBtn.selected = NO;
                [weakSelf updateViewVisualization];
                [weakSelf.tableView reloadData];
            }
        }];

}

//删除地址


-(void)netAddressDataDelete{

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *str = @"";
    

    NSMutableArray *delArr = [NSMutableArray array];
    for (NSInteger i =0 ; i<self.dataSourceArr.count; i++) {
        XYAddressListModel *model = self.dataSourceArr[i];
        
        if (model.select) {
            [delArr addObject:model];
        }
        
    }
    
    for (NSInteger j=0; j<delArr.count; j++) {
        XYAddressListModel *model = delArr[j];
        
        if (model.select&& j!=delArr.count-1) {
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@,",model.addressId]];
        }else if (model.select && j == delArr.count-1)
        {
            str = [str stringByAppendingString:[NSString stringWithFormat:@"%@",model.addressId]];
        }
    }
    
    param[@"addressId"] = str;
    
    WeakSelf;
    [XYAddressNet netDeleteAddressParam:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
       
        if (error == nil) {
            
            weakSelf.editMode = NO;
            weakSelf.navRightBtn.selected = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf netDataFromSever];
            });
            
        }
        
    }];
    

}



#pragma mark - cell 代理
//设为默认
-(void)selectRowToSetDefaultAddress:(NSIndexPath *)index
{
    if (self.dataSourceArr.count==0) {//判断数据是否为空
        return ;
    }
    XYAddressListModel *model = self.dataSourceArr[index.section];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"addressId"] = model.addressId;
    WeakSelf;
    [XYAddressNet netSetDefaultAddress:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf netDataFromSever];
            });
            
        }
    }];
    
}

-(void)selectRowToEdit:(NSIndexPath *)index
{
    if (self.dataSourceArr.count==0) {//判断数据是否为空
        return ;
    }
    XYAddressListModel *model = self.dataSourceArr[index.section];
    
    XYAddAddressVC *vc = [[XYAddAddressVC alloc] init];
    vc.dataModel = model;

    [self.navigationController pushViewController:vc animated:YES];

}




@end
