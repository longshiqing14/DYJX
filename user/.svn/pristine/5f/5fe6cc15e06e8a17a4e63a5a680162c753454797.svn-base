//
//  JXRefundCashPage.m
//  user
//
//  Created by 岩  熊 on 2018/4/4.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXRefundCashPage.h"
#import "JXRefundHeaderView.h"
#import "JXRefundFooterView.h"
#import "JXRefundAddressCell.h"
#import "JXRefundContentCell.h"
#import "JXRefundViewModel.h"
#import "JXRefundReasonCell.h"
#import "JXRefundImageUploadCell.h"
#import "JXRefundStateCell.h"
#import "XYSelectIconPopView.h"
#import "JXRefoundReasonPopView.h"
#import "JXRefundCashSelectAddressPage.h"
#import "JXRefundReasonsModel.h"
#import "XYBestAllNet.h"
#import "JXMyAfterSaleDetailViewController.h"
#import "JXRefundTextModel.h"

@interface JXRefundCashPage ()<UITableViewDelegate,UITableViewDataSource,XYSelectIconPopViewDelegate>
@property (nonatomic, strong) UITableView *refundGoodsTab;
@property (nonatomic, strong) JXRefundViewModel *viewModel;
@property(strong,nonatomic) NSMutableArray *imgArr ;
@property(copy,nonatomic) NSString *reasonString;
@property(strong,nonatomic) JXRefundReasonsDeatailModel *reasonModel;
@property(strong,nonatomic) JXRefundTextModel *RefundTextModel;
@property(assign,nonatomic) NSString *reasonID;
@property(nonatomic, strong) NSString *pickAddress;
@property(nonatomic, strong) UITextView *stateDescriptionTF;
@property(nonatomic, strong) UITextField *userNameTF;
@property(nonatomic, strong) UITextField *phoneNumTF;
/** 图片数组 */
@property(copy,nonatomic) NSString *imgStr ;
@end

@implementation JXRefundCashPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithHexString:@"F1F1F1"];
    self.refundGoodsTab.backgroundColor= [UIColor colorWithHexString:@"F1F1F1"];
    self.refundGoodsTab.estimatedRowHeight = 200;
    self.refundGoodsTab.estimatedSectionHeaderHeight = 200;
    
    self.title = @"申请退货/退款";
    [self getReundText];
    [self getReundReasons];

    [self initSubViews];
}
- (void)getReundText{
    WeakSelf;
    [self.viewModel GetRefundTextSuccess:^(JXRefundTextModel *model) {
        self.RefundTextModel = model;
        [weakSelf.refundGoodsTab reloadData];
    } failed:^(NSString *errorMsg) {
        
    }];
}
- (void)getReundReasons{
    [self.viewModel GetRefundCashDataSuccess:^(BOOL isLastPage, BOOL doHaveData) {
        
    } failed:^(NSString *errorMsg) {
        
    }];
}

- (void)initSubViews{
    [self.view addSubview:self.refundGoodsTab];
    [self.refundGoodsTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel numberOfCells];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfCellsWithSection:section];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                JXRefundReasonCell *reasonCell = [tableView dequeueReusableCellWithIdentifier:@"RefundReasonCell" forIndexPath:indexPath];
                if ([YWDTools isNil:self.reasonModel.name]) {
                    reasonCell.subLab.text = @"请选择";
                }else{
                    reasonCell.subLab.text = self.reasonModel.name;
                }
                cell = reasonCell;
            }
                break;
            case 1:
            {
                JXRefundStateCell *stateCell = [tableView dequeueReusableCellWithIdentifier:@"StateCell" forIndexPath:indexPath];
                self.stateDescriptionTF = stateCell.stateDescriptionTF;
                stateCell.stateDescriptionTF.text = self.refundModel.problem;
                cell = stateCell;
            }
                break;
            case 2:
            {
                JXRefundImageUploadCell *imageUploadCell = [tableView dequeueReusableCellWithIdentifier:@"ImageUploadCell" forIndexPath:indexPath];
                imageUploadCell.contentLab.text = [self.viewModel contentWithIndexPath:indexPath];
                imageUploadCell.imagesArray = [self.imgArr mutableCopy];
                imageUploadCell.addPicturesBlock = ^(){
                    [weakSelf showActionForPhoto];
                };
                imageUploadCell.deleteImageBlock = ^(NSInteger index) {
                    [weakSelf.imgArr removeObjectAtIndex:index];
                    
                    [weakSelf.refundGoodsTab reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
                };
                cell = imageUploadCell;
            }
                break;

                
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            
            case 0:
            {
                JXRefundContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"RefundContentCell" forIndexPath:indexPath];
                contentCell.contentLab.text =  @" 联系人";
                self.userNameTF = contentCell.contentSubLab;
                contentCell.contentSubLab.text = self.refundModel.contacts ;
                cell = contentCell;
            }
                break;
            case 1:
            {
                JXRefundContentCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"RefundContentCell" forIndexPath:indexPath];
                contentCell.contentLab.text = @"联系电话";
                self.phoneNumTF = contentCell.contentSubLab;
                contentCell.contentSubLab.text = self.refundModel.mobilePhone;
                contentCell.contentSubLab.keyboardType = UIKeyboardTypePhonePad;
                cell = contentCell;
            }
                break;
                
            case 2:
            {
                JXRefundAddressCell *addressCell = [tableView dequeueReusableCellWithIdentifier:@"RefundAddressCell" forIndexPath:indexPath];
                addressCell.subLb.text = [YWDTools isNil:self.pickAddress] ? @"请选择取件地址" : self.pickAddress;
                cell = addressCell;
            }
                break;
                
            default:
                break;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        JXRefundHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"JXRefundHeaderView" owner:self options:nil].firstObject;
        headerView.frame = CGRectMake(0, 0, kScreenWidth, 117.);
        headerView.tipsTiltle.text = self.RefundTextModel.title;
        
        headerView.tipsTextLb.attributedText = [self.RefundTextModel.content attributedStringHTML] ;

        return headerView;
    }
    return [UIView new];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
      return UITableViewAutomaticDimension;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    WeakSelf;
    if (section == 1) {
        JXRefundFooterView *footerView = [[NSBundle mainBundle] loadNibNamed:@"JXRefundFooterView" owner:self options:nil].firstObject;
        footerView.frame = CGRectMake(0, 0, kScreenWidth, 126.);
        footerView.block = ^{
            [weakSelf upLoadRefundData];
        };
        return footerView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
       return 126;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakSelf;
    if (indexPath.section == 0 && indexPath.row == 0) {
        JXRefoundReasonPopView *ReasonPopView = [[NSBundle mainBundle] loadNibNamed:@"JXRefoundReasonPopView" owner:self options:nil][0];
        ReasonPopView.selectReasonBlock = ^(JXRefundReasonsDeatailModel *reasonModel, NSInteger reasonIndex) {
            if ([self.viewModel getRefundReasonsArray].count == 0) {
                [weakSelf getReundReasons];
                return ;
            }
            weakSelf.reasonModel = reasonModel;
            weakSelf.reasonID = reasonModel.ID;
            NSIndexPath *indexPath= [NSIndexPath indexPathForRow:0 inSection:0] ;
            [weakSelf.refundGoodsTab reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
        ReasonPopView.reasonID = self.reasonID;
        ReasonPopView.dataArray = [self.viewModel getRefundReasonsArray];
        [ReasonPopView registCell];
        [ReasonPopView.reasonTab reloadData];
        [YWDPopupControl popupView:ReasonPopView];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        JXRefundCashSelectAddressPage *refundCashSelectAddressPage = [[JXRefundCashSelectAddressPage alloc]init];
        refundCashSelectAddressPage.block = ^(NSString *pickAddress){
            weakSelf.pickAddress = pickAddress;
            NSIndexPath *indexPath= [NSIndexPath indexPathForRow:2 inSection:1] ;
            [weakSelf.refundGoodsTab reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
        };
        [self.navigationController pushViewController:refundCashSelectAddressPage animated:YES];
    }
}



# pragma lazy
- (UITableView *)refundGoodsTab{
    if (!_refundGoodsTab) {
        _refundGoodsTab = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundAddressCell" bundle:nil] forCellReuseIdentifier:@"RefundAddressCell"];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundStateCell" bundle:nil] forCellReuseIdentifier:@"StateCell"];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundContentCell" bundle:nil] forCellReuseIdentifier:@"RefundContentCell"];
        [_refundGoodsTab registerNib:[UINib nibWithNibName:@"JXRefundReasonCell" bundle:nil] forCellReuseIdentifier:@"RefundReasonCell"];
        [_refundGoodsTab registerClass:[JXRefundImageUploadCell class] forCellReuseIdentifier:@"ImageUploadCell"];

        _refundGoodsTab.delegate = self;
        _refundGoodsTab.dataSource = self;
//        _refundGoodsTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _refundGoodsTab.separatorColor = [UIColor colorWithHexString:@"E4E4E4"];
        _refundGoodsTab.layoutMargins = UIEdgeInsetsZero;
        _refundGoodsTab.separatorInset = UIEdgeInsetsZero;
        _refundGoodsTab.preservesSuperviewLayoutMargins = NO;
        _refundGoodsTab.showsVerticalScrollIndicator = NO;
    }
    return _refundGoodsTab;
}

- (JXRefundViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JXRefundViewModel alloc]init];
    }
    return _viewModel;
}

-(NSMutableArray *)imgArr
{
    if (!_imgArr) {
        _imgArr = [NSMutableArray array];
    }
    return _imgArr;
}

- (void)setRefundModel:(JXMyAfterSaleDetailModel *)refundModel{
    WeakSelf;
    _refundModel = refundModel;
    self.reasonModel = (JXRefundReasonsDeatailModel*)refundModel.reason;
    self.reasonID = (NSString*)refundModel.reason.ID;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSString *imageUrl in refundModel.images) {
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
            if (image != nil) {
               [self.imgArr addObject:image];
            }
            
        }
        dispatch_async(dispatch_get_main_queue(),^{
            
            [weakSelf.refundGoodsTab reloadData];
        });
    });
    self.pickAddress = refundModel.addressInfo;
}

//提交退货订单
-(void)upLoadRefundData{
    if ([YWDTools isNil:self.reasonModel.name]) {
        [YDBAlertView showToast:@"请选择退款/退货原因"];
        return;
    }
    if ([YWDTools isNil:self.stateDescriptionTF.text]) {
        [YDBAlertView showToast:@"请填写问题描述"];
        return;
    }
    if (self.stateDescriptionTF.text.length < 10) {
        [YDBAlertView showToast:@"问题描述最少10个字"];
        return;
    }
    if ([YWDTools isNil:self.userNameTF.text]) {
        [YDBAlertView showToast:@"请填写联系人"];
        return;
    }
    if ([YWDTools isNil:self.phoneNumTF.text]) {
        [YDBAlertView showToast:@"请填写联系电话"];
        return;
    }
    if ([YWDTools isNil:self.pickAddress]) {
        [YDBAlertView showToast:@"请选择取件地址"];
        return;
    }
    
    if (self.imgArr.count == 0) {
        [self netUpLoad];
    }else
    {
        [self uploadImgArr];
    }
    
    
    
    
}

-(void)uploadImgArr{
    
    dispatch_queue_t queue = dispatch_queue_create("uploadImg", NULL);
    
    __block NSInteger updateImageNumUp = 0;
    __block NSInteger updateImageNumDown = 0;
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<self.imgArr.count; i++) {
        dispatch_sync(queue, ^{
            [XYBestAllNet commonUploadImgWith:self.imgArr[i] resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
                if (error ==nil) {
                    updateImageNumUp ++;
                    
                    [arr addObject:[blockDictionary objectForKey:@"fileId"]];
                    if (updateImageNumUp == self.imgArr.count) {
//                        [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"图片全部上传成功" dismissTimeInterval:1.0];
                        [self dealWithImgArrID:arr];
                    }else{
                        
                        
                    }
                    
                    
                }else
                {
                    updateImageNumDown++;
                }
            }];
        });
    }
    
    
}

-(void)dealWithImgArrID:(NSMutableArray *)arr{
    
    self.imgStr = @"";
    for (NSInteger i=0; i<arr.count; i++) {
        
        if (i==0) {
            self.imgStr = [NSString stringWithFormat:@"%@",arr[i]];
        }
        if (i!=0 && i!= arr.count) {
            self.imgStr =[NSString stringWithFormat:@"%@,%@",self.imgStr,arr[i]];
            
        }
    }
    [self netUpLoad];
    
}

-(void)netUpLoad{
    WeakSelf;

    if (self.imgArr.count == 0) {
        
    }else
    {
        [self.viewModel.requestDic setObject:self.imgStr forKey:@"commentImg"];

    }
    [self.viewModel.requestDic setObject:self.reasonModel.ID forKey:@"id"];
    [self.viewModel.requestDic setObject:self.reasonModel.value forKey:@"value"];
    [self.viewModel.requestDic setObject:self.reasonModel.name forKey:@"name"];
    [self.viewModel.requestDic setObject:self.stateDescriptionTF.text forKey:@"problem"];
    [self.viewModel.requestDic setObject:self.userNameTF.text forKey:@"contacts"];
    [self.viewModel.requestDic setObject:self.phoneNumTF.text forKey:@"mobilePhone"];
    [self.viewModel.requestDic setObject:self.pickAddress forKey:@"addressInfo"];
    
    BOOL isFirstCommit = YES;
    if ([YWDTools isNil:self.refundModel.ID]) {
        isFirstCommit = YES;
        [self.viewModel.requestDic setObject:self.orderId forKey:@"orderId"];

    }else{
        isFirstCommit = NO;
        [self.viewModel.requestDic setObject:self.orderId forKey:@"orderRefundId"];
    }
    [self.viewModel upLoadRefundData:isFirstCommit Success:^(NSString *refundId) {
//        if (error == nil) {
        weakSelf.orderId = refundId;
//        [YDBAlertView showToast:@"提交成功" dismissDelay:1.0];
            if (weakSelf.refundCommitSuccessBlock) {
                weakSelf.refundCommitSuccessBlock();
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                JXMyAfterSaleDetailViewController *vc = [[JXMyAfterSaleDetailViewController alloc]init];
                vc.orderRefundID = weakSelf.orderId;
                vc.isRefundCashPage = YES;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            });
//        }
    } failed:^(NSString *errorMsg) {
        
    }];
    

}



//弹出选择框
-(void)showActionForPhoto
{
    if (self.imgArr.count == 9) {
        [XYProgressHUD svHUDShowStyle:XYHUDStyleInfo title:@"最多九张图片" dismissTimeInterval:1.0];
        return;
    }
    
    //选择图片时收起键盘
    [self.view endEditing:YES];
    
    XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
    [popView show];
    popView.delegate = self;
}

-(void)selectWayIndex:(NSInteger)index
{
    if (index == 0) {//选择照片
        
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.navigationBar.barTintColor = XYBlackColor;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.delegate = self;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
            
        }else
        {
            [YDBAlertView showToast:@"没有获取到相册权限，请到设置中重新设置" dismissDelay:1.0];
        }
        
        
        
    }else//拍照
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear] &&[UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.navigationBar.barTintColor = XYBlackColor;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
            
        }else
        {
            [YDBAlertView showToast:@"获取相机权限失败" dismissDelay:1.0];
            
        }
        
    }
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    [self.imgArr addObject:image];
        
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:2 inSection:0] ;
    [self.refundGoodsTab reloadRowAtIndexPath:indexPath withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
