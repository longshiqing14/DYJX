//
//  JXSpecialOfferView1.m
//  user
//
//  Created by liu_yakai on 2018/1/31.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXSpecialOfferView1.h"

@implementation JXSpecialOfferView1

-(void)cell_init:(XYShopingCartPromotionsModel *)model {
    self.cellTypeLb.text=model.name;
    self.cellPriceLB.text=[NSString stringWithFormat:@"-￥%@",model.discount];
}

@end
