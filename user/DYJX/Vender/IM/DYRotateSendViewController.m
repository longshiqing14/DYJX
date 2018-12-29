//
//  DYRotateSendViewController.m
//  user
//
//  Created by longshiqing on 2018/12/28.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYRotateSendViewController.h"
#import "JSExtension.h"
#import "MutableSelectCell.h"
#import "HeadSearchView.h"
#import "NIMKitTitleView.h"
#import "DYSelecteContractsPage.h"
#import "CQColorfulAlertView.h"
#import "IMSDK.h"

@interface DYRotateSendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray <RCConversationModel *> *conversionArray;
@property (nonatomic, strong)HeadSearchView *headView;
@property (nonatomic, strong)UIBarButtonItem *rightItem;
@property (nonatomic, strong)UIBarButtonItem *sendItem;
@property (nonatomic, strong)UIButton *createNewChat;
@property (nonatomic, strong)UILabel *lastTip;
@property (nonatomic, assign)BOOL ismutbleSelected;

@property (nonatomic, strong)NSMutableArray *selecteArray;


@end

@implementation DYRotateSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _ismutbleSelected = NO;

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.headView];
    [self.view addSubview:self.createNewChat];
    [self.view addSubview:self.lastTip];
    [self.view addSubview:self.tableView];

    [self baseUI];
    [self setUpTitleView];

    // 已读
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:RCKitDispatchMessageNotification object:nil];
}

-(void)reloadTableView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpTitleView
{
    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    {
        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;

        titleView.titleLabel.text = @"选择";
    }

    [titleView sizeToFit];
}

-(void)baseUI{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:21/255. green:41/255. blue:59/255. alpha:1]] forBarMetrics:UIBarMetricsDefault];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:SETIMAGENAME(@"btn_top_back") style:(UIBarButtonItemStylePlain) target:self action:@selector(black_controller)];
    self.rightItem = [[UIBarButtonItem alloc] initWithTitle:@"多选" style:UIBarButtonItemStylePlain target:self action:@selector(mutbleClick)];
    self.sendItem = [[UIBarButtonItem alloc] initWithTitle:@"发送(1)" style:UIBarButtonItemStylePlain target:self action:@selector(sendMessage)];

    self.navigationItem.leftBarButtonItem=item;
    self.navigationItem.rightBarButtonItem=self.rightItem;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithHexString:@"#F2A73B"]];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.conversionArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MutableSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MutableSelectCell"];
    if (!cell) {
        cell = [[MutableSelectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MutableSelectCell"];
    }
    RCConversationModel *model = self.conversionArray[indexPath.row];
    cell.title.text = model.conversationTitle;
    NSDictionary *dict = (NSDictionary *)model.extend;

    [cell setIsMutble:self.ismutbleSelected];

    if ([self.selecteArray containsObject:model]) {
        cell.selectButton.image = [UIImage imageNamed:@"dyjx_contract_button_selected"];
    }
    else {
        cell.selectButton.image = [UIImage imageNamed:@"dyjx_contract_button_normal"];
    }

    [cell setNumber:[[DataBaseManager shared] unreadCountIdentifyId:[JSExtension shared].myIdentityId conversionId:model.targetId]];

    if (dict[@"UpdateOn"]) {
        cell.timeLabel.text = dict[@"UpdateOn"];
    }
    else {
        cell.timeLabel.text = @"";
    }

    if (dict[@"Keywords"]) {
        cell.content.text = dict[@"Keywords"];
    }
    else {
        cell.content.text = @"";
    }

    if ([dict[@"type"] isEqualToString:@"1"]) {
        [cell setCircle:NO];
    }
    else if ([dict[@"type"] isEqualToString:@"0"]) {
        [cell setCircle:YES];
    }

    if (model.lastestMessage.senderUserInfo.portraitUri) { // 外面有图片就取外面第一层
        [cell.porityImage sd_setImageWithURL:[NSURL URLWithString:model.lastestMessage.senderUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
    }
    else if (dict[@"extra"]) {
        [cell.porityImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dict[@"extra"]]] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
    }
    else {

    }
    return (RCConversationBaseCell *)cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RCConversationModel *model = self.conversionArray[indexPath.row];
    if (self.ismutbleSelected) {
        MutableSelectCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSArray *array = [self.selecteArray copy];
        if (self.selecteArray.count == 0) {
            [self.selecteArray addObject:model];
        }
        else {
            int i = 0;
            for (RCConversationModel *item in array) {
                if ([item.targetId isEqualToString:model.targetId]) {
                    [self.selecteArray removeObjectAtIndex:i];
                    break;
                }
                i++;
            }
            if (array.count == i) {
                [self.selecteArray addObject:model];
            }
        }
        if (self.selecteArray.count == 0) {
            self.navigationItem.rightBarButtonItem = self.rightItem;
        }
        else {
            self.sendItem.title = [NSString stringWithFormat:@"发送(%d)",(int)self.selecteArray.count];
            self.navigationItem.rightBarButtonItem = self.sendItem;
        }
        [self.tableView reloadRow:indexPath.row inSection:0 withRowAnimation:UITableViewRowAnimationNone];
    }
    else { // 单选
        [self.selecteArray removeAllObjects];
        [self.selecteArray addObject:model];
        [self sendMessage];
    }

}


-(void)black_controller {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)mutbleClick {
    _ismutbleSelected = !_ismutbleSelected;
    [self.selecteArray removeAllObjects];
    if (_ismutbleSelected) {
        self.rightItem.title = @"单选";
    }
    else {
        self.rightItem.title = @"多选";
    }
    [self.tableView reloadData];
}
-(void)sendMessage {
    [CQColorfulAlertView showConversions:self.selecteArray message:self.message isMutble:self.ismutbleSelected buttonClickedBlock:^{
        __block NSInteger count = 0;
        for (RCConversationModel *model in self.selecteArray) {
            [[IMSDK sharedManager].chatManager sendMessage:self.message ToConversion:model success:^(id  _Nullable responseObject) {
                if ([model.targetId isEqualToString:[JSExtension shared].conversionId]) {
                    [[JSExtension shared].chatVC uiAddMessages:@[(RCIMMessage *)responseObject]];
                }
                count++;
                if (count == self.selecteArray.count) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:XY_IM_AlreadUpdateData object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                    [[UIApplication sharedApplication].keyWindow makeToast:@"转发成功"];
                }
            } failed:^(NSString * _Nonnull errorMsg) {
            }];

        }

    }];
}
-(void)createClick {
//    DYSelecteContractsPage *target = [[DYSelecteContractsPage alloc] init];
//    target.message = self.message;
//    [self.navigationController pushViewController:target animated:YES];

}
-(void)searchClick:(UIButton *)sender {
    [self.view resignFirstResponder];
}

#pragma mark - UI
-(NSMutableArray *)selecteArray {
    if (!_selecteArray) {
        _selecteArray = [[NSMutableArray alloc] init];
    }
    return _selecteArray;
}
-(HeadSearchView *)headView {
    if (!_headView) {
        _headView = [[HeadSearchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        [_headView.searchButton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

-(UITableView *)tableView {
    if (!_tableView) {
        CGFloat heightMin = MIN(60*self.conversionArray.count, kScreenHeight - 64 - 119);
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 119, kScreenWidth, heightMin) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delaysContentTouches = NO;
    }
    return _tableView;
}

-(NSMutableArray<RCConversationModel *> *)conversionArray {
    if (!_conversionArray) {
        _conversionArray = [[JSExtension shared].conversionArray mutableCopy];
        if (!_conversionArray) {
            _conversionArray = [[NSMutableArray alloc] init];
        }
    }
    return _conversionArray;
}

-(UIButton *)createNewChat {
    if (!_createNewChat) {
        _createNewChat = [UIButton buttonWithType:UIButtonTypeCustom];
        _createNewChat.backgroundColor = [UIColor whiteColor];
        [_createNewChat setTitle:@"创建新的聊天" forState:UIControlStateNormal];
        [_createNewChat setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [_createNewChat setTitleEdgeInsets:UIEdgeInsetsMake(14, -kScreenWidth/2.0 - 17, 14, 10)];
        _createNewChat.titleLabel.font = [UIFont systemFontOfSize:16];
        [_createNewChat addTarget:self action:@selector(createClick) forControlEvents:UIControlEventTouchUpInside];
        _createNewChat.frame = CGRectMake(0, 60, kScreenWidth, 44);
    }
    return _createNewChat;
}

-(UILabel *)lastTip {
    if (!_lastTip) {
        _lastTip = [[UILabel alloc] initWithFrame:CGRectMake(0, 104, kScreenWidth, 15)];
        _lastTip.text = @"    最近聊天";
        _lastTip.textColor = [UIColor grayColor];
        _lastTip.backgroundColor = [UIColor lightGrayColor];
        _lastTip.font = [UIFont systemFontOfSize:14];
    }
    return _lastTip;
}

@end
