//
//  JXRefoundReasonPopView.m
//  user
//
//  Created by 岩  熊 on 2018/4/16.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefoundReasonPopView.h"
#import "JXRefundReasonPopCell.h"

@interface JXRefoundReasonPopView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JXRefoundReasonPopView
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {

    }
    return self;
}

- (IBAction)closePopView:(UIButton *)sender {
    [YWDPopupControl hide];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)registCell{
    self.reasonTab.delegate = self;
    self.reasonTab.dataSource = self;
    [self.reasonTab registerNib:[UINib nibWithNibName:@"JXRefundReasonPopCell" bundle:nil] forCellReuseIdentifier:@"RefundReasonPopCell"];
    [self.reasonTab setTableFooterView:[UIView new]];
    self.reasonTab.estimatedRowHeight = 200;
    self.reasonTab.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JXRefundReasonPopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RefundReasonPopCell" forIndexPath:indexPath];
    cell.titleLb.text = self.dataArray[indexPath.row].GroupName;

//    if (self.dataArray[indexPath.row].ID == self.reasonID) {
//        [cell.imageIcon setImage:[UIImage imageNamed:@"buy_icon_cir_pre"]];
//
//    }else{
        [cell.imageIcon setImage:[UIImage imageNamed:@"buy_icon_cir"]];
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (self.selectReasonBlock) {
        self.selectReasonBlock(weakSelf.dataArray[indexPath.row].Id);
    }
    [YWDPopupControl hide];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSMutableArray<DYJXXYResult *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:100];
    }
    return _dataArray;
}

@end
