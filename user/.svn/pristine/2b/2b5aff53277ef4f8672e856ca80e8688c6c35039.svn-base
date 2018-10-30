//
//  JXCityListViewController.m
//  user
//
//  Created by liu_yakai on 2017/12/8.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXCityListViewController.h"
#import "JXCityListHeatView.h"
#import "JXCitySeachViewController.h"
#import "JXCityListModel.h"
#import "DSectionIndexView.h"
#import "DSectionIndexItemView.h"

#define kSectionIndexWidth 30.f
#define kSectionIndexHeight 328.f
@interface JXCityListViewController ()<DSectionIndexViewDelegate,DSectionIndexViewDataSource>{

}
@property (weak, nonatomic) IBOutlet UIButton *seachButton;
@property (weak, nonatomic) IBOutlet BaseTableView *cityListTableView;
@property(nonatomic,strong)NSMutableArray *keyArray;
@property (strong, nonatomic) DSectionIndexView *sectionIndexView;

@end

static NSString *cellID=@"cellID";
static NSString *heatID=@"heatID";

@implementation JXCityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cityListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];

    
    [self.seachButton reat:5];
    if (!self.cityListModel) {
        [self getCityList];
    }else{
        self.keyArray = [NSMutableArray arrayWithArray:self.cityListModel.alphaList];
        [self.sectionIndexView reloadItemViews];
    }
//    [_cityListTableView registerNib:[UINib nibWithNibName:@"JXCityListHeatView" bundle:nil] forHeaderFooterViewReuseIdentifier:heatID];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.sectionIndexView reloadItemViews];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.sectionIndexView];
    _sectionIndexView.layer.cornerRadius = 15.;
    _sectionIndexView.layer.masksToBounds = YES;
    _sectionIndexView.frame = CGRectMake(CGRectGetWidth(self.cityListTableView.frame) - kSectionIndexWidth - 5, (CGRectGetHeight(self.cityListTableView.frame) - kSectionIndexHeight)/2, kSectionIndexWidth, self.cityListModel.alphaList.count * 15 + 20);
    [_sectionIndexView setBackgroundViewFrame];
}



//-(NSMutableArray *)keyArray{
//    if (!_keyArray) {
//        _keyArray = [NSMutableArray arrayWithArray:_cityListModel.alphaList];
//    }
//    return _keyArray;
//}

- (DSectionIndexView *)sectionIndexView{
    if (!_sectionIndexView) {
        _sectionIndexView = [[DSectionIndexView alloc] init];
        _sectionIndexView.itemNum = self.cityListModel.alphaList.count;
        _sectionIndexView.backgroundColor = [UIColor colorWithRed:152./255 green:152./255 blue:152./255 alpha:1];
        _sectionIndexView.dataSource = self;
        _sectionIndexView.delegate = self;
        _sectionIndexView.isShowCallout = YES;
        _sectionIndexView.calloutViewType = CalloutViewTypeForUserDefined;
        _sectionIndexView.calloutDirection = SectionIndexCalloutDirectionLeft;
        _sectionIndexView.calloutMargin = 100.f;
        [self.view addSubview:_sectionIndexView];
    }
    return _sectionIndexView;
}

-(void)getCityList{
    WeakSelf;
    [self network:[NSDictionary new] relativePath:kJXAPI_user_commuityList ShowAndDismiss:YES  success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _cityListModel=[JXCityListModel modelWithJSON:responseObject];
        [_cityListTableView reloadData];
        weakSelf.keyArray = [NSMutableArray arrayWithArray:_cityListModel.alphaList];
        [weakSelf.sectionIndexView reloadItemViews];
    } failure:^{
        
    } UnusualFailure:^{
        
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    JXValueModel *valueModel=_cityListModel.communityList[section];
    return valueModel.value.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _cityListModel.alphaList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    JXValueModel *valueModel=_cityListModel.communityList[indexPath.section];
    JXCommunityListModel *model=valueModel.value[indexPath.row];
    cell.textLabel.text=model.cityName;
    
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JXCityListHeatView *myView=[[[NSBundle mainBundle]loadNibNamed:@"JXCityListHeatView" owner:self options:nil]lastObject];
    [myView heat_init:_cityListModel.alphaList[section]];
    return myView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

#pragma mark---tableView索引相关设置----
//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _cityListModel.alphaList[section];
}


//添加索引栏标题数组
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//
//    return self.keyArray;
//}

/*
//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([title isEqualToString:UITableViewIndexSearch])
    {
        NSLog(@"%@",title);
        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
        return NSNotFound;
    }
    else
    {
        NSLog(@"%@",title);
        for (int i=0; i<_cityListModel.alphaList.count; i++) {
             NSString *lower = [title lowercaseString];
            if ([_cityListModel.alphaList[i] isEqualToString:lower]) {
                return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:i]; // -1 添加了搜索标识
            }
        }
        
    }
    return NSNotFound;
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JXValueModel *valueModel=_cityListModel.communityList[indexPath.section];
    JXCommunityListModel *model=valueModel.value[indexPath.row];
    if (self.SelectCity) {
        self.SelectCity(model);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


- (IBAction)seachCityClock:(id)sender {
    [self performSegueWithIdentifier:@"JXCitySeach" sender:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"JXCitySeach"]) {
        JXCitySeachViewController *details=[segue destinationViewController];
        details.SelectCity = ^(JXCommunityListModel *model) {
            if (self.SelectCity) {
                self.SelectCity(model);
            }
        };
    }
}

#pragma mark DSectionIndexViewDataSource && delegate method
- (NSInteger)numberOfItemViewForSectionIndexView:(DSectionIndexView *)sectionIndexView
{
    return self.keyArray.count;
}

- (DSectionIndexItemView *)sectionIndexView:(DSectionIndexView *)sectionIndexView itemViewForSection:(NSInteger)section
{
    DSectionIndexItemView *itemView = [[DSectionIndexItemView alloc] init];
    
    itemView.titleLabel.text = [[self.keyArray objectAtIndex:section] uppercaseString];
    itemView.titleLabel.font = [UIFont systemFontOfSize:10];
    itemView.titleLabel.textColor = [UIColor whiteColor];
    itemView.titleLabel.highlightedTextColor = [UIColor redColor];
//    itemView.titleLabel.shadowColor = [UIColor whiteColor];
//    itemView.titleLabel.shadowOffset = CGSizeMake(0, 1);
    
    return itemView;
}

- (UIView *)sectionIndexView:(DSectionIndexView *)sectionIndexView calloutViewForSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = CGRectMake(0, 0, 80, 80);
    
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.font = [UIFont boldSystemFontOfSize:36];
    label.text = [self.keyArray objectAtIndex:section];
    label.textAlignment = NSTextAlignmentCenter;
    
    [label.layer setCornerRadius:label.frame.size.width/2];
    [label.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [label.layer setBorderWidth:3.0f];
    [label.layer setShadowColor:[UIColor blackColor].CGColor];
    [label.layer setShadowOpacity:0.8];
    [label.layer setShadowRadius:5.0];
    [label.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    
    return label;
}

- (NSString *)sectionIndexView:(DSectionIndexView *)sectionIndexView
               titleForSection:(NSInteger)section
{
    return [self.keyArray objectAtIndex:section];
}

- (void)sectionIndexView:(DSectionIndexView *)sectionIndexView didSelectSection:(NSInteger)section
{

    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([self.keyArray[section] isEqualToString:UITableViewIndexSearch])
    {
        NSLog(@"%@",self.keyArray[section]);
        [self.cityListTableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
    }
    else
    {

        [self.cityListTableView scrollToRow:0 inSection:section atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }

}

@end
