//
//  NSObject+AVPhotoLibraryAuthorization.m
//  user
//
//  Created by YP on 2018/6/11.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "NSObject+AVPhotoLibraryAuthorization.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/PHPhotoLibrary.h>
#import <objc/runtime.h>

static const void *UICameraImageBlockKey = &UICameraImageBlockKey;

@implementation NSObject (AVPhotoLibraryAuthorization)

-(void)cameraImageHandler:(CameraImageBlock)cameraImageBlock {
    objc_setAssociatedObject(self, UICameraImageBlockKey, cameraImageBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark 调取设备摄像头

- (void)presentCameraPickerControllerCameraImageBlock:(CameraImageBlock)cameraImageBlock {
    [self cameraImageHandler:cameraImageBlock];
    __weak typeof (self)weakSelf = self;
    [self requestCameraAuthorizationWithCompletion:^{
        [weakSelf presentCameraPickerController];
    }];
}

- (void)presentCameraPickerController {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([self isRearCameraAvailable]) {
        controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    controller.mediaTypes = mediaTypes;
    controller.delegate = self;
    [[self getCurrentVC] presentViewController:controller
                       animated:YES
                     completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    __weak typeof (self)weakSelf = self;
    [picker
     dismissViewControllerAnimated:YES
     completion:^() {
         UIImage *portraitImg = [info
                                 objectForKey:
                                 @"UIImagePickerControllerOriginalImage"];
         portraitImg = [portraitImg fixOrientation];
         CameraImageBlock block = objc_getAssociatedObject(weakSelf, UICameraImageBlockKey);
         if (block) {
             block(portraitImg);
         }
     }];
}

#pragma mark 调取相册
#ifdef isExistenceHBCustomerHelper
- (void)chooseImagesPhotosHandler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler {
    
    [self chooseImagesWithMaxImagesCount:9 photosHandler:photosHandler];
}

- (void)chooseImagesWithMaxImagesCount:(NSInteger)maxImagesCount photosHandler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler {
    __weak typeof (self)weakSelf = self;
    [self requestAuthorizationWithCompletion:^{
        TZImagePickerController *imagePickerVC = [weakSelf establishImagePickerVCWithMaxImagesCount:maxImagesCount];
        [imagePickerVC setDidFinishPickingPhotosHandle:photosHandler];
        [[self getCurrentVC] presentViewController:imagePickerVC animated:YES completion:nil];
    }];
}

- (void)chooseImagesPhotosSelectedAssets:(NSMutableArray *)selectedAssets Handler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler {
    [self chooseImagesMaxImagesCount:9 photosSelectedAssets:selectedAssets Handler:photosHandler];
}

- (void)chooseImagesMaxImagesCount:(NSInteger)maxImagesCount photosSelectedAssets:(NSMutableArray *)selectedAssets Handler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler {
    __weak typeof (self)weakSelf = self;
    [self requestAuthorizationWithCompletion:^{
        TZImagePickerController *imagePickerVC = [weakSelf establishImagePickerVCWithMaxImagesCount:maxImagesCount];
        imagePickerVC.selectedAssets = selectedAssets;
        [imagePickerVC setDidFinishPickingPhotosHandle:photosHandler];
        [[self getCurrentVC] presentViewController:imagePickerVC animated:YES completion:nil];
    }];
}

- (void)presentAlbumPickerControllerCompletion:(void (^)(UIImage *image))completion {
    __weak typeof (self)weakSelf = self;
    [self requestAuthorizationWithCompletion:^{
        TZImagePickerController *imagePickerVC = [weakSelf establishImagePickerVCWithMaxImagesCount:1];
        [imagePickerVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            completion(photos[0]);
        }];
        [[self getCurrentVC] presentViewController:imagePickerVC animated:YES completion:nil];
    }];
}

-(TZImagePickerController *)establishImagePickerVCWithMaxImagesCount:(NSInteger)maxImagesCount {
    TZImagePickerController *imagePickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:maxImagesCount columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
    
    // 设置imagePickerVC 外观
    imagePickerVC.navigationBar.barTintColor = [UIColor whiteColor];//[UIColor colorWithHexString:@"#ed1b24"];
    imagePickerVC.navigationBar.tintColor = [UIColor whiteColor];//[UIColor colorWithHexString:@"#ed1b24"];
    [imagePickerVC.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:(34/255.0) green:(34/255.0)  blue:(34/255.0) alpha:1.0]] forBarMetrics:(UIBarMetricsDefault)];
    imagePickerVC.oKButtonTitleColorDisabled = [UIColor whiteColor];
    imagePickerVC.oKButtonTitleColorNormal = [UIColor greenColor];
    imagePickerVC.navigationBar.translucent = NO;
    
    imagePickerVC.allowTakePicture = NO;
//    imagePickerVC.allowTakeVideo = NO;
    imagePickerVC.allowPreview = YES;
    imagePickerVC.allowPickingVideo = NO;
    imagePickerVC.allowPickingGif = NO;
    imagePickerVC.allowPickingImage = YES;
    imagePickerVC.allowPickingOriginalPhoto = YES;
    
    imagePickerVC.sortAscendingByModificationDate = YES;
    
    imagePickerVC.showSelectBtn = YES;
    imagePickerVC.allowCrop = NO;
    imagePickerVC.needCircleCrop = NO;
    imagePickerVC.circleCropRadius = 100;
    return imagePickerVC;
}
#endif

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES
                               completion:^(){
                               }];
}

- (BOOL)isPhotoLibraryAvailable {
    return [UIImagePickerController
            isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (NSInteger)authorizationStatus {
    if (iOS8Later) {
        return [PHPhotoLibrary authorizationStatus];
    } else {
        return [ALAssetsLibrary authorizationStatus];
    }
    return NO;
}

#pragma mark 麦克风授权
- (void)requestAuthorizationWithMicrophoneCompletion:(void (^)(void))completion {
    void (^callCompletionBlock)(void) = ^(){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
    };
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (videoAuthStatus == AVAuthorizationStatusNotDetermined) {// 未询问用户是否授权
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
            if (granted){// 用户同意授权
                dispatch_async(dispatch_get_main_queue(), ^{
                    callCompletionBlock();
                });
            }else {// 用户拒绝授权
                [self jumpSystemOpenAlbumAuthorizationTitle:@"麦克风权限未开启" message:@"请在iPhone的""设置-隐私-麦克风""中打开开关,开启麦克风功能"];
            }
        }];
    }else if(videoAuthStatus == AVAuthorizationStatusRestricted || videoAuthStatus == AVAuthorizationStatusDenied) {// 未授权
        [self jumpSystemOpenAlbumAuthorizationTitle:@"麦克风权限未开启" message:@"请在iPhone的""设置-隐私-麦克风""中打开开关,开启麦克风功能"];
    }else{// 已授权
        dispatch_async(dispatch_get_main_queue(), ^{
            callCompletionBlock();
        });
    }
}

#pragma mark 调取设备相册
- (void)requestAuthorizationWithCompletion:(void (^)(void))completion {
    void (^callCompletionBlock)(void) = ^(){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
    };
    
    if ([self isPhotoLibraryAvailable]) {
        // 判断授权状态
        if (iOS8Later) {
           PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
            if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                    if (status == PHAuthorizationStatusAuthorized) {
                        callCompletionBlock();
                    }else if (status == PHAuthorizationStatusDenied){ //第一次用户拒绝
                        [self jumpSystemOpenAlbumAuthorizationTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册"];
                    }
                }];
            }else {
                if (status == PHAuthorizationStatusAuthorized) { // 授权成功
                   callCompletionBlock();
                }else if (status == PHAuthorizationStatusDenied) { // 用户拒绝
                    [self jumpSystemOpenAlbumAuthorizationTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册"];
                }else {
                    NSLog(@"因为系统原因, 无法访问相册");
                }
            }
        }else {
           ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
            if (status == ALAuthorizationStatusNotDetermined) {
                ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
                [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                    callCompletionBlock();
                } failureBlock:^(NSError *error) { //第一次用户拒绝
//                    callCompletionBlock();
                    [self jumpSystemOpenAlbumAuthorizationTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册"];
                }];
            }else {
                if (status == ALAuthorizationStatusAuthorized) { // 授权成功
                   callCompletionBlock();
                }else if (status == ALAuthorizationStatusDenied) { // 用户拒绝
                    [self jumpSystemOpenAlbumAuthorizationTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册"];
                }else {
                    NSLog(@"因为系统原因, 无法访问相册");
                }
            }
        }
    }
}

- (void)jumpSystemOpenAlbumAuthorizationTitle:(NSString *)title message:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *actionDefault = [UIAlertAction actionWithTitle:@"去设置" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (iOS8Later) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
//            NSURL *privacyUrl;
//            privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
//            if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
//                [[UIApplication sharedApplication] openURL:privacyUrl];
//            } else {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
//            }
        }
    }];
    UIAlertAction *actionCance = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:actionCance];
    [alert addAction:actionDefault];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

#pragma mark 调取设备摄像头
- (void)requestCameraAuthorizationWithCompletion:(void (^)(void))completion{
    void (^callCompletionBlock)(void) = ^(){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
    };
    //获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    __weak typeof (self)weakSelf= self;
    if (device) {
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (status == AVAuthorizationStatusNotDetermined) {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {//第一次允许访问
                        dispatch_async(dispatch_get_main_queue(), ^{
                            callCompletionBlock();
                        });
                    }else{
                        //第一次拒绝访问
                        [weakSelf jumpSystemOpenCameraAuthorization];
                    }
                }];
            }else if (status == AVAuthorizationStatusAuthorized){// 用户允许当前应用访问相机
                callCompletionBlock();
            }else if (status == AVAuthorizationStatusDenied) {
                // 用户拒绝当前应用访问相机
                [weakSelf jumpSystemOpenCameraAuthorization];
            } else if (status == AVAuthorizationStatusRestricted) {
                NSLog(@"因为系统原因, 无法访问相机");
            }
        }
    }else{
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];

    }
}

- (void)jumpSystemOpenCameraAuthorization {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法访问相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *actionDefault = [UIAlertAction actionWithTitle:@"去设置" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if (iOS8Later) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
//            NSURL *privacyUrl;
//            privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
//            if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
//                [[UIApplication sharedApplication] openURL:privacyUrl];
//            } else {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
//            }
        }
    }];
    UIAlertAction *actionCance = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:actionCance];
    [alert addAction:actionDefault];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

#pragma mark camera utility
- (BOOL)isCameraAvailable {
    return [UIImagePickerController
            isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL)isRearCameraAvailable {
    return [UIImagePickerController
            isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL)isFrontCameraAvailable {
    return [UIImagePickerController
            isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL)doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
                          sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL)canUserPickVideosFromPhotoLibrary {
    return
    [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
                   sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL)canUserPickPhotosFromPhotoLibrary {
    return
    [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
                   sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL)cameraSupportsMedia:(NSString *)paramMediaType
                 sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController
                                    availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes
     enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
         NSString *mediaType = (NSString *)obj;
         if ([mediaType isEqualToString:paramMediaType]) {
             result = YES;
             *stop = YES;
         }
     }];
    return result;
}



//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}
@end
