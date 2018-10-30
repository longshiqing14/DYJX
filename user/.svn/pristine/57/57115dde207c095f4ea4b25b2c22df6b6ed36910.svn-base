//
//  XYEWalletBalanceRecordSiftVC.m
//  user
//
//  Created by xingyun on 2017/10/24.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYEWalletBalanceRecordSiftVC.h"
#import "XYEWalletBalanceFirstCell.h"

#import "XYDatePickerView.h"

@interface XYEWalletBalanceRecordSiftHeaderView : UIView
/** 标题名 */
@property(copy,nonatomic) NSString *titleStr ;
/** 标签 */
@property(strong,nonatomic) UILabel *nameLab ;



@end


static NSString *const XYEWalletBalanceFirstCellID = @"XYEWalletBalanceFirstCell";
@implementation XYEWalletBalanceRecordSiftHeaderView

-(void)setTitleStr:(NSString *)titleStr
{

    self.nameLab.text = titleStr;
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(9);
        make.right.mas_equalTo(-9);
        make.top.bottom.mas_equalTo(0);
    }];
    
}

-(UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.textColor = XYGrayColor;
        _nameLab.font = XYFont_13;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}

@end

@interface XYEWalletBalanceRecordSiftVC ()<UITableViewDelegate,UITableViewDataSource,XYDatePickerViewDelegate>


@property(nonatomic,strong)UITableView *siftTable;


@property(assign,nonatomic) CGFloat tableWidth ;

@property(assign,nonatomic) NSInteger  selectIndex;

/**重置按钮*/
@property(strong,nonatomic) UIButton *resetBtn ;
/** 完成按钮 */
@property(strong,nonatomic) UIButton *finishBtn ;
@property(strong,nonatomic) NSString *startTimeStr ;

@property(strong,nonatomic) NSString *endTimeStr ;

@property(strong,nonatomic) NSDate *startDate ;

@property(strong,nonatomic) NSDate *endDate ;

@end

static NSString *const cellID = @"UITableViewCell";
@implementation XYEWalletBalanceRecordSiftVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //payment_icon_gx   order_icon_more
    
    WeakSelf;
    [self.siftTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XYScreenW*0.2);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(weakSelf.tableWidth);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide).offset(-50);
    }];
    
    [self.resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_siftTable.mas_left);
        make.width.mas_equalTo(_tableWidth/2);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(weakSelf.mas_bottomLayoutGuide);
    }];
    
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_resetBtn.mas_right);
        make.bottom.width.height.equalTo(_resetBtn);
        
    }];
//    self.siftTable.frame = CGRectMake(XYScreenW*0.2, 0, self.tableWidth, XYScreenH- 50-64);
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
//
//    self.resetBtn.frame = CGRectMake(XYScreenW*0.2, XYScreenH-50-64, self.tableWidth/2, 50);
//    self.finishBtn.frame = CGRectMake(XYScreenW*0.2 +self.tableWidth/2, XYScreenH-50-64, self.tableWidth/2, 50);
}
-(UIButton *)resetBtn
{
    if (!_resetBtn) {
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetBtn.backgroundColor = XYBlackColor;
        [_resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        _resetBtn.titleLabel.font = XYFont_14;
        [_resetBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [self.view addSubview:_resetBtn];
        [_resetBtn addTarget:self action:@selector(resetBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resetBtn;
}

-(UIButton *)finishBtn
{
    if (!_finishBtn) {
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _finishBtn.backgroundColor = XYMainColor;
        [_finishBtn setTitle:@"确认" forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = XYFont_14;
        [_finishBtn setTitleColor:XYWhiteColor forState:UIControlStateNormal];
        [self.view addSubview:_finishBtn];
        [_finishBtn addTarget:self action:@selector(finishBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishBtn;
    
}


-(NSInteger)selectIndex
{
    if (!_selectIndex) {
        _selectIndex = 0;
    }
    return _selectIndex;
}
-(UITableView *)siftTable
{
    if (!_siftTable) {
        _siftTable = [[UITableView alloc] init];
        _siftTable.delegate = self;
        _siftTable.dataSource = self;
        _siftTable.showsVerticalScrollIndicator = NO;
        _siftTable.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_siftTable];
        _siftTable.backgroundColor = XYGlobalBg;
        _siftTable.separatorInset = UIEdgeInsetsZero;
        _siftTable.tableFooterView = [UIView new];
        [_siftTable registerClass:[XYEWalletBalanceFirstCell class] forCellReuseIdentifier:XYEWalletBalanceFirstCellID];
    }
    return _siftTable;
}

-(CGFloat)tableWidth
{

    if (!_tableWidth) {
        _tableWidth = XYScreenW *0.8;
    }
    return _tableWidth;
}
#pragma mark - 按钮点击
-(void)resetBtnHandler:(id)sender
{
    self.selectIndex = 0;
    self.startTimeStr = @"";
    self.endTimeStr = @"";
    [self.siftTable reloadData];
}
-(void)finishBtnHandler:(id)sender{
    
    if ([self.endDate compare:self.startDate] != NSOrderedDescending && self.startDate != nil && self.endDate!=nil) {
        [YDBAlertView showToast:@"结束时间不能小于开始时间" dismissDelay:1.0];
        return;
    }
   
    if (self.delegate && [self.delegate respondsToSelector:@selector(backStartTime:endTimeStr:Type:)] ) {
        
        if (self.startDate!=nil && self.endDate != nil) {
            NSString * startTime = [self transformDateToTimeStr:self.startDate];
            NSString *endTime = [self transformDateToTimeStr:self.endDate];
            
            [self.delegate backStartTime:startTime endTimeStr:endTime Type:self.selectIndex];
        }else
        {
//            NSString * startTime = [self transformDateToTimeStr:self.startDate];
//            NSString *endTime = [self transformDateToTimeStr:self.endDate];
            
            [self.delegate backStartTime:@""    endTimeStr:@"" Type:self.selectIndex];
        }
    
    }
    
}

#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else
    {
        return 5;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0) {
        XYEWalletBalanceFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletBalanceFirstCellID forIndexPath:indexPath];
        [cell.iconImgV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(8);
            make.height.mas_equalTo(14);
        }];
        if (indexPath.row == 0) {
            cell.titleStr = @"开始日期";
            cell.iconImgV.image = [UIImage imageNamed:@"order_icon_more"];
            cell.descLab.text = self.startTimeStr;
        }else
        {
            cell.titleStr = @"结束日期";
             cell.iconImgV.image = [UIImage imageNamed:@"order_icon_more"];
            cell.descLab.text = self.endTimeStr;
        }
        return cell;
    }else{
        XYEWalletBalanceFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYEWalletBalanceFirstCellID forIndexPath:indexPath];
        
        if (indexPath.row == self.selectIndex) {
            cell.iconImgV.image = [UIImage imageNamed:@"payment_icon_gx"];
        }else
        {
            cell.iconImgV.image = [UIImage imageNamed:@""];
        }
        if (indexPath.row == 0) {
            cell.titleStr = @"全部";
            
            
        }else if (indexPath.row == 1)
        {
            cell.titleStr = @"购物消费";
        }else if (indexPath.row == 2)
        {
            cell.titleStr = @"订单退款";
        }else if (indexPath.row == 3)
        {
            cell.titleStr = @"余额充值";
        }else if (indexPath.row == 4)
        {
            cell.titleStr = @"预存款到账";
        }
        
        
        return cell;
    }

   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36.f;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XYEWalletBalanceRecordSiftHeaderView *headV = [[XYEWalletBalanceRecordSiftHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tableWidth, 36)];
  

    if (section == 0) {
        
        headV.titleStr = @"交易日期";
        
        
    }else
    {
        headV.titleStr = @"类型";
    }
    
    return headV;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        XYDatePickerView *datePick = [[XYDatePickerView alloc] init];
        datePick.delegate = self;
    
        datePick.datePicker.tag = indexPath.row;
        [datePick pickerShow];
    }else
    {
        self.selectIndex = indexPath.row;
        [self.siftTable reloadData];
    }

}

-(void)backTime:(NSDate *)timeStr WithPicker:(UIDatePicker *)picker
{
    
    if (picker.tag == 0) {
        self.startTimeStr = [self transformDateToTime:timeStr];
        self.startDate = timeStr;
    }else
    {
        self.endTimeStr = [self transformDateToTime:timeStr];
        self.endDate = timeStr;
    }
    [self.siftTable reloadData];
}

-(NSString *)transformDateToTime:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    return [format stringFromDate:date];
}
-(NSString *)transformDateToTimeStr:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyyMMdd"];
    
    return [format stringFromDate:date];
}

@end
