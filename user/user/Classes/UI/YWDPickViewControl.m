//
//  YWDPickViewControl.m
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/16.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDPickViewControl.h"
#import "YWDPopupControl.h"

static NSInteger const kYWDPickViewAreaLevel1 = 1;
static NSInteger const kYWDPickViewAreaLevel2 = 2;
static NSInteger const kYWDPickViewAreaLevel3 = 3;
static YWDPickViewControl *__currentPickViewControl = nil;
@interface YWDPickViewControl ()

@property(nonatomic) NSArray<YWDListItem *> *data_level1;
@property(nonatomic) NSArray<YWDListItem *> *data_level2;
@property(nonatomic) NSArray<YWDListItem *> *data_level3;


@property(nonatomic,strong) YWDPickViewControl *currentPickView;



@end
@implementation YWDPickViewControl
{
    NSArray<YWDListItem *> *_data;
    UIPickerView *_mPickerView;
}

-(instancetype)initWithTitle:(NSString *)title Texts:(NSArray<NSString *> *)texts withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:texts.count];
    for (NSString *txt in texts) {
        [items addObject:[YWDListItem itemWithText:txt commonId:nil entity:nil]];
    }
    return [self initWithTitle:title data:items withActionHandler:actionHandler];
}

-(instancetype)initWithTitle:(NSString *)title data:(NSArray *)data withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    if (self = [super init]) {
        
        _data = data;
        _actionHandler = actionHandler;
        _pickViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 260)];
        _pickViewContainer.backgroundColor = [UIColor whiteColor];
        
        _mPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, _pickViewContainer.width, 216.0f)];
        _mPickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _mPickerView.showsSelectionIndicator = YES;
        _mPickerView.dataSource = self;
        _mPickerView.delegate = self;
        [_mPickerView selectRow:0 inComponent:0 animated:NO];
        [_pickViewContainer addSubview:_mPickerView];
        [_mPickerView.po_frameBuilder alignToBottomInSuperviewWithInset:0];
        
        UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, _pickViewContainer.width, 44)];
        pickerToolbar.barStyle = UIBarStyleBlackOpaque;
        [pickerToolbar sizeToFit];
        
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        
        {
            UIBarButtonItem *marginItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
            marginItem.width = 10;
            [barItems addObject:marginItem];
        }
        
        UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(toolBarCancelClick)];
        cancelBtn.tintColor = [UIColor whiteColor];
        [barItems addObject:cancelBtn];
        
        {
            UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            [barItems addObject:flexSpace];
        }
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 600, 23)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        //        label.shadowColor = ColorFromHex(@"0xe5e7eb");
        label.shadowOffset = CGSizeMake(0, 1);
        label.textColor = [UIColor whiteColor];
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:20.0];
        [label sizeToFit];
        UIBarButtonItem *toolBarTitle = [[UIBarButtonItem alloc] initWithCustomView:label];
        
        [barItems addObject:toolBarTitle];
        
        {
            UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            [barItems addObject:flexSpace];
        }
        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(toolBarDoneClick)];
        doneBtn.tintColor = [UIColor whiteColor];
        [barItems addObject:doneBtn];
        
        {
            UIBarButtonItem *marginItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
            marginItem.width = 10;
            [barItems addObject:marginItem];
        }
        
        [pickerToolbar setItems:barItems animated:YES];
        [_pickViewContainer addSubview:pickerToolbar];
    }
    return self;
}

+(instancetype)addressLevel1PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:arrayFromAreaJson(kYWDPickViewAreaLevel1) withActionHandler:actionHandler];
    return pickControl;
}

+(instancetype)addressLevel2PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:arrayFromAreaJson(kYWDPickViewAreaLevel2) withActionHandler:actionHandler];
    return pickControl;
}

+(instancetype)addressLevel3PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:arrayFromAreaJson(kYWDPickViewAreaLevel3) withActionHandler:actionHandler];
    return pickControl;
}

+(instancetype)addressLevel2PickHaveAllView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:arrayFromAreaJsonHaveAll(kYWDPickViewAreaLevel2,YES) withActionHandler:actionHandler];
    return pickControl;
}

+(instancetype)addressLevel3HaveAllPickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:arrayFromAreaJsonHaveAll(kYWDPickViewAreaLevel3,YES) withActionHandler:actionHandler];
    return pickControl;
}

+(instancetype)sexLevel1PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    YWDListItem *mItem = [[YWDListItem alloc] init];
    mItem.text = @"男";
    mItem.commonId = @"1";
    
    YWDListItem *fItem = [[YWDListItem alloc] init];
    fItem.text = @"女";
    fItem.commonId = @"2";
    
    YWDListItem *sItem = [[YWDListItem alloc] init];
    sItem.text = @"保密";
    sItem.commonId = @"3";
    YWDPickViewControl *pickControl = [[YWDPickViewControl alloc] initWithTitle:title data:@[mItem,fItem,sItem] withActionHandler:actionHandler];
    return pickControl;
}


+(YWDPickViewControl *)showSexPickView:(NSString *)title withActionHandler:(void (^)(YWDListViewActionName, YWDListItem *))actionHandler
{
    YWDListItem *mItem = [[YWDListItem alloc] init];
    mItem.text = @"男";
    mItem.commonId = @"1";
    
    YWDListItem *fItem = [[YWDListItem alloc] init];
    fItem.text = @"女";
    fItem.commonId = @"2";
    
    YWDListItem *sItem = [[YWDListItem alloc] init];
    sItem.text = @"保密";
    sItem.commonId = @"3";
    
    return [self showPickViewWithData:@[mItem,fItem,sItem] title:title withActionHandler:actionHandler];
}

+(YWDPickViewControl *)showPickViewWithTexts:(NSArray<NSString *> *)texts title:(NSString *)title withActionHandler:(void (^)(YWDListViewActionName, YWDListItem *))actionHandler
{
    NSMutableArray<YWDListItem *> *items = [NSMutableArray arrayWithCapacity:texts.count];
    [texts enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YWDListItem *item = [[YWDListItem alloc] init];
        item.text = obj;
        [items addObject:item];
    }];
    return [self showPickViewWithData:items title:title withActionHandler:actionHandler];
}

static inline NSArray * arrayFromAreaJson(NSInteger level)
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Area" ofType:@"json"];
    NSData *txtContent = [NSData dataWithContentsOfFile:path];
    NSArray<NSDictionary *> *addressList = [NSJSONSerialization JSONObjectWithData:txtContent options:NSJSONReadingMutableContainers error:nil];
    
    YWDListItem *(^itemFromDic)(NSDictionary *data) = ^(NSDictionary *data) {
        
        YWDListItem *item = [[YWDListItem alloc] init];;
        item.text = data[@"name"];
        item.commonId = data[@"code"];
        item.entity = data;
        return item;
    };
    NSMutableArray<YWDListItem *> *data = [NSMutableArray arrayWithCapacity:3];
    [addressList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YWDListItem<NSDictionary *> *p1 = itemFromDic(obj);
        p1.text = obj[@"name"];
        p1.entity = obj;
        NSArray *cities = obj[@"cities"];
        [data addObject:p1];
        if (level > kYWDPickViewAreaLevel1) {
            NSMutableArray *citiesItems = [[NSMutableArray alloc] initWithCapacity:cities.count];
            [cities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                YWDListItem *cityItem = itemFromDic(obj);
                [citiesItems addObject:cityItem];
                NSArray *district = obj[@"district"];
                cityItem.superItem = p1;
                NSMutableArray *districtItems = [NSMutableArray arrayWithCapacity:district.count];
                if (level > kYWDPickViewAreaLevel2) {
                    [district enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        YWDListItem *disItem = itemFromDic(obj);
                        disItem.superItem = cityItem;
                        [districtItems addObject:disItem];
                    }];
                    cityItem.subItems = districtItems;
                }
            }];
            p1.subItems = citiesItems;
        }
    }];
    return data;
}

static inline NSArray * arrayFromAreaJsonHaveAll(NSInteger level,bool haveAll)
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Area" ofType:@"json"];
    NSData *txtContent = [NSData dataWithContentsOfFile:path];
    NSArray<NSDictionary *> *addressList = [NSJSONSerialization JSONObjectWithData:txtContent options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *allDic = @{@"name":@"全部",@"code":@(kAllValue)};
    YWDListItem *(^itemFromDic)(NSDictionary *data) = ^(NSDictionary *data) {
        
        YWDListItem *item = [[YWDListItem alloc] init];;
        item.text = data[@"name"];
        item.commonId = data[@"code"];
        item.entity = data;
        return item;
    };
    NSMutableArray<YWDListItem *> *data = [NSMutableArray arrayWithCapacity:3];
    YWDListItem *level1AllItem = itemFromDic(allDic);
    if (haveAll) {
        [data addObject:level1AllItem];
    }
    [addressList enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YWDListItem<NSDictionary *> *p1 = itemFromDic(obj);
        p1.text = obj[@"name"];
        p1.entity = obj;
        NSArray *cities = obj[@"cities"];
        [data addObject:p1];
        if (level > kYWDPickViewAreaLevel1) {
            NSMutableArray *citiesItems = [[NSMutableArray alloc] initWithCapacity:cities.count];
            YWDListItem *cityAllItem = itemFromDic(allDic);
            YWDListItem *level2AllItem = itemFromDic(allDic);
            level2AllItem.superItem = level1AllItem;
            if (haveAll) {
                cityAllItem.superItem = p1;
                [citiesItems addObject:cityAllItem];
                if (haveAll) {
                    level1AllItem.subItems = @[level2AllItem];
                }
            }
            [cities enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                YWDListItem *cityItem = itemFromDic(obj);
                [citiesItems addObject:cityItem];
                NSArray *district = obj[@"district"];
                cityItem.superItem = p1;
                NSMutableArray *districtItems = [NSMutableArray arrayWithCapacity:district.count];
                cityItem.subItems = districtItems;
                if (level > kYWDPickViewAreaLevel2) {
                    if (haveAll) {
                        YWDListItem *districtAllItem = itemFromDic(allDic);
                        districtAllItem.superItem = cityAllItem;
                        [districtItems addObject:districtAllItem];
                        YWDListItem *level3AllItem = itemFromDic(allDic);
                        level3AllItem.superItem = level2AllItem;
                        if (haveAll) {
                            level2AllItem.subItems = @[level3AllItem];
                        }
                    }
                    [district enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        YWDListItem *disItem = itemFromDic(obj);
                        disItem.superItem = cityItem;
                        [districtItems addObject:disItem];
                    }];
                }
            }];
            p1.subItems = citiesItems;
        }
    }];
    return data;
}

+(YWDPickViewControl *)showAddressLevel2PickView:(NSString *)title withActionHandler:(YWDPickViewActionHandler)actionHandler
{
    return [self showPickViewWithData:arrayFromAreaJson(kYWDPickViewAreaLevel2) title:title withActionHandler:actionHandler];
}

+(YWDPickViewControl *)showAddressPickView:(NSString *)title withActionHandler:(void (^)(YWDListViewActionName, YWDListItem *))actionHandler
{
    
    return [self showPickViewWithData:arrayFromAreaJson(kYWDPickViewAreaLevel3) title:title withActionHandler:actionHandler];
}

+(YWDPickViewControl *)showPickViewWithData:(NSArray *)data
                                      title:(NSString *)title
                          withActionHandler:(void (^)(YWDListViewActionName, YWDListItem *))actionHandler
{
    YWDPickViewControl *pViewControl = [[YWDPickViewControl alloc] initWithTitle:title data:data withActionHandler:actionHandler];
    [pViewControl show];
    return pViewControl;
}

-(void)showPickViewWithData:(NSArray *)data
                      title:(NSString *)title
          withActionHandler:(void (^)(YWDListViewActionName, YWDListItem *))actionHandler
{
    if (data != _data) {
        _data = data;
        [_mPickerView selectRow:0 inComponent:0 animated:NO];
    }
    self.actionHandler = actionHandler;
    [self show];
}

-(void)show
{
    __currentPickViewControl = self;
    [YWDPopupControl popupView:_pickViewContainer animation:^(UIView *targetView) {
        [_pickViewContainer.po_frameBuilder alignToBottomInSuperviewWithInset:-_mPickerView.height - 50];
        [UIView animateWithDuration:0.3 animations:^{
            [targetView.po_frameBuilder alignToBottomInSuperviewWithInset:0];
        }];
    }];
}

-(void)hide
{
    [YWDPopupControl hideWithDuration:0.4 animations:^{
        [_pickViewContainer.po_frameBuilder alignToBottomInSuperviewWithInset:-_mPickerView.height - 50];
    } completion:^(BOOL finished) {
        [_pickViewContainer removeFromSuperview];
        __currentPickViewControl = nil;
    }];
}

-(void)toolBarCancelClick
{
//    [self hide];
    if (self.actionHandler) {
        self.actionHandler(kYWDActionPickViewDidCancel,nil);
    }
}

-(void)toolBarDoneClick
{
//    [self hide];
    if (self.actionHandler) {
        self.actionHandler(kYWDActionPickViewDidSelectItem,[self selectedItem]);
    }
}

-(YWDListItem *)selectedItem
{
    NSInteger component = [self numberOfComponentsInPickerView:_mPickerView] - 1;
    NSInteger row = [_mPickerView selectedRowInComponent:component];
    return [self arrayAtComponent:component][row];
}

-(NSArray *)arrayAtComponent:(NSInteger)component
{
    if (component == 0) {
        return self.data_level1;
    }
    else if (component == 1) {
        return self.data_level2;
    }
    else if (component == 2) {
        return self.data_level3;
    }
    return nil;
}

-(void)dealloc
{
    NSLog(@"YWDPickViewControl dealloc");
}

#pragma mark - UIPickerViewDataSource

// 初始化每个组件每一行数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [[self arrayAtComponent:component][row] text];
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.data_level2 = [self.data_level1[row] subItems];
        self.data_level3 = [self.data_level2[0] subItems];
    }
    else if (component == 1) {
        self.data_level3 = [self.data_level2[row] subItems];
    }
    else if (component == 2) {

    }
    [pickerView  reloadAllComponents];
    if (component < pickerView.numberOfComponents - 1) {
        [pickerView selectRow:0 inComponent:component + 1 animated:YES];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *pickerLabel = (UILabel *)view;
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:18]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    static int count = 0;
    count = 0;
    static int(^componentsOfData)(NSArray<YWDListItem *> *data) = ^(NSArray<YWDListItem *> *data){
        if (data.count == 0) {
            return count;
        }
        count += 1;
        return componentsOfData(data.firstObject.subItems);
    };
    int levelOfData = componentsOfData(_data);

    return levelOfData;
}



// 每个组件的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger row = 0;
    NSInteger count = 0;
    if (component == 0) {
        self.data_level1 = _data;
        count = self.data_level1.count;
    }
    else if (component == 1) {
        if (!self.data_level2) {
            self.data_level2 = [self.data_level1[row] subItems];
        }
        count = self.data_level2.count;
    }
    else if (component == 2) {
        if (!self.data_level3) {
            self.data_level3 = [self.data_level2[row] subItems];
        }
        count = self.data_level3.count;
    }
    return count;
}



@end
