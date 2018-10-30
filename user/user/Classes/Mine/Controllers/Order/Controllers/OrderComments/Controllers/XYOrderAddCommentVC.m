//
//  XYOrderAddCommentVC.m
//  user
//
//  Created by xingyun on 2017/9/28.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderAddCommentVC.h"

#import "XYOrderReAddCommentFirstCell.h"

#import "XYAddCommentImgCVCell.h"

#import "XYSelectIconPopView.h"
#import "XYBestAllNet.h"

#import "MyView.h"

#import "XYOrderCommentNet.h"

@interface XYOrderAddCommentVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,XYSelectIconPopViewDelegate,XYAddCommentImgCVCellDelegate,XYOrderReAddCommentFirstCellDelegate>
/** 表 */
@property(nonatomic,strong) UITableView *myTableView;

/** 图片 */
@property(strong,nonatomic) UICollectionView *photoCollectionView ;
/** 评价内容 */
@property(strong,nonatomic) MyView *textView ;

/** 添加图片按钮 */
@property(strong,nonatomic) UIButton *addPhotoBtn ;

@property(strong,nonatomic) NSMutableArray *imgArr ;
/** 图片提示 */
@property(strong,nonatomic) UIImageView *warnImgV ;
@property(strong,nonatomic) UILabel *warnLab ;
/** 提示**/
@property(strong,nonatomic) UILabel *textWarnLab ;

@property(assign,nonatomic) NSInteger starNum ;

@property(copy,nonatomic) NSString *imgStr ;

@end

static NSString *const XYOrderReAddCommentFirstCellID = @"XYOrderReAddCommentFirstCell";

static NSString *const UITableViewCellID = @"UITableViewCell";

static NSString *const XYAddCommentImgCVCellID = @"XYAddCommentImgCVCell";

@implementation XYOrderAddCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"评价晒单";
    
 
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    [self addNavRightBtn];
    self.starNum = 5;
}


-(void)addNavRightBtn{


    UIButton* rightBT= [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGSize size = [XYStringHandle sizeWithString:@"保存" font:XYFont_16 viewWidth:1000];
    rightBT.frame = CGRectMake(0, 0, size.width+3, 20);
    
    [rightBT setTitle:@"保存" forState:UIControlStateNormal];
    [rightBT setTitleColor:XYMainColor forState:UIControlStateNormal];
 
    rightBT.titleLabel.font = XYFont_16;
    [rightBT addTarget:self action:@selector(navRightBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBT];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightBar,nil];
}

-(void)navRightBtnHandler:(id)sender{

    
    if (self.starNum==0 ) {
        [YDBAlertView showToast:@"没有评价星级" dismissDelay:1.0];
        return;
    }
    
    if (self.textView.text.length<10) {
        [YDBAlertView showToast:@"评价内容要大于10个字哦" dismissDelay:1.0];
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
                        [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"图片全部上传成功" dismissTimeInterval:1.0];
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

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"comment"] = self.textView.text;
    param[@"commentImg"] =self.imgStr;
    param[@"orderId"] = self.dataModel.orderId;
    param[@"productId"] = self.dataModel.productId;
    param[@"skuId"] = self.dataModel.skuId;
    param[@"star"] = [NSNumber numberWithInteger:self.starNum];
    WeakSelf;
    [XYOrderCommentNet netUploadCommentWithParam:param resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
        if (error == nil) {
            [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"上传成功" dismissTimeInterval:1.0];
            if (self.successBlock) {
                self.successBlock();
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        }
    }];
}

#pragma mark -

-(CGFloat)collectWidth
{
    return (XYScreenW-20)/3;
}

-(CGFloat)collectHeight{

    return (XYScreenW-20)/3 +7;
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
        
        [_myTableView registerClass:[XYOrderReAddCommentFirstCell class] forCellReuseIdentifier:XYOrderReAddCommentFirstCellID];
        
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellID];
    }
    return _myTableView;
}


-(UICollectionView *)photoCollectionView
{
    if (!_photoCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        layout.headerReferenceSize = CGSizeMake(XYScreenW, 0);
        layout.footerReferenceSize = CGSizeMake(XYScreenW, 15);
//        layout.footerReferenceSize =
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        CGFloat width = [self collectWidth] ;
        CGFloat height = [self collectHeight];
        layout.itemSize  =CGSizeMake(width, height);
        _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _photoCollectionView.delegate = self;
        _photoCollectionView.dataSource = self;
        _photoCollectionView.showsHorizontalScrollIndicator = NO;
        _photoCollectionView.showsVerticalScrollIndicator = NO;
        
        [_photoCollectionView registerClass:[XYAddCommentImgCVCell class] forCellWithReuseIdentifier:XYAddCommentImgCVCellID];
        _photoCollectionView.backgroundColor = XYWhiteColor;
        _photoCollectionView.scrollEnabled = NO;
    }
    
    return _photoCollectionView;
}

-(UILabel *)textWarnLab
{
    if (!_textWarnLab) {
        _textWarnLab = [UILabel new];
        _textWarnLab.font = XYFont_10;
        _textWarnLab.textColor = XYGrayColor;
        _textWarnLab.textAlignment = NSTextAlignmentRight;
        _textWarnLab.text = @"至少10个字哦";
    }
    return _textWarnLab;
}

-(MyView *)textView
{

    if (!_textView) {
        _textView = [[MyView alloc] init];
        _textView.font = XYFont_14;
        _textView.textColor = XYFontTitleColor;
        _textView.delegate = self;
        _textView.scrollEnabled = NO;
        _textView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _textView.placeholder = @"给个评价吧，大家都等着你的使用心得呢";
    }
    return _textView;
}

-(UIButton *)addPhotoBtn
{
    if (!_addPhotoBtn) {
        _addPhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addPhotoBtn setImage:[UIImage imageNamed:@"order_comment_evaluate-icon-camera"] forState:UIControlStateNormal];
        [_addPhotoBtn setTitle:@"添加照片" forState:UIControlStateNormal];
        [_addPhotoBtn setTitleColor:XYGrayColor forState:UIControlStateNormal];
        _addPhotoBtn.titleLabel.font = XYFont_14;
        [_addPhotoBtn setBackgroundImage:[UIImage imageNamed:@"order_comment_evaluate-icon-sql"] forState:UIControlStateNormal];
        _addPhotoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_addPhotoBtn addTarget:self action:@selector(addPhotoBtnHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addPhotoBtn;
}

-(NSMutableArray *)imgArr
{
    if (!_imgArr) {
        _imgArr = [NSMutableArray array];
    }
    return _imgArr;
}

-(UIImageView *)warnImgV
{
    if (!_warnImgV) {
        _warnImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order_comment_evaluate-icon-hint"]];
        _warnLab = [UILabel new];
        _warnLab.text = @"带商品照片更\n容易获得赞哦!";
        _warnLab.numberOfLines = 2;
        _warnLab.font = XYFont_10;
        _warnLab.textColor = XYGrayColor;
        _warnLab.lineBreakMode = NSLineBreakByWordWrapping;
//        [warnLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.right.mas_equalTo(0);
//            make.left.mas_equalTo(10);
//        }];
        [_warnImgV addSubview:_warnLab];
    }
    return _warnImgV;
}


////
-(void)initButton:(UIButton*)btn{
    float  spacing = 5;//图片和文字的上下间距
    CGSize imageSize = btn.imageView.frame.size;
    CGSize titleSize = btn.titleLabel.frame.size;
    CGSize textSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    btn.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}


#pragma mark - 

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        XYOrderReAddCommentFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:XYOrderReAddCommentFirstCellID forIndexPath:indexPath];
        cell.delegate = self;
        [cell.iconImgView sd_setImageWithURL:[NSURL URLWithString:self.dataModel.logo]];
        return cell;
        
    }else if (indexPath.row == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-20);
        }];
        [cell.contentView addSubview:self.textWarnLab];
        [self.textWarnLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-9);
            make.height.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(10);
        }];
        
        return cell;
        
    }else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.photoCollectionView];
        [self.photoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(XY_Left_Margin);
            make.right.mas_equalTo(XY_Right_Margin);
        }];
        
        return cell;
        
        
    }

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return 82;
    }else if (indexPath.row == 1)
    {
        return 126;
    }else
    {
        return [self collectionViewH];
    }
    
}


-(CGFloat )collectionViewH{

    CGFloat cellH = [self collectHeight];
    
    if ((self.imgArr.count+1)%3 == 0) {
        
        CGFloat CH = (self.imgArr.count+1)/3 *cellH +15;
        return   CH ;
    }else
    {
        CGFloat CH =((self.imgArr.count+1)/3 +1) * cellH+15;
         return    CH;
    }

}


#pragma mark -

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
    
    return self.imgArr.count+1;

   
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYAddCommentImgCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XYAddCommentImgCVCellID forIndexPath:indexPath];

   
    cell.delegate = self;
    cell.index = indexPath;

    if (self.imgArr.count == indexPath.item ) {
        [cell.contentView addSubview:self.addPhotoBtn];
       
        [self.addPhotoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
        }];
        [cell layoutIfNeeded];
        [self initButton:_addPhotoBtn];

        cell.deleImgBtn.hidden = YES;
        cell.photoImgView.hidden = YES;
        
        
        if (self.imgArr.count == 0) {
            self.warnImgV.hidden = NO;
            self.warnLab.hidden = NO;
            [cell.contentView addSubview:self.warnImgV];
            [self.warnImgV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_addPhotoBtn.mas_right).offset(5);
                make.centerY.mas_equalTo(_addPhotoBtn.mas_centerY);
                make.width.mas_equalTo(84);
                make.height.mas_equalTo(37);
            }];
            [self.warnLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.top.bottom.mas_equalTo(0);
                make.left.mas_equalTo(10);
            }];
            
        }else
        {
            self.warnImgV.hidden = YES;
            self.warnLab.hidden = YES;
        }
    
        
    }else
    {
        cell.photoImgView.hidden = NO;
        cell.photoImgView.image = self.imgArr[indexPath.item];
        cell.deleImgBtn.hidden = NO;
    }
    
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == self.imgArr.count) {
        
        XYSelectIconPopView *popView = [[XYSelectIconPopView alloc] init];
        [popView show];
        popView.delegate = self;
    }

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

    [self.photoCollectionView reloadData];
    
    [self.myTableView reloadData];
}

-(void)addPhotoBtnHandler:(id)sender{

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
#pragma mark - del

-(void)deleBtnHandler:(NSIndexPath *)index
{
    [self.imgArr removeObjectAtIndex:index.row];
    [self.photoCollectionView reloadData];
    [self.myTableView reloadData];

}


-(void)uploadImgReturnWithImg:(UIImage *)image{
//    WeakSelf;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [XYBestAllNet  commonUploadImgWith:image resultBlock:^(NSDictionary *blockDictionary, NSError *error) {
            if (error == nil) {
                NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
                param[@"logoFileId"] = blockDictionary[@"fileId"];
                
                
                
            }
        }];
    });
    

}

-(void)numOfStar:(NSInteger)num
{
    self.starNum = num;
}


@end
