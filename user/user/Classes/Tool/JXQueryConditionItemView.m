//
//  JXQueryConditionItemView.m
//  user
//
//  Created by 岩  熊 on 2017/11/13.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXQueryConditionItemView.h"

//默认宽度
static CGFloat const kDefaultLimitWith = 80.0f;
static NSInteger kEABAQueryConditionItemViewTag = 161012;
@interface JXQueryConditionItemView ()
@property (nonatomic, assign) NSInteger count; //组数量
@property (nonatomic)CGFloat allWidth;
@property (nonatomic,copy)EABAItemActionBlock callBlock;
@property (nonatomic,strong)UIWindow *window;
@property (nonatomic,strong)UIView *lineView;
@end

@implementation JXQueryConditionItemView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tag = kEABAQueryConditionItemViewTag;
        self.count = 0;
        [self lineView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font selectedTextColor:(UIColor *)selectedTextColor block:(EABAItemActionBlock)block{
    if (self = [super initWithFrame:frame]) {
        self.tag = kEABAQueryConditionItemViewTag;
        self.count = 0;
        self.textColor = textColor;
        self.textFont = font;
        self.selectedTextColor = selectedTextColor;
        //        WB_DISPATCH_TO_MAIN_QUEUE_AFTER(1, ^{
        //            self.selectedItemIndex = selectedItemIndex;
        //        });
        self.callBlock = block;
        [self lineView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self adjustSubViewsFrame];
}
- (void)adjustSubViewsFrame
{
    NSMutableArray *subviews = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[JXQueryConditionItem class]]) {
            [subviews addObject:view];
        }
    }
    self.allWidth = self.frame.size.width / self.count;
    CGFloat height = self.frame.size.height;
    if (self.allWidth < kDefaultLimitWith) {
        self.allWidth = kScreenWidth/4;
    }
    for (int i = 0; i < self.count; i++) {
        JXQueryConditionItem *item = subviews[i];
        item.frame = CGRectMake(i * self.allWidth, 0, self.allWidth, height);
    }
    self.size = CGSizeMake(self.allWidth * self.count, self.frame.size.height);
}

-(void)setSelectedItemIndex:(NSInteger)selectedItemIndex{
    
    _selectedItemIndex = selectedItemIndex;
    JXQueryConditionItem *item = (JXQueryConditionItem *)[self viewWithTag:_selectedItemIndex];
    [self moveToItem:item];
    
}
- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor
{
    _selectedTextColor = selectedTextColor;
}

-(void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
}

- (void)insertItemWithTitle:(NSString *)title showArrow:(BOOL)showArrow{
    JXQueryConditionItem *item = [[JXQueryConditionItem alloc] init];
    item.titleLabel.text = title;
    item.titleLabel.font = _textFont;
    item.showArrow = showArrow;
    item.tag =self.count;
    if (item.showArrow) {
        item.arrowType = EABAItemArrowNone;
    }
    if (_textColor) {
        item.titleLabel.textColor = _textColor;
    }
    [item addTarget:self action:@selector(moveToItem:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:item];
    self.count ++;
}

-(void)replaceItemWithTitle:(NSString *)title indexPath:(NSInteger)indexPath{
    
    for (JXQueryConditionItem *items in self.subviews){
        
        if (items.tag == indexPath) {
            items.titleLabel.text = [self getChars:title];
        }
    }
}

-(void)resetItemWithTitle:(NSString *)title indexPath:(NSInteger)indexPath showArrow:(BOOL)showArrow{
    
    for (JXQueryConditionItem *items in self.subviews){
        
        if (items.tag == indexPath) {
            items.titleLabel.text = title;
            items.titleLabel.textColor =  _textColor;
            items.arrowType = EABAItemArrowNone;
            items.showArrow = showArrow;
            return;
        }
    }
}

-(void)moveToItem:(JXQueryConditionItem *)item{
    if (![item isKindOfClass:[JXQueryConditionItem class]]) {
        //YDLog(@"不是EABAQueryConditionItem类型");
        return;
    }
    //    if (item.tag == 0) {
    //        [self compatibility:item];
    //    }
    //    else{
    //       [self refreshItem:item];
    //    }
    
    [self refreshItem:item];
}
///为了兼容星链生活3.0附近需求
-(void)compatibility:(JXQueryConditionItem *)item{
    if (item.showArrow) {
        for (JXQueryConditionItem *items in self.subviews) {
            if (items != item && [items isKindOfClass:[JXQueryConditionItem class]]) {
                items.titleLabel.textColor = _textColor;
                items.arrowType = EABAItemArrowNone;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowDown){
                items.arrowType = EABAItemArrowUp;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowUp){
                items.arrowType = EABAItemArrowDown;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowNone){
                items.arrowType = EABAItemArrowDown;
            }
        }
    }
    else{
        for (JXQueryConditionItem *items in self.subviews) {
            if (items != item && [items isKindOfClass:[JXQueryConditionItem class]]) {
                items.titleLabel.textColor = _textColor;
                items.arrowType = EABAItemArrowNone;
            }
        }
    }
    //    YDLog(@"selectedItemIdex:%zi arrowType:%zi",item.tag,item.arrowType);
    if (self.callBlock) {
        self.callBlock(item.tag,item.arrowType);
    }
    
}

-(void)refreshItem:(JXQueryConditionItem *)item{
    item.titleLabel.textColor = _selectedTextColor;
    if (item.showArrow) {
        for (JXQueryConditionItem *items in self.subviews) {
            if (items != item && [items isKindOfClass:[JXQueryConditionItem class]]) {
                items.titleLabel.textColor = _textColor;
                items.arrowType = EABAItemArrowNone;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowDown){
                items.arrowType = EABAItemArrowUp;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowUp){
                items.arrowType = EABAItemArrowDown;
            }
            else if (items == item && [items isKindOfClass:[JXQueryConditionItem class]] && items.arrowType == EABAItemArrowNone){
                if ([items.titleLabel.text isEqualToString:@"价格"]) {
                    items.arrowType = EABAItemArrowUp;
                } else {
                    items.arrowType = EABAItemArrowDown;
                }
            }
        }
    }
    else{
        for (JXQueryConditionItem *items in self.subviews) {
            if (items != item && [items isKindOfClass:[JXQueryConditionItem class]]) {
                items.titleLabel.textColor = _textColor;
                items.arrowType = EABAItemArrowNone;
            }
        }
    }
    //    YDLog(@"selectedItemIdex:%zi arrowType:%zi",item.tag,item.arrowType);
    if (self.callBlock) {
        self.callBlock(item.tag,item.arrowType);
    }
}


/**
 *  <#Description#>
 *
 */
-(NSString *)getChars:(NSString *)string{
    NSString *charsStr = string;
    if (charsStr.length > 5) {
        charsStr = [string substringToIndex:5];
        charsStr = [charsStr stringByAppendingString:@"..."];
        return charsStr;
    }
    return charsStr;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#E4E4E4"];
    }
    return _lineView;
}
@end
