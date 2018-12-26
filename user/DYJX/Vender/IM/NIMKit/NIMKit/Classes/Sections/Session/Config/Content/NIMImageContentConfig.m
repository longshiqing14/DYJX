//
//  NIMImageContentConfig.m
//  NIMKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import "NIMImageContentConfig.h"
#import "UIImage+NIMKit.h"
#import "NIMKit.h"

@implementation NIMImageContentConfig
- (CGSize)contentSize:(CGFloat)cellWidth message:(RCIMMessage *)message
{
    
    NIMImageObject *imageObject = (NIMImageObject*)[message messageObject];
    NSAssert([imageObject isKindOfClass:[NIMImageObject class]], @"message should be image");
    
    CGFloat attachmentImageMinWidth  = (cellWidth / 4.0);
    CGFloat attachmentImageMinHeight = (cellWidth / 4.0);
    CGFloat attachmemtImageMaxWidth  = (cellWidth - 184);
    CGFloat attachmentImageMaxHeight = (cellWidth - 184);

    UIImage *image = message.image;
    if (!image) {
        image = [UIImage imageNamed:@"dyjx_default_img"];
    }
    imageObject.size = image.size;

    CGSize imageSize;
    if (!CGSizeEqualToSize(imageObject.size, CGSizeZero)) {
        imageSize = imageObject.size;
    }
    else
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageObject.url] placeholderImage:[UIImage imageNamed:@"dyjx_default_img"] options:SDWebImageRetryFailed];
//        UIImage *image = [UIImage imageWithContentsOfFile:imageObject.thumbPath];
        imageSize = imageView.image ? imageView.image.size : CGSizeZero;
    }
    CGSize contentSize = [UIImage nim_sizeWithImageOriginSize:imageSize
                                                   minSize:CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight)
                                                   maxSize:CGSizeMake(attachmemtImageMaxWidth, attachmentImageMaxHeight )];
    return contentSize;
}

- (NSString *)cellContent:(NIMMessage *)message
{
    return @"NIMSessionImageContentView";
}

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
{
    return [[NIMKit sharedKit].config setting:message].contentInsets;
}



@end
