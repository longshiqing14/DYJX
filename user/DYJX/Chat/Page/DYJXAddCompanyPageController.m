//
//  DYJXAddCompanyPageController.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageController.h"
#import "DYJXAddCompanyPageCell.h"
#import "ImageUploadCell.h"
#import "XYSelectIconPopView.h"
#import "OwnerImageCell.h"
#import "DYJXQRCodePage.h"

@interface DYJXAddCompanyPageController ()<UITableViewDelegate,UITableViewDataSource,XYSelectIconPopViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *data;
@property (nonatomic, strong) UIView *submissionView;
@property (nonatomic, strong) UIButton *submissionBtn;
@property (nonatomic, assign) DYJXAddCompanyType companyType;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, assign) BOOL isSelectHeader;
@property(nonatomic, strong) UIImage *headerImage;

@end

@implementation DYJXAddCompanyPageController

-(instancetype)initWithCompanyType:(DYJXAddCompanyType)companyType {
    self = [super init];
    if (self) {
        self.companyType = companyType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getAddCompanyData];
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
}

- (void)getAddCompanyData {
    NSString *path;
    if (self.companyType == DYJXAddCompanyType_Sub) {
        path = [[NSBundle mainBundle] pathForResource:@"DYJXAddSubCompany.json" ofType:nil];
    }else {
        path = [[NSBundle mainBundle] pathForResource:@"DYJXAddCompany.json" ofType:nil];
    }
    if (path) {
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&error];
        [self.data addObjectsFromArray: [LPXNewCustomerCellModel mj_objectArrayWithKeyValuesArray:(NSArray *)jsonObject]];
    }else {
        NSLog(@"josn文件不存在");
    }
}

//弹出选择框
-(void)showActionForPhoto
{
    if (self.imageArray.count == 4) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"最多4张图片" dismissTimeInterval:1.0];
        return;
    }
    
    //选择图片时收起键盘
    [self.view endEditing:YES];
    
    XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
    [popView show];
    popView.delegate = self;
}

-(void)selectWayIndex:(NSInteger)index {
    WeakSelf
    if (index == 0) { // 打开相册
        [self chooseImagesWithMaxImagesCount:(self.isSelectHeader ? 1: 4) photosHandler:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOrinalPhoto) {
            [weakSelf updateLicenseOrHeaderWithImages:photos];
        }];
    }else { // 打开相机
        [self presentCameraPickerControllerCameraImageBlock:^(UIImage *image) {
            [weakSelf updateLicenseOrHeaderWithImages:@[image]];
        }];
    }
}

- (void)updateLicenseOrHeaderWithImages:(NSArray<UIImage *> *)images {
    if (self.isSelectHeader) { // 头像
        self.headerImage = images.firstObject;
        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0];
        OwnerImageCell *ownerImageCell = [self.tableView cellForRowAtIndexPath:indexPath];
        [ownerImageCell.porityImageView setImage:images.firstObject];
    }else {
        [self.imageArray addObjectsFromArray:images];
        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:4] ;
        [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data[section].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.data[indexPath.section][indexPath.row].cellIdentity forIndexPath:indexPath];
    [cell setValue:self.data[indexPath.section][indexPath.row] forKey:@"model"];
    WeakSelf
    if (indexPath.section == 0 && indexPath.row == 0) {
        OwnerImageCell *newCell = (OwnerImageCell *)cell;
        newCell.block = ^{
            weakSelf.isSelectHeader = YES;
            [weakSelf showActionForPhoto];
        };
        
        newCell.qrCcodeblock = ^{
            DYJXQRCodePage *qrCodePage = [[DYJXQRCodePage alloc]init];
//            qrCodePage.userIdOrCompanyId = self.groupNumber;
//            qrCodePage.companyNumber = self.groupByIdResponse.Result.NumberString;
//            qrCodePage.companyName = self.groupByIdResponse.Result.GroupName;
            [weakSelf.navigationController pushViewController:qrCodePage animated:YES];
        };
    }else if (indexPath.section == self.data.count - 1) {
        ImageUploadCell *newCell = (ImageUploadCell *)cell;
        newCell.imagesArray = [self.imageArray mutableCopy];
        newCell.addPicturesBlock = ^{
            //TODO: 添加图片
            weakSelf.isSelectHeader = NO;
            [weakSelf showActionForPhoto];
        };
        newCell.deleteImageBlock = ^(NSInteger index) {
            //TODO: 删除图片
            [weakSelf.imageArray removeObjectAtIndex:index];
            [weakSelf.tableView reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
    }else {
        DYJXAddCompanyPageCell *newCell = (DYJXAddCompanyPageCell *)cell;
        newCell.nextBtnBlock = ^(DYJXAddCompanyPageCell * _Nonnull cell) {
            //TODO: 点击进行下一步操作
        };
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth, __X(100))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(36)];
        lb.text = @"公司名片、相片或营业执照等";
        return lb;
    }else {
        return [UIView new];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, RCDscreenWidth - __X(50), __X(260))];
        lb.textColor = [UIColor blackColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.font = [UIFont systemFontOfSize:__X(26)];
        lb.text = @"用户可用商号ID、手机号进行登录；商号ID由平台在永华注册时自动分配；银行账号可使用于用户收付款，请准确填写";
        lb.numberOfLines = 0;
        return lb;
    }else {
        return [[UIView alloc]init];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return __X(300);
    }else if (indexPath.section == self.data.count - 1) {
        return __X(240);
    }
    return __X(100);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f;
    }else if (section != (self.data.count - 1)) {
        return __X(40);
    }else {
      return __X(180);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == (self.data.count - 1)) {
        return __X(260);
    }
    return 0.01f;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        [_tableView registerClass:[OwnerImageCell class] forCellReuseIdentifier:kGroupDetailModelPorityCellId];
        [_tableView registerClass:[DYJXAddCompanyPageCell class] forCellReuseIdentifier:@"DYJXAddCompanyPageCell"];
        [_tableView registerClass:[ImageUploadCell class] forCellReuseIdentifier:kGroupDetailModelImageUploadCell];
    }
    return _tableView;
}

- (NSMutableArray<NSMutableArray<LPXNewCustomerCellModel *> *> *)data {
    if (!_data) {
        _data = [[NSMutableArray alloc]init];
    }
    return _data;
}

- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}

@end
