//
//  XYSelectIconPopView.m
//  user
//
//  Created by xingyun on 2017/9/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYSelectIconPopView.h"

@interface XYSelectIconPopViewTVCell : UITableViewCell
@property(strong,nonatomic) UILabel *titleLab ;
@end
@implementation XYSelectIconPopViewTVCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatGui];
    }
    
    return self;

}


-(void)creatGui{

    self.contentView.backgroundColor = XYWhiteColor;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];

}

-(UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        [self.contentView addSubview:_titleLab];
        _titleLab.font = XYFont_14;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = XYFontTitleColor;
    }
    return _titleLab;
}

@end

@interface XYSelectIconPopView ()<UITableViewDelegate,UITableViewDataSource>

/** 主表 */
@property(strong,nonatomic) UITableView *myTableView ;

@end

static NSString * const XYSelectIconPopViewTVCellID = @"XYSelectIconPopViewTVCell";

@implementation XYSelectIconPopView




-(void)show
{
    
 

        self.frame = [UIScreen mainScreen].bounds;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
        
        [self addSubview:self.myTableView];
        
        CGFloat tableH = 44*3 +17.5;
    if (XYScreenH == 812) {
        [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.bottom.mas_equalTo(-34);
            make.height.mas_offset(tableH);
        }];
    }else
    {
        [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_offset(tableH);
        }];
    }
    [self layoutIfNeeded];
    
    
    [self animationWithView:self.myTableView];
    
}


-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] init];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.scrollEnabled = NO;
        _myTableView.backgroundColor = [UIColor clearColor];
        _myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        [_myTableView registerClass:[XYSelectIconPopViewTVCell class] forCellReuseIdentifier:XYSelectIconPopViewTVCellID];
    }
    return _myTableView;

}

//消失
-(void)dismiss{
    
    
   
    
 [UIView animateWithDuration:0.2 animations:^{
     
     self.alpha = 0;
 } completion:^(BOOL finished) {
     [self removeFromSuperview];
 }];
   

}

#pragma mark - 表数据源
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 17.5;
    }else
    {
        return 0.01f;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

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
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYSelectIconPopViewTVCell *cell = [tableView dequeueReusableCellWithIdentifier:XYSelectIconPopViewTVCellID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.titleLab.text = @"选择照片";
        }else{
            cell.titleLab.text = @"拍照";
        }
    }else
    {
            cell.titleLab.text = @"取消";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectWayIndex:)]) {
            [self.delegate selectWayIndex:indexPath.row];
        }
    }

    
    [self dismiss];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self dismiss];
}

-(void)animationWithView:(UIView*)bottomV
{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
    basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(bottomV.center.x, XYScreenH)];
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(bottomV.center.x, bottomV.center.y)];
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];;
    basic.duration = 0.2;
    [bottomV.layer addAnimation:basic forKey:[NSString stringWithFormat:@"%@",bottomV]];
    
}



-(void)hideAnimation:(UIView*)bottomV{
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position"];
    basic.fromValue = [NSValue valueWithCGPoint:CGPointMake(bottomV.center.x, bottomV.center.y)];
    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(bottomV.center.x,XYScreenH)];
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    basic.autoreverses = NO;
    basic.duration = 0.2;
    [bottomV.layer addAnimation:basic forKey:[NSString stringWithFormat:@"hide%@",bottomV]];
}

@end
