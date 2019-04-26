//
//  NSObject+AVPhotoLibraryAuthorization.h
//  user
//
//  Created by YP on 2018/6/11.
//  Copyright © 2019年 xiaopenglive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/PHPhotoLibrary.h>
#import <AssetsLibrary/AssetsLibrary.h>

#define KHBCustomerHelper [[NSClassFromString(@"TZImagePickerController") alloc] init]
#define isExistenceHBCustomerHelper ((KHBCustomerHelper != nil) ? YES : NO)

#ifdef isExistenceHBCustomerHelper
#import <TZImagePickerController.h>
#endif

#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

typedef void (^CameraImageBlock)(UIImage *image);

@interface NSObject (AVPhotoLibraryAuthorization)<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (void)cameraImageHandler:(CameraImageBlock)cameraImageBlock;

#pragma mark 麦克风授权
- (void)requestAuthorizationWithMicrophoneCompletion:(void (^)(void))completion;

// 相册授权
- (void)requestAuthorizationWithCompletion:(void (^)(void))completion;

// 相机授权
- (void)requestCameraAuthorizationWithCompletion:(void (^)(void))completion;

// 授权并打开相机
- (void)presentCameraPickerControllerCameraImageBlock:(CameraImageBlock)cameraImageBlock;

// 授权并打开相册(多图)(没有设置目前已经选中的图片数组)（默认9张）
- (void)chooseImagesPhotosHandler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler;

// 授权并打开相册(多图)(没有设置目前已经选中的图片数组)（自己设置最大张数）
- (void)chooseImagesWithMaxImagesCount:(NSInteger)maxImagesCount photosHandler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler;

// 授权并打开相册(多图)(设置目前已经选中的图片数组)（默认9张）
- (void)chooseImagesPhotosSelectedAssets:(NSMutableArray *)selectedAssets Handler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler;

// 授权并打开相册(多图)(设置目前已经选中的图片数组)（自己设置最大张数
- (void)chooseImagesMaxImagesCount:(NSInteger)maxImagesCount photosSelectedAssets:(NSMutableArray *)selectedAssets Handler:(void (^)(NSArray<UIImage *> *photos,NSArray *assets,BOOL isSelectOrinalPhoto))photosHandler;

// 授权并打开相册(单图)
- (void)presentAlbumPickerControllerCompletion:(void (^)(UIImage *image))completion;

-(TZImagePickerController *)establishImagePickerVCWithMaxImagesCount:(NSInteger)maxImagesCount;

// 是否是前置摄像头
- (BOOL)isFrontCameraAvailable;

// 是否是后置摄像头
- (BOOL)isRearCameraAvailable;

@end
