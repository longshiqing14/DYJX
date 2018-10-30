//
//  AreaView.h
//  Shihanbainian
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 Codeliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressAreaModel.h"


@protocol AreaSelectDelegate <NSObject>

- (void)selectIndex:(NSInteger)index selectID:(NSString *)areaID;

- (void)getSelectAddressInfor:(NSString *)addressInfor ProvinceModel:(AddressAreaModel *)provinceModel CityModel:(AddressAreaModel *)cityModel;
@end
@interface AreaView : UIView<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIScrollView *areaScrollView;
@property(nonatomic,strong)UIView *areaWhiteBaseView;
@property(nonatomic,strong)NSMutableArray *provinceArray;
@property(nonatomic,strong)NSMutableArray *cityArray;
@property(nonatomic,strong)NSMutableArray *regionsArray;
@property(nonatomic,strong)id <AreaSelectDelegate> address_delegate;
@property(nonatomic,strong)NSMutableArray *selectCityArray;
- (void)showAreaView;
- (void)hidenAreaView;

@end
