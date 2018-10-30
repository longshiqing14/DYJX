//
//  XYMyBoardBandVC.m
//  user
//
//  Created by xingyun on 2017/10/11.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYMyBoardBandVC.h"

#import "XYMyBoardBandFirstCell.h"
#import "XYMyBoardBandSecondCell.h"
#import "XYBoardBandNet.h"
#import "XYBoardBandListModel.h"
#import "XYMyBoardBandRenewalListVC.h"
#import "XYCaculateTool.h"
#import "XYPreDepositVC.h"
#import "XYBoardBandEditDetailVC.h"
#import "XYMyBoardBandFirstChildVC.h"
#import "XYMyBoardBandSecondChildVC.h"

@interface XYMyBoardBandVC ()<UITableViewDelegate,UITableViewDataSource,XYMyBoardBandSecondChildVCDelegate>
/** 数组 */
@property(nonatomic,strong) NSMutableArray *sectionOneArr;
/**  */
@property(strong,nonatomic) NSMutableArray *sectionTwoArr ;
/** 我的宽带表 */
@property(strong,nonatomic) UITableView * boardbandTable;
/** 数据模型 */
@property(strong,nonatomic) XYBoardBandListModel *dataModel ;
/** 续约按钮 */
@property(strong,nonatomic) UIButton *renewalBtn ;
/** 表脚 */
@property(strong,nonatomic) UIView *footView ;


@property(strong,nonatomic) XYMyBoardBandFirstChildVC *firstChildVC ;

@property(strong,nonatomic) XYMyBoardBandSecondChildVC *secondChildVC ;

@end

static NSString *const XYMyBoardBandFirstCellID = @"XYMyBoardBandFirstCell";

static NSString *const XYMyBoardBandSecondCellID = @"XYMyBoardBandSecondCell";

@implementation XYMyBoardBandVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的宽带";
    
    self.view.backgroundColor = XYGlobalBg;

    [self setLeftImageButtonWith:@"nav_btn_goback" target:self action:@selector(leftBtnHandler:)];
    [self dataFromSever];
    
 
}
-(void)leftBtnHandler:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)needFatherVCRefreshData
{
    [self dataFromSever];
}

-(void)dataFromSever{
    WeakSelf;
    [XYBoardBandNet netMyBoardBandWithParam:[NSMutableDictionary dictionary] block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            
            weakSelf.dataModel = [XYBoardBandListModel mj_objectWithKeyValues: [blockDictionary objectForKey:@"broadband"]];
            [weakSelf tableWithError:error];
        }else
        {
            [weakSelf tableWithError:error];
        }
        
   
    }];
}

-(void)tableWithError:(NSError *) error{

    
    

    //上面用来测试
    if (error == nil) {
        
        
        [self.boardbandTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_offset(0);
        }];
        if ([self.dataModel.residueTime integerValue]<30) {
            self.footView.frame = CGRectMake(0, 0, XYScreenW, 140);
            self.renewalBtn.frame = CGRectMake(47, 41, XYScreenW-47*2, 43);
            
            [self.footView addSubview:self.renewalBtn];
            self.boardbandTable.tableFooterView = self.footView;
        }else
        {
            self.boardbandTable.tableFooterView = [UIView new];
        }
  
        
    }else
    {
        /**
         E1070002: {
         code: 'E1070002',
         msg: '该用户未办理宽带业务'
         },
         E1070010: {
         code: 'E1070010',
         msg: '该用户未完善宽带安装信息'
         }
         
         */
        if ([error.domain isEqualToString:@"E1070002"]) {
            
            [self.view addSubview:self.firstChildVC.view];
            [self.firstChildVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.bottom.mas_equalTo(0);
            }];
        }else if ([error.domain isEqualToString:@"E1070010"])
        {
            [self.view addSubview:self.secondChildVC.view];
            [self.secondChildVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
        }
        
    
    }
    
}


#pragma mark - lazy


-(XYMyBoardBandFirstChildVC *)firstChildVC
{
    if (!_firstChildVC) {
        _firstChildVC = [[XYMyBoardBandFirstChildVC alloc] init];
        [self addChildViewController:_firstChildVC];
    }
    return _firstChildVC;

}

-(XYMyBoardBandSecondChildVC *)secondChildVC
{
    if (!_secondChildVC) {
        _secondChildVC = [[XYMyBoardBandSecondChildVC alloc] init];
        [self addChildViewController:_secondChildVC];
        _secondChildVC.delegate = self;
    }
    return _secondChildVC;

}


-(UITableView *)boardbandTable
{
    if (!_boardbandTable) {
        _boardbandTable = [[UITableView alloc] init];
        _boardbandTable.showsVerticalScrollIndicator = NO;
        _boardbandTable.showsHorizontalScrollIndicator = NO;
        _boardbandTable.delegate = self;
        _boardbandTable.dataSource = self;
        _boardbandTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _boardbandTable.backgroundColor = XYGlobalBg;
        [_boardbandTable registerClass:[XYMyBoardBandFirstCell class] forCellReuseIdentifier:XYMyBoardBandFirstCellID];
        [_boardbandTable registerClass:[XYMyBoardBandSecondCell class] forCellReuseIdentifier:XYMyBoardBandSecondCellID];
        [self.view addSubview:_boardbandTable];
    }
    return _boardbandTable;

}

-(UIView *)footView
{
    if (!_footView) {
        _footView = [UIView new];
        _footView.backgroundColor = XYGlobalBg;
    }
    return _footView;
}

-(UIButton *)renewalBtn
{
    if (!_renewalBtn) {
        _renewalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _renewalBtn.backgroundColor = XYMainColor;
        _renewalBtn.layer.cornerRadius = 5;
        _renewalBtn.layer.masksToBounds = YES;
        [_renewalBtn setTitle:@"续约" forState:UIControlStateNormal];
        [_renewalBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        _renewalBtn.titleLabel.font = XYFont_14;
        [_renewalBtn addTarget:self action:@selector(clickRenewalBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _renewalBtn;

}



-(NSMutableArray *)sectionOneArr
{
    if (!_sectionOneArr) {
        _sectionOneArr = [NSMutableArray array];
        [_sectionOneArr addObject:@"开户人"];
        [_sectionOneArr addObject:@"联系手机"];
        [_sectionOneArr addObject:@"开通地址"];
    }
    return _sectionOneArr;

}

-(NSMutableArray *)sectionTwoArr
{
    if (!_sectionTwoArr) {
        _sectionTwoArr = [NSMutableArray array];
        [_sectionTwoArr addObject:@"套餐名称"];
//        [_sectionTwoArr addObject:@"宽带大小"];
        [_sectionTwoArr addObject:@"办理时间"];
        [_sectionTwoArr addObject:@"生效时间"];
        [_sectionTwoArr addObject:@"到期时间"];
        [_sectionTwoArr addObject:@"剩余时间"];
        [_sectionTwoArr addObject:@"宽带状态"];
       
    }
    return _sectionTwoArr;
}

#pragma mark -表
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.sectionOneArr.count;
    }else if (section == 1)
    {
        return self.sectionTwoArr.count;
    }else
    {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        XYMyBoardBandFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYMyBoardBandFirstCellID forIndexPath:indexPath];
        cell.leftLab.text = self.sectionOneArr[indexPath.row];
        
        if (indexPath.row == 0) {
            cell.rightLab.text = self.dataModel.name;
            
        }else if (indexPath.row == 1)
        {
            cell.rightLab.text = self.dataModel.mobile;
            
        }else
        {
            cell.rightLab.text = self.dataModel.address;
        }
        
        
        
        return cell;
    }else if (indexPath.section == 1)
    {
        
            XYMyBoardBandFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYMyBoardBandFirstCellID forIndexPath:indexPath];
            cell.leftLab.text = self.sectionTwoArr[indexPath.row];
        
        if (indexPath.row == 0) {
            cell.rightLab.text = self.dataModel.productName;
            
        }else if (indexPath.row == 1)
        {
            cell.rightLab.text = self.dataModel.createTime;
            
        }else if (indexPath.row == 2)
        {
            cell.rightLab.text = self.dataModel.transactionTime;
            
        }else if (indexPath.row == 3)
        {
            cell.rightLab.text = self.dataModel.endTime;
            
        }else if (indexPath.row == 4)
        {
            cell.rightLab.text =[NSString stringWithFormat:@"%@天",self.dataModel.residueTime];
            
        }else
        {
            cell.rightLab.text = self.dataModel.state;
        }
        
        
        
        
              return cell;
    }else
    {
        XYMyBoardBandSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:XYMyBoardBandSecondCellID forIndexPath:indexPath];
            cell.titleLab.text = @"续约记录";
          return cell;
    }
  

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row ==2 && indexPath.section == 0) {
        CGSize size = [XYCaculateTool sizeWithString:self.dataModel.address fontOfSize:14 viewWidth:(XYScreenW - 20-80)];
        
        if (size.height>15) {
            return size.height + 30;
        }
    }
    
    if (indexPath.row == 0 && indexPath.section ==1) {
        CGSize size = [XYCaculateTool sizeWithString:self.dataModel.productName fontOfSize:14 viewWidth:(XYScreenW - 20-80)];
        
        if (size.height>15) {
            return size.height + 30;
        }
    }
    
    return 45;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {//跳转续约记录
        XYMyBoardBandRenewalListVC *renewalVC = [[XYMyBoardBandRenewalListVC alloc] init];
        [self.navigationController pushViewController:renewalVC animated:YES];
        
//        [self.navigationController pushViewController:[XYBoardBandEditDetailVC new] animated:YES];
        
    }
}


#pragma Mark - 续约
-(void)clickRenewalBtnHandler:(UIButton *)sender{

    /** 正确的*/
    XYPreDepositVC *deopsit = [[XYPreDepositVC alloc] init];
    deopsit.isProductList = @"Y";
    [self.navigationController pushViewController:deopsit animated:YES];
    
    
    /** 测试 */
    
//    XYBoardBandEditDetailVC *detailVC = [XYBoardBandEditDetailVC new];
//    [self.navigationController pushViewController:detailVC animated:YES];

}


@end
