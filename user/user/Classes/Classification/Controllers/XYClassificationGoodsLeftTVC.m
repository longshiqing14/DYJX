//
//  XYClassificationGoodsLeftTVC.m
//  user
//
//  Created by xingyun on 2017/11/6.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYClassificationGoodsLeftTVC.h"

#import "XYClassificationGoodsLeftTVCell.h"

#import "XYClassificationModel.h"

@interface XYClassificationGoodsLeftTVC ()

/** 选择的 分类 id */
@property (nonatomic, copy) NSString * columnId;

@end

@implementation XYClassificationGoodsLeftTVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableView.backgroundColor = XYGlobalBg;
    
    self.tableView.tableFooterView = [UIView new];
    
}

#pragma mark - 懒加载



//
//- (NSMutableArray*)dataSource
//{
//    if (_dataSource == nil) {
//        _dataSource = [NSMutableArray array];
//    }
//    return _dataSource;
//}

#pragma mark - set

- (void)setDataSource:(NSMutableArray *)dataSource
{
    _dataSource = dataSource;
    
    if (_dataSource.count == 0 ) {
        
        self.columnId = nil;
        
        [self goodsLeftdelegate:nil];
        
    }else{
        if (self.columnId == nil) {
            XYClassificationModel * model = _dataSource.firstObject;
            self.columnId = model.columnId;
            
            [self goodsLeftdelegate:model.children];
        }else{
            
            // do someing
            
        }
    }
    
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionNone)];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYClassificationGoodsLeftTVCell *cell = [XYClassificationGoodsLeftTVCell cellWithTableView:tableView];
    
    if (_dataSource.count > indexPath.row) {
        XYClassificationModel * model = _dataSource[indexPath.row];
        cell.titleLB.text = model.name;
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYClassificationModel * model = _dataSource[indexPath.row];
    
    if ([self.columnId isEqualToString:model.columnId]) {
        return;
    }else{
        self.columnId = model.columnId;
    }
    
    [self goodsLeftdelegate:model.children];

}

/** 设置分割线从顶端开始 */
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)viewWillLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - delegate

- (void)goodsLeftdelegate:(NSMutableArray*)rightdata
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(classificationGoodsLeftSelectdataList:)] ) {
        [self.delegate classificationGoodsLeftSelectdataList:rightdata];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
