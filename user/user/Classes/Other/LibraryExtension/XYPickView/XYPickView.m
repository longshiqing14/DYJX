//
//  XYPickView.m
//  tgy
//
//  Created by xingyun on 2017/1/8.
//  Copyright © 2017年 xingyun. All rights reserved.
//

#define ZHToobarHeight 40

#import "XYPickView.h"

static id _instance;

@interface XYPickView ()<UIPickerViewDataSource,UIPickerViewDelegate>


@property (nonatomic, copy) NSMutableArray<JXAddressDetailModel*> * mydata;
@property (nonatomic, copy) NSString * key;
@property (nonatomic, copy) NSString * idkey;
@property (nonatomic, copy) NSString * selectString;
@property (nonatomic, copy) NSString * selectid;


@property(nonatomic,strong)UIToolbar *toolbar;
@property(nonatomic,assign)NSInteger pickeviewHeight;

@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIButton *handerView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) NSInteger secondSelectIndex;
@property (nonatomic, assign) BOOL isHaveStreetArea;
@end

@implementation XYPickView


+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpToolBar];
    }
    return self;
}



-(instancetype)initPickviewWithArray:(NSMutableArray<JXAddressDetailModel*> *)array key:(NSString*)key idkey:(NSString*)idkey andSelectString:(NSString*)string
{
    self = [super init];
    if (self) {
        self.mydata = array;
        
        self.key = key;
        self.idkey = idkey;
        
        [self setUpPickView];

        [self setFrameWith];
        
        if (self.mydata.count != 0) {
            
            if (string != nil ) {
                
                for (id temp in self.mydata) {
                    if ([string isEqualToString:[NSString stringWithString:[temp valueForKeyPath:self.key]]]) {
                        self.selectString = [NSString stringWithString:[temp valueForKeyPath:self.key]];
                        self.selectid = [NSString stringWithString:[temp valueForKeyPath:self.idkey]];
                    }
                }
                
                if (self.selectString == nil) {
                    id temp = [self.mydata objectAtIndex:0];
                    self.selectString = [NSString stringWithString:[temp valueForKeyPath:self.key]];
                    self.selectid = [NSString stringWithString:[temp valueForKeyPath:self.idkey]];
                }
                
            }else{
                id temp = [self.mydata objectAtIndex:0];
                self.selectString = [NSString stringWithString:[temp valueForKeyPath:self.key]];
                self.selectid = [NSString stringWithString:[temp valueForKeyPath:self.idkey]];
            }

            
            if (self.selectString != nil) {
                WeakSelf;
                [self.mydata enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([string isEqualToString:[NSString stringWithString:[obj valueForKeyPath:weakSelf.key]]]) {
                        if (_pickerView != nil) {
                            [_pickerView selectRow:idx inComponent:0 animated:YES];
                        }
                    }
                }];
            }
            
        }
        
        
    }
    return self;
}

-(instancetype)initPickviewWithArray:(NSMutableArray *)array key:(NSString*)key idkey:(NSString*)idkey{
    self = [super init];
    if (self) {
        self.selectIndex = 0;
        self.secondSelectIndex = 0;
        self.mydata = array;
        
        self.key = key;
        self.idkey = idkey;
        
        if (self.mydata[self.selectIndex].children.count != 0) {
            //            id temp = [self.mydata objectAtIndex:0];
            self.selectString = [NSString stringWithFormat:@"%@%@",self.mydata[self.selectIndex].name,self.mydata[self.selectIndex].children[self.secondSelectIndex].name];
            self.selectid = self.mydata[self.selectIndex].children[self.secondSelectIndex].ID;
            self.isHaveStreetArea = YES;
        }else{
            self.selectString = self.mydata[self.selectIndex].name;
            self.selectid = self.mydata[self.selectIndex].ID;
            self.isHaveStreetArea = NO;
        }
        
        [self setUpPickView];
        
        [self setFrameWith];
        
        
    }
    return self;
}


-(instancetype)initPickviewWithArray:(NSMutableArray *)array key:(NSString*)key idkey:(NSString*)idkey regionIndex:(NSInteger)regionIndex disstrictIndex:(NSInteger)disstrictIndex
{
    self = [super init];
    if (self) {
        self.selectIndex = regionIndex;
        self.secondSelectIndex = disstrictIndex;
        self.mydata = array;
        
        self.key = key;
        self.idkey = idkey;
        
        if (self.mydata[self.selectIndex].children.count != 0) {
//            id temp = [self.mydata objectAtIndex:0];
            self.selectString = [NSString stringWithFormat:@"%@%@",self.mydata[self.selectIndex].name,self.mydata[self.selectIndex].children[self.secondSelectIndex].name];
            self.selectid = self.mydata[self.selectIndex].children[self.secondSelectIndex].ID;
             self.isHaveStreetArea = YES;
        }else{
            self.selectString = self.mydata[self.selectIndex].name;
            self.selectid = self.mydata[self.selectIndex].ID;
            self.isHaveStreetArea = NO;
        }
        
        [self setUpPickView];
        
        [self setFrameWith];
        
        
    }
    return self;
}

- (NSMutableArray<JXAddressDetailModel*>*)mydata
{
    if (_mydata == nil) {
        _mydata = [NSMutableArray array];
    }
    return _mydata;
}

-(void)setUpPickView{
    
    
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.backgroundColor = [UIColor whiteColor];
    _pickerView = pickView;
    pickView.delegate=self;
    pickView.dataSource=self;
    pickView.frame=CGRectMake(0, ZHToobarHeight, XYScreenW, pickView.frame.size.height);
    _pickeviewHeight=pickView.frame.size.height;
    [self addSubview:pickView];
    
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handerView setFrame:[UIScreen mainScreen].bounds];
    [_handerView addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    _handerView.backgroundColor = [UIColor blackColor];
    _handerView.alpha = 0.3;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_handerView];
    [window addSubview:self];
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
    
     if (self.mydata[self.selectIndex].children.count != 0) {
         [self.pickerView selectRow: self.selectIndex inComponent:0 animated:YES];
         [self.pickerView selectRow: self.secondSelectIndex inComponent:1 animated:YES];
     }else{
          [self.pickerView selectRow: self.selectIndex inComponent:0 animated:YES];
     }
    
}

-(void)setFrameWith{
    CGFloat toolViewX = 0;
    CGFloat toolViewH = _pickeviewHeight+ZHToobarHeight;
    CGFloat toolViewY ;
    
    toolViewY= [UIScreen mainScreen].bounds.size.height-toolViewH;
    
    CGFloat toolViewW = [UIScreen mainScreen].bounds.size.width;
    self.frame = CGRectMake(toolViewX, toolViewY, toolViewW, toolViewH);
}


-(void)setUpToolBar{
    _toolbar=[self setToolbarStyle];
    [self setToolbarWithPickViewFrame];
    [self addSubview:_toolbar];
    
}

-(UIToolbar *)setToolbarStyle{
    UIToolbar *toolbar=[[UIToolbar alloc] init];
    
    toolbar.backgroundColor = XYWhiteColor;
    
    UIBarButtonItem *lefttem=[[UIBarButtonItem alloc] initWithTitle:@"  取消" style:UIBarButtonItemStylePlain target:self action:@selector(dispickView)];
    
    UIBarButtonItem *centerSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"确定  " style:UIBarButtonItemStylePlain target:self action:@selector(doneClick)];
    toolbar.items=@[lefttem,centerSpace,right];
    return toolbar;
}
-(void)setToolbarWithPickViewFrame{
    _toolbar.frame=CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, ZHToobarHeight);
}

-(void)remove{
    
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
//        [_handerView removeFromSuperview];
//        [self removeFromSuperview];
        
        [_handerView setHidden:YES];
        self.hidden = YES;
    }];
}

-(void)dispickView{
    [self remove];
    if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(closePickView)]) {
        [self.delegate closePickView];
    }
}

-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.hidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
        //        [_handerView removeFromSuperview];
        //        [self removeFromSuperview];
        
        [_handerView setHidden:NO];
        self.hidden = NO;
    }];
    
}
-(void)doneClick
{
//    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(toobarDonBtnHaveClick:resultString:)]) {
//        [self.delegate toobarDonBtnHaveClick:self resultString:self.selectString];
//    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(toobarDonBtnHaveClick:resultString:resultIDString:isHaveStreetArea:)]) {
        [self.delegate toobarDonBtnHaveClick:self resultString:self.selectString resultIDString:self.selectid isHaveStreetArea:self.isHaveStreetArea];
    }
    
    [self remove];
}



#pragma mark -- piker view datasoures / delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (self.mydata[self.selectIndex].children.count != 0) {
        return 2;
    }else{
        return 1;
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.mydata.count;
    }else{
        return self.mydata[self.selectIndex].children.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    id temp = [self.mydata objectAtIndex:row];
//    return [NSString stringWithString:[temp valueForKeyPath:self.key]];
    if (component == 0) {
        return self.mydata[row].name;
    }else{
        return self.mydata[self.selectIndex].children[row].name;
    }
}

//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    id temp = [self.mydata objectAtIndex:row];
//    NSString * title = [NSString stringWithString:[temp valueForKeyPath:self.key]];
//    
//    NSAttributedString * attString = [[NSAttributedString alloc]initWithString:title
//                                   attributes:@{NSFontAttributeName:XYFont_16,
//                                                NSForegroundColorAttributeName:XYMainColor}];
//    return attString;
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    id temp = [self.mydata objectAtIndex:row];
//    self.selectString = [NSString stringWithString:[temp valueForKeyPath:self.key]];
//    self.selectid = [NSString stringWithString:[temp valueForKeyPath:self.idkey]];
    if (component == 0) {
        self.selectIndex = row;
        [self.pickerView reloadAllComponents];
        if (self.mydata[self.selectIndex].children.count == 0) {
            
        }else{
           [self.pickerView selectRow:0 inComponent:1 animated:YES];
            self.secondSelectIndex = 0;
        }
    }else{
        self.secondSelectIndex = row;
        [self.pickerView reloadAllComponents];
    }
    if (self.mydata[self.selectIndex].children.count == 0) {
        self.selectString = self.mydata[self.selectIndex].name;
        self.selectid = self.mydata[self.selectIndex].ID;
        self.isHaveStreetArea = NO;
    }else{
        if (component == 0) {
            self.selectString = [NSString stringWithFormat:@"%@%@",self.mydata[self.selectIndex].name,self.mydata[self.selectIndex].children[self.secondSelectIndex].name];
            self.selectid = self.mydata[self.selectIndex].children[self.secondSelectIndex].ID;
            self.isHaveStreetArea = YES;
        }else{
            self.selectString = [NSString stringWithFormat:@"%@%@",self.mydata[self.selectIndex].name,self.mydata[self.selectIndex].children[self.secondSelectIndex].name];
            self.selectid = self.mydata[self.selectIndex].children[self.secondSelectIndex].ID;
            self.isHaveStreetArea = YES;
        }
    }

    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //设置分割线的颜色
//    for(UIView *singleLine in pickerView.subviews)
//    {
//        if (singleLine.frame.size.height < 1)
//        {
//            singleLine.backgroundColor = kSingleLineColor;
//        }
//    }
    
    //设置文字的属性
    UILabel *genderLabel = [UILabel new];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    if (component == 0) {
        genderLabel.text = self.mydata[row].name;
    }else{
        genderLabel.text = self.mydata[self.selectIndex].children[row].name;
    }
    genderLabel.textColor = [UIColor blackColor];
    
    return genderLabel;
}

@end
