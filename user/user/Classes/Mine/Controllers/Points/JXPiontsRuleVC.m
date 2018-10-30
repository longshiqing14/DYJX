//
//  JXPiontsRuleVC.m
//  user
//
//  Created by 岩  熊 on 2018/2/2.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXPiontsRuleVC.h"
#import "JXPointsDescriptionHeatView.h"
#import "XYOrderFromDetailModel.h"
#import "JXPiontsRuleViewModel.h"
#import "JXPiontsRuleModel.h"
static NSString *cellID=@"cellID";
@interface JXPiontsRuleVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)  UITableView *pointsTableView;
@property (nonatomic, strong) JXPiontsRuleViewModel *viewModel;
@property(nonatomic,strong)NSArray<JXPiontsRuleDetailModel*> *pointsArray;
@end

@implementation JXPiontsRuleVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"积分说明";
    self.pointsTableView.tableFooterView=[[UIView alloc]init];
    self.pointsTableView.estimatedRowHeight = 100;
    self.pointsTableView.separatorStyle = UITableViewCellSeparatorStyleNone; self.pointsTableView.rowHeight=UITableViewAutomaticDimension;
    //    self.pointsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self getDataFromSevice];
    [self initSubViews];
    [_pointsTableView reloadData];
}

- (void)getDataFromSevice{
    WeakSelf;
    [self.viewModel getPointsRulesInfoFromSeveiceSuccess:^(JXPiontsRuleModel *model) {
        weakSelf.pointsArray = model.integralDesc;
        [weakSelf.pointsTableView reloadData];
    } fail:^{
        
    }];
}
- (void)initSubViews{
    [self.view  addSubview:self.pointsTableView];
    [self.pointsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0 ));
    }];
}


- (UITableView *)pointsTableView{
    if (!_pointsTableView) {
        _pointsTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [_pointsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _pointsTableView.dataSource=self;
        _pointsTableView.delegate=self;
    }
    return _pointsTableView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 30;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.pointsArray[section].desc count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _pointsArray.count;
    
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 55.f;
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //    NSString *str = _pointsArray[indexPath.section][indexPath.row];
//    JXIntegralTitleModel *integralTitleModel=_pointsArray[indexPath.section];
//    NSString *str=integralTitleModel.desc[indexPath.row];
//    CGFloat heat;
//    if(indexPath.row==0){
//        heat=[self setIntroductionText:str]+10;
//    }else{
//        heat=[self setIntroductionText:str];
//    }
//    return heat;
//    
//}

//赋值 and 自动换行,计算出cell的高度
-(CGFloat)setIntroductionText:(NSString*)text{
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    CGRect infoRect =   [attrStr boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    
    return  infoRect.size.height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    cell.textLabel.textColor=XYRGBAColor(102, 102, 102, 1);
    cell.textLabel.numberOfLines = 0; cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    JXIntegralTitleModel *integralTitleModel=_pointsArray[indexPath.section];
    cell.textLabel.text=integralTitleModel.desc[indexPath.row];
    return cell;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JXPointsDescriptionHeatView *heatView=[[[NSBundle mainBundle]loadNibNamed:@"JXPointsDescriptionHeatView" owner:self options:nil]lastObject];
    JXIntegralTitleModel *integralTitleModel=_pointsArray[section];
    [heatView heat_init:integralTitleModel.title];
    return heatView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (JXPiontsRuleViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JXPiontsRuleViewModel alloc]init];
    }
    return _viewModel;
}
@end
