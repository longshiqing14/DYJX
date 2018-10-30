//
//  XYDatePickerView.m
//  user
//
//  Created by xingyun on 2017/10/24.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYDatePickerView.h"

@interface XYDatePickerView()
/**  */
@property(nonatomic,strong)UIView *bgView;

@property(strong,nonatomic) UIButton *cancelBtn ;

@property(strong,nonatomic) UIButton *confirmBtn ;

@property(copy,nonatomic) NSDate *backDate ;

@end

static CGFloat const bgViewH = 40;
static CGFloat const pickerH = 180;

@implementation XYDatePickerView


-(void)pickerShow
{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    [self addSubview:self.bgView];
    
    [self addSubview:self.datePicker];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(pickerH);
    }];

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(_datePicker.mas_top);
        make.height.mas_equalTo(bgViewH);
    }];
    
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
    
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
 
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(NSDate *)backDate
{
    if (!_backDate) {
        _backDate = [NSDate date];
    }
    return _backDate;
}

-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = XYWhiteColor;
        [self addSubview:_bgView];
    }
    return _bgView;
}
-(UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = XYFont_15;
        [_cancelBtn setTitleColor:XYMainColor forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_cancelBtn];
    }
    return _cancelBtn;
}
-(UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = XYFont_15;
        [_confirmBtn setTitleColor:XYMainColor forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(confirmBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:_confirmBtn];
    }
    return _confirmBtn;
}

-(UIDatePicker *)datePicker
{
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.locale = [NSLocale currentLocale];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.backgroundColor = XYWhiteColor;
        [_datePicker addTarget:self action:@selector(datePickerHandler:) forControlEvents:UIControlEventValueChanged];
    }
    return _datePicker;
}
-(void)cancelBtnHandler:(id)sender{

    [self dismisss];
}
-(void)confirmBtnHandler:(id)sender{
    
//    NSString *timeStr = [self transformDateToTime:self.backDate];
    if (self.delegate && [self.delegate respondsToSelector:@selector(backTime:WithPicker:)]) {
        [self.delegate backTime:self.backDate WithPicker:self.datePicker];
    }
    [self dismisss];

}
-(void)datePickerHandler:(UIDatePicker *)picker{

    self.backDate = picker.date;

}


-(NSString *)transformDateToTime:(NSDate *)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    return [format stringFromDate:date];
}

-(void)dismisss{

    [self removeFromSuperview];
}


@end
