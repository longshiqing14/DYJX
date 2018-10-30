//
//  XYUMSocialShareView.m
//  user
//
//  Created by xingyun on 2017/9/22.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYUMSocialShareView.h"

#import "XYUMSocialShareItemCVC.h"


#import <UMSocialCore/UMSocialCore.h>

#define XYShareSheetHeight (XYShareCellHeight+XYShareSheetBtnH+XYShareSheetTitleH)

@interface XYUMSocialShareView() <UITableViewDelegate, UITableViewDataSource ,XYUMSocialShareItemCVCDelegate>
{
@private
    NSString *_title;
    NSString *_cancelTitle;
    UIView   *_backgroundView;
}

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) XYUMSocialShareItemCVC * itemCVC;

@property (nonatomic, copy) NSString * shareContent;

@property (nonatomic, copy) NSString * shareTitle;
@property (nonatomic, copy) NSString * iconUrl;

@property (nonatomic, copy) NSString * shareUrl;
@end

@implementation XYUMSocialShareView

static CGFloat const XYShareSheetTitleH =   44;
static CGFloat const XYShareSheetBtnH =     44;
static CGFloat const XYShareCellHeight =    130;



- (instancetype)initWithTitle:(NSString *)title cancelButtonTitle:(NSString *)cancelButtonTitle shareContent:(NSString*)shareContent shareTitle:(NSString*)shareTitle iconUrl:(NSString*)iconUrl shareUrl:(NSString*)shareUrl
{
    if (!(self = super.init)) return nil;
    self.shareUrl = shareUrl;
    self.shareTitle = shareTitle;
    self.shareContent = shareContent;
    self.iconUrl = iconUrl;
    self.backgroundColor = XYRGBColor(190, 190, 190);
    
    if (title && title.length > 0) _title = title; else _title = @"分享";
//    if (delegate) self.delegate = delegate;
    if (cancelButtonTitle && cancelButtonTitle.length > 0) _cancelTitle = cancelButtonTitle; else _cancelTitle = @"取消";
    
    [self addSubview:self.tableView];
    
    return self;
}

// resetTableView.frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.tableView.frame = self.bounds;
}

#pragma mark -- getter

- (UITableView *)tableView
{
    if (_tableView) return _tableView;
    
    // 初始化tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 代理 && 数据源
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    // 透明背景
    _tableView.backgroundColor = [UIColor clearColor];
    // 禁止滑动
    _tableView.scrollEnabled = NO;
    // 注册缓存
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    // header
    _tableView.tableHeaderView = [self headerView];
    // footerView
    _tableView.tableFooterView = [self footerView];
    return _tableView;
}

// headerView
- (UILabel *)headerView
{
    UILabel *headerLabel        = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, XYShareSheetTitleH)];
    headerLabel.backgroundColor = XYWhiteColor;
    headerLabel.textAlignment   = NSTextAlignmentCenter;
    headerLabel.textColor       = XYFontTitleColor;
    headerLabel.font            = XYFont_16;
    headerLabel.text            = _title;
    return headerLabel;
}
// footerView
- (UIButton *)footerView
{
    UIButton *cancelBtn       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, XYScreenW, XYShareSheetBtnH)];
    cancelBtn.backgroundColor = XYWhiteColor;
    cancelBtn.titleLabel.font = XYFont_15;
    [cancelBtn setTitle:_cancelTitle forState:UIControlStateNormal];
    [cancelBtn setTitleColor:XYFontTitleColor forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    return cancelBtn;
}
#pragma mark - 懒加载
- (XYUMSocialShareItemCVC *)itemCVC
{
    if (_itemCVC == nil) {
        _itemCVC = [[XYUMSocialShareItemCVC alloc]init];
        
        _itemCVC.collectionView.frame = CGRectZero;
        _itemCVC.delegate = self;
        
    }
    return _itemCVC;
}



#pragma mark -- public
// 弹出
- (void)show
{
    UIWindow *window      = [UIApplication sharedApplication].keyWindow;
    _backgroundView       = [[UIView alloc] initWithFrame:window.bounds];
    _backgroundView.alpha = 0;
    _backgroundView.backgroundColor        = [UIColor blackColor];
    _backgroundView.userInteractionEnabled = YES;
    [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    [window addSubview:_backgroundView];
    
    self.frame = CGRectMake(0, window.bounds.size.height, window.bounds.size.width, XYShareSheetHeight);
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 0.5;
        self.frame = CGRectMake(0, window.bounds.size.height-XYShareSheetHeight, window.bounds.size.width, XYShareSheetHeight);
    }];
}

#pragma mark -- private
// 隐藏
- (void)hide
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect newRect   = self.frame;
    newRect.origin.y = window.bounds.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 0;
        self.frame = newRect;
    } completion:^(BOOL finished) {
        [_backgroundView removeFromSuperview];
        _backgroundView = nil;
        [self removeFromSuperview];
    }];
}


#pragma mark -- delegate

#pragma mark -- UITableViewDataSource && UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return XYShareCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.contentView addSubview:self.itemCVC.collectionView];
    
    [self.itemCVC.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.mas_equalTo(0);
    }];
    
    return cell;
}

#pragma mark - XYUMSocialShareItemCVCDelegate

- (void)XYUMSocialShareItemSelect:(NSString *)type
{
    if ([type intValue] == 1) {
        //微信
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.shareTitle  descr:self.shareContent thumImage:self.iconUrl];
        //设置网页地址
        shareObject.webpageUrl = self.shareUrl;
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        WeakSelf;
        [[UMSocialManager  defaultManager ]shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:[UIApplication sharedApplication].keyWindow.rootViewController completion:^(id result, NSError *error) {
            XYLog(@"result:%@",result);
            if (error == nil) {
                [weakSelf hide];
                
                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"分享成功" dismissTimeInterval:1.0];
                
            }
        }];
        
        
    }else if ([type intValue] == 2){
        //朋友圈
        
        
        
        //微信
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.shareTitle  descr:self.shareContent thumImage:self.iconUrl];
        //设置网页地址
        shareObject.webpageUrl = self.shareUrl;
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        WeakSelf;
        [[UMSocialManager  defaultManager ]shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:[UIApplication sharedApplication].keyWindow.rootViewController completion:^(id result, NSError *error) {
            XYLog(@"result:%@",result);
            if (error == nil) {
                [weakSelf hide];
                
                [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"分享成功" dismissTimeInterval:1.0];
                
            }
        }];
        
        
    }else if ([type intValue] == 3){
        
        if (self.shareUrl != nil) {
            //复制
            UIPasteboard *paste = [UIPasteboard generalPasteboard];
            paste.string = self.shareUrl;
            
            [XYProgressHUD svHUDShowStyle:XYHUDStyleSuccess title:@"已成功拷贝链接" dismissTimeInterval:1.0];
            
            [self hide];
        }

        
    }
    
    
}


@end
