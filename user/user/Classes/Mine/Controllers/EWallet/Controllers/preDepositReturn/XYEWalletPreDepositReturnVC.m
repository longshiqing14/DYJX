//
//  XYEWalletPreDepositReturnVC.m
//  user
//
//  Created by xingyun on 2017/10/19.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletPreDepositReturnVC.h"
#import "XYEWalletPreDepositReturnHeaderVC.h"
#import "XYEWalletPreDepositFirstCell.h"
#import "XYEWalletPreDepositSecondCell.h"
#import "XYEWalletPreDepositFourthCell.h"
#import "XYEWalletPreDepositChildVC.h"
#import "XYEWalletAllNet.h"
#import "XYEWalletPreDepositDetailModel.h"
@interface XYEWalletPreDepositReturnVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property(strong,nonatomic) XYEWalletPreDepositReturnHeaderVC *headerVC ;

@property(strong,nonatomic) XYEWalletPreDepositChildVC *childVC ;
/** 提示标签 */
@property(strong,nonatomic) UILabel *warnLab ;


/** 图标 动画*/
@property(strong,nonatomic) UIImageView *iconImgV ;
/** 是否展开 */
@property(assign,nonatomic) BOOL select ;

@property(strong,nonatomic) XYEWalletPreDepositDetailModel *model ;
@end


static NSString *const XYEWalletPreDepositFirstCellID = @"XYEWalletPreDepositFirstCell";

static NSString *const XYEWalletPreDepositSecondCellID = @"XYEWalletPreDepositSecondCell";

static NSString *const XYEWalletPreDepositFourthCellID = @"XYEWalletPreDepositFourthCell";


static NSString *const UITableViewCellID = @"UITableViewCell";


@implementation XYEWalletPreDepositReturnVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"预存款返还明细";
    self.view.backgroundColor = XYGlobalBg;
    

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self dataFromSever];
    
}


-(void)dataFromSever{
    WeakSelf;
    [XYEWalletAllNet netdepositDetailWithCashbackId:self.cashbackId block:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            NSDictionary *dic = blockDictionary[@"cashback"];
          
            weakSelf.model = [XYEWalletPreDepositDetailModel mj_objectWithKeyValues:dic];
            weakSelf.headerVC.dataModel = weakSelf.model;
            weakSelf.childVC.dataModel = weakSelf.model;
            [weakSelf.tableView reloadData];
        }
    }];

}

#pragma mark- lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor =XYGlobalBg;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.separatorColor = XYLineColor;
        [self.view addSubview:_tableView];
        UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, ewallet_PreDeposit_header_height)];
        [headV addSubview:self.headerVC.view];
        self.headerVC.view.frame = CGRectMake(0, 0, XYScreenW, ewallet_PreDeposit_header_height);
        _tableView.tableHeaderView = headV;
        
        UIView *footView = [[UIView alloc] init];
        footView.frame = CGRectMake(0, 0, XYScreenW, 100);
        [footView addSubview:self.warnLab];
        self.warnLab.frame = CGRectMake(0, 10, XYScreenW, 12);
        _tableView.tableFooterView = footView;
        
        
        [_tableView registerClass:[XYEWalletPreDepositFirstCell class] forCellReuseIdentifier:XYEWalletPreDepositFirstCellID];
        [_tableView registerClass:[XYEWalletPreDepositSecondCell class] forCellReuseIdentifier:XYEWalletPreDepositSecondCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
    }

    return _tableView;
}

-(UILabel *)warnLab
{
    if (!_warnLab) {
        _warnLab = [UILabel new];
        _warnLab.textAlignment = NSTextAlignmentCenter;
        _warnLab.textColor =XYGrayColor;
        _warnLab.font = XYFont_12;
        _warnLab.text = @"结果仅供参考，实际到账以到账情况为准";

    }
    return _warnLab;
}

-(XYEWalletPreDepositReturnHeaderVC *)headerVC
{
    if (!_headerVC) {
        _headerVC = [[XYEWalletPreDepositReturnHeaderVC alloc] init];

        [self addChildViewController:_headerVC];
    }
    return _headerVC;
}
-(XYEWalletPreDepositChildVC *)childVC
{
    if (!_childVC) {
        _childVC = [[XYEWalletPreDepositChildVC alloc]init];
        [self addChildViewController:_childVC];
    }
    return _childVC;

}
-(UIImageView *)iconImgV
{
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc] init];
        _iconImgV.image = [UIImage imageNamed:@"ewallet_prepay_close"];
    }
    return _iconImgV;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        XYEWalletPreDepositFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositFirstCellID forIndexPath:indexPath];
        cell.leftLab.text = @"应返还总金额";
        cell.rightLab.text = [NSString stringWithFormat:@"￥%@",self.model.totalPrice];
        cell.rightLab.textColor = XYBlackColor;
        
        return cell;
    }else if (indexPath.row == 1)
    {
        XYEWalletPreDepositFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositFirstCellID forIndexPath:indexPath];
        cell.leftLab.text = @"本月返还金额";
        cell.rightLab.textColor = XYMainColor;
        cell.rightLab.text =[NSString stringWithFormat:@"￥%@",self.model.curCashbackPrice];
        return cell;
    }else if (indexPath.row == 2)
    {
        XYEWalletPreDepositSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletPreDepositSecondCellID forIndexPath:indexPath];
        [cell.contentView addSubview:self.iconImgV];
        cell.leftLab.text = [NSString stringWithFormat:@"待返还金额: ￥%@",self.model.waitCashbackPrice];
        cell.rightLab.text = @"待返还月数:";
        cell.monthLab.text = self.model.waitCashbackMonths;
        [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-19);
            make.width.mas_offset(12);
            make.height.mas_offset(7);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
        }];
        return cell;
    }else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
        [cell.contentView addSubview:self.childVC.tableView];
        [self.childVC.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_offset(0);
        }];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        if (self.select) {
            return self.childVC.tableView.contentSize.height;
        }else
        {
            
            return 0;
        }
    }
    
    return 45;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        if (self.select) {
            self.select = NO;
            WeakSelf;
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.iconImgV.transform = CGAffineTransformIdentity;
            }];
        }else
        {
            WeakSelf;
            [UIView animateWithDuration:0.2 animations:^{
                weakSelf.iconImgV.transform = CGAffineTransformMakeRotation(M_PI);
            }];
            self.select = YES;
        }
      
        [tableView reloadData];
    }
}

@end
