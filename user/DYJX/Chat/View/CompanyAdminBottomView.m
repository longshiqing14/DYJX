//
//  CompanyAdminBottomView.m
//  user
//
//  Created by 岩  熊 on 2018/12/4.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "CompanyAdminBottomView.h"

@implementation CompanyAdminBottomView


- (IBAction)enterConversion:(UIButton *)sender {
    if (self.enterConversionBlock) {
        self.enterConversionBlock();
    }
}

- (IBAction)deleteCompany:(UIButton *)sender {
    if (self.deleteCompanyBlock) {
        self.deleteCompanyBlock();
    }
}

- (IBAction)exitCompany:(UIButton *)sender {
    if (self.exitCompanyBlock) {
        self.exitCompanyBlock();
    }
}

@end
