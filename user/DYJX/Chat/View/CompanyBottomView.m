//
//  CompanyBottomView.m
//  user
//
//  Created by 岩  熊 on 2018/12/3.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "CompanyBottomView.h"

@implementation CompanyBottomView

- (IBAction)enterConversion:(UIButton *)sender {
    if (self.enterConversionBlock) {
        self.enterConversionBlock();
    }
}

- (IBAction)exitCompany:(UIButton *)sender {
    if (self.exitCompanyBlock) {
        self.exitCompanyBlock();
    }
}

@end
