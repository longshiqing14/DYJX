//
//  NIMSessionImageContentView.m
//  NIMKit
//
//  Created by chris on 15/1/28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NIMSessionImageContentView.h"
#import "NIMMessageModel.h"
#import "UIView+NIM.h"
#import "NIMLoadProgressView.h"
#import "IMSDK.h"
#import "JSExtension.h"
#import "UIImage+fixOrientation.h"

@interface NIMSessionImageContentView()

@property (nonatomic,strong,readwrite) UIImageView * imageView;

@property (nonatomic,strong) NIMLoadProgressView * progressView;

@end

@implementation NIMSessionImageContentView

- (instancetype)initSessionMessageContentView{
    self = [super initSessionMessageContentView];
    if (self) {
        self.opaque = YES;
        _imageView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor blackColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        _progressView = [[NIMLoadProgressView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        _progressView.maxProgress = 1.0f;
//        self.bubbleImageView.hidden = YES;
        [self addSubview:_progressView];

        _imageView.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchUpInside:)]];
//        [_imageView addGestureRecognizer:];
    }
    return self;
}

- (void)refresh:(NIMMessageModel *)data
{
    [super refresh:data];
    NIMImageObject * imageObject = (NIMImageObject*)self.model.message.messageObject;
//    UIImage * image              = [UIImage imageWithContentsOfFile:imageObject.thumbPath];
//    self.imageView.image         = image;
    if (self.model.message.isMySend) {
        self.progressView.hidden = NO;
        if ([self.model.message.content isKindOfClass:[RCImageMessage class]]) {
            RCImageMessage *textMessage = (RCImageMessage *)self.model.message.content;
            if (self.model.message.image) {
                self.imageView.image = self.model.message.image.fixOrientation;
            }
            else if (textMessage.imageUrl.length) {
                NSData *data = [NSData dataWithContentsOfFile:self.model.message.LocalPath];
                if (data) {
                    self.imageView.image = [UIImage imageWithData:data].fixOrientation;
                }
                else {
                    self.imageView.image = [UIImage imageNamed:@"dyjx_default_img"];
                }
            }
            else {
                if (self.model.message.image) {
                    self.imageView.image = self.model.message.image.fixOrientation;
                }
                
               if ([[DataBaseManager shared] findModel:self.model.message identifyId:[JSExtension shared].myIdentityId conversionId:[JSExtension shared].conversionId]) {
                    [self.progressView setProgress:1];
                }
                else {
                    // 网络请求，上传图片并保存到数据库
                    [[IMSDK sharedManager].chatManager uploadFile:self.model.message.image model:self.model.message progress:^(NSProgress * _Nonnull progress) {
                        [self.progressView setProgress:progress.fractionCompleted];
                    } Success:^(id  _Nullable responseObject) {
                    } failed:^(NSString * _Nonnull errorMsg) {
                    }];
                }
            }
        }

    }
    else {
        NSData *data = [NSData dataWithContentsOfFile:self.model.message.LocalPath];
        if (data) {
            self.imageView.image = [UIImage imageWithData:data];
        }
        else {
            self.imageView.image = [UIImage imageNamed:@"dyjx_default_img"];
        }
//        self.imageView.image =
//        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageObject.url] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"]];
        self.progressView.hidden = YES;
    }

//    self.progressView.hidden     = self.model.message.isOutgoingMsg ? (self.model.message.deliveryState != NIMMessageDeliveryStateDelivering) : (self.model.message.attachmentDownloadState != NIMMessageAttachmentDownloadStateDownloading);
//    if (!self.progressView.hidden) {
//        [self.progressView setProgress:[[[NIMSDK sharedSDK] chatManager] messageTransportProgress:self.model.message]];
//    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentSize = [self.model contentSize:tableViewWidth];
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentSize.width, contentSize.height);
    self.imageView.frame  = imageViewFrame;
    _progressView.frame   = self.bounds;
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.cornerRadius = 13.0;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.frame = self.imageView.bounds;
    self.imageView.layer.mask = maskLayer;
}


- (void)onTouchUpInside:(id)sender
{
    NIMKitEvent *event = [[NIMKitEvent alloc] init];
    event.eventName = NIMKitEventNameTapContent;
    event.messageModel = self.model;
    [self.delegate onCatchEvent:event];
}

- (void)updateProgress:(float)progress
{
    if (progress > 1.0) {
        progress = 1.0;
    }
    self.progressView.progress = progress;
}

@end
