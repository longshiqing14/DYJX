//
//  XYOrderCommentDetailVC.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderCommentDetailVC.h"

#import "XYOrderCommentDetailFirstCell.h"

#import "XYOrderCommentDetailSecondCell.h"
#import "XYOrderCommentNet.h"
#import "XYOrderCommentDetailModel.h"

#import "XYOrderCommentTools.h"

@interface XYOrderCommentDetailVC ()<UITableViewDelegate,UITableViewDataSource>
/** 表 */
@property(nonatomic,strong) UITableView *myTableView;

/** 数据模型 */
@property(strong,nonatomic) XYOrderCommentDetailModel *model ;

@property(strong,nonatomic) XYOrderReCommentDetail *recommentModel ;


@end

static NSString *const XYOrderCommentDetailFirstCellID = @"XYOrderCommentDetailFirstCell";

static NSString *const XYOrderCommentDetailSecondCellid = @"XYOrderCommentDetailSecondCell";;

@implementation XYOrderCommentDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评价详情";
    
    [self netFromData];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
    }];

}

-(void)netFromData{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"appId"] = self.dataModel.apprId;
    WeakSelf;
    [XYOrderCommentNet netOneProductCommentDetail:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            NSDictionary *dic = [XYCommon removeNull:blockDictionary];
            weakSelf.model = [XYOrderCommentDetailModel mj_objectWithKeyValues: dic[@"appraiseInfo"]];
            weakSelf.recommentModel = [XYOrderReCommentDetail mj_objectWithKeyValues:dic[@"addToAppraiseInfo"]];
   
            
        }
        [weakSelf.myTableView reloadData];
        
    }];
    
}
#pragma mark - lazy
-(UITableView *)myTableView
{
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] init];
        [self.view addSubview:_myTableView];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.backgroundColor = XYGlobalBg;
        _myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _myTableView.tableFooterView = [UIView new];
        [_myTableView registerClass:[XYOrderCommentDetailFirstCell class] forCellReuseIdentifier:XYOrderCommentDetailFirstCellID];
        [_myTableView registerClass:[XYOrderCommentDetailSecondCell class] forCellReuseIdentifier:XYOrderCommentDetailSecondCellid];
    }
    return _myTableView;
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.recommentModel!=nil) {
        return 2;
    }else
    {
          return 1;
    }
  
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        XYOrderCommentDetailFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYOrderCommentDetailFirstCellID forIndexPath:indexPath];
        
        cell.model = self.model;
        
        return cell;
    }else
    {
    
        XYOrderCommentDetailSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:XYOrderCommentDetailSecondCellid forIndexPath:indexPath];
        
        cell.model = self.recommentModel;
        return cell;
    }
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
            return [self cellTwoHeight];
    }else
    {
            return [self recommentCellHeight];
   
    }

}

-(CGFloat)recommentCellHeight{

    CGSize size = [self sizeWithString:_recommentModel.comment fontOfSize:14 viewWidth:(XYScreenW-20)];
    
    return [self recommentCollectionH]+49 +size.height;

}


-(CGFloat )recommentCollectionH{
    
    if (self.recommentModel.images.count%3 == 0) {
        return ([self cellWidth] +10) *(self.recommentModel.images.count/3) ;
    }else
    {
        return ([self cellWidth]+10)*(self.recommentModel.images.count/3 +1) -10;
    }
}

///////////--------
-(CGFloat )cellTwoHeight{
    
    CGSize size = [self sizeWithString:self.model.comment fontOfSize:14 viewWidth:(XYScreenW-20)];
    return size.height +[self collectionH] +84;
    
}
-(CGFloat)collectionH{//有问题
    
    if (self.model.images.count%3 == 0) {
        return ([self cellWidth] +10) *(self.model.images.count/3) ;
    }else
    {
        return ([self cellWidth]+10)*(self.model.images.count/3 +1) -10;
    }
    
    
}

-(CGFloat)cellWidth{
    
    return (XYScreenW - 20 - 30)/3;
}
/** 计算字符串长度 */
-(CGSize)sizeWithString:(NSString*)string fontOfSize:(CGFloat)font viewWidth:(CGFloat)viewWidth
{
    if ([string length] > 0) {
        
        CGRect textRect = [string
                           boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT)
                           options:(NSStringDrawingTruncatesLastVisibleLine |
                                    NSStringDrawingUsesLineFragmentOrigin |
                                    NSStringDrawingUsesFontLeading)
                           attributes:@{
                                        NSFontAttributeName :
                                            [UIFont systemFontOfSize:font]
                                        }
                           context:nil];
        textRect.size.height = ceilf(textRect.size.height);
        textRect.size.width = ceilf(textRect.size.width);
        return CGSizeMake(textRect.size.width, textRect.size.height);
    } else {
        return CGSizeZero;
    }
}

@end
