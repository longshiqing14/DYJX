//
//  UIImageView+Tool.m
//  ARP
//
//  Created by liu_yakai on 2017/10/27.
//  Copyright © 2017年 liu_yakai. All rights reserved.
//

#import "UIImageView+Tool.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView(Tool)

-(void)SD_webImage:(NSString *)url DefaultImageName:(NSString *)defaultImageName{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:defaultImageName]];
    
    
}

@end
