//
//  UIButton+Tool.m
//  ARP
//
//  Created by liu_yakai on 2017/10/24.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UIButton+Tool.h"
#import "ARP.h"
#import <SDWebImage/UIButton+WebCache.h>

@implementation UIButton(Tool)

-(void)_initButton:(NSString *)title SetImageName:(NSString *)setImageName SelectImageName:(NSString *)selectImagename{
    [self setImage:SETIMAGENAME(setImageName) forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:RGBA(158,181,200, 1) forState:UIControlStateNormal];
    [self setImage:SETIMAGENAME(selectImagename) forState:UIControlStateSelected];
    [self setTitle:title forState:UIControlStateSelected];
    [self setTitleColor:RGBA(255,255,255, 1) forState:UIControlStateSelected];
    
}

-(void)SD_webImage:(NSString *)url DefaultImageName:(NSString *)defaultImageName{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] forState:(UIControlStateNormal) placeholderImage:SETIMAGENAME(defaultImageName) ];
}


@end
