//
//  DYJXContactDetailsTopView.m
//  user
//
//  Created by YP on 2019/5/12.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXContactDetailsTopView.h"

@interface DYJXContactDetailsTopView ()

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) NSArray<NSDictionary *> *topBtnArray;
@property (nonatomic, strong) NSMutableArray<UIButton *> *btnArray;
@property (nonatomic, copy) InviteIngGroupBlock inviteIngGroupBlock;
@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation DYJXContactDetailsTopView

-(instancetype)initWithTitle:(NSString *)title topBtnArray:(NSArray *)topBtnArray inviteIngGroupBlocki:(InviteIngGroupBlock)inviteIngGroupBlocki{
    self = [super init];
    if (self) {
        self.titleLb.text = title;
        self.topBtnArray = topBtnArray;
        self.inviteIngGroupBlock = inviteIngGroupBlocki;
    }
    return self;
}

-(void)setType:(ContactType)type {
    _type = type;
    [self.btnArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == type - 1) {
            obj.selected = YES;
        }
    }];
}

-(void)setTypeWithRelation:(NSDictionary *)relation {
//    DYJXUserInfoRelationModel *model;
//    if ([relation isKindOfClass:[NSDictionary class]]) {
//        model = [DYJXUserInfoRelationModel modelWithJSON:(NSDictionary *)relation];
//    }else {
//        model = relation;
//    }
    
    if ([[relation allKeys] containsObject:@"IsFriend"]) {
        if ([(NSNumber *)relation[@"IsFriend"] boolValue]) {
            self.type = ContactType_Friend;
        }
    }
    
    if ([[relation allKeys] containsObject:@"IsContact"]) {
        if ([(NSNumber *)relation[@"IsContact"] boolValue]) {
            self.type = ContactType_Ordinary;
        }
    }
    
    if ([[relation allKeys] containsObject:@"InBlacklist"]) {
        if ([(NSNumber *)relation[@"InBlacklist"] boolValue]) {
            self.type = ContactType_Black;
        }
    }
}

-(void)setTopBtnArray:(NSArray<NSDictionary *> *)topBtnArray {
    
    CGFloat width = XYScreenW - 2 * __X(20);
    _topBtnArray = topBtnArray;
    for (NSDictionary *dict in topBtnArray) {
        NSInteger index = [topBtnArray indexOfObject:dict];
        NSString *title = [self containsObject:@"title" superDictionary:dict];
        NSString *imageName = [self containsObject:@"imageName" superDictionary:dict];
        NSString *selectedImageName = [self containsObject:@"selectedImageName" superDictionary:dict];
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont systemFontOfSize:__X(28)];
        if (title) {
            [btn setTitle:title forState:(UIControlStateNormal)];
        }
        if (imageName) {
            [btn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
        }
        if (selectedImageName) {
            [btn setImage:[UIImage imageNamed:selectedImageName] forState:(UIControlStateSelected)];
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:btn];
        
        CGFloat btnWidth = [self computeWidthText:title];
        CGFloat actualWidth = btnWidth + __X(40) + __X(20);
        width = width - actualWidth;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(__X(40)));
            if (index / 4 == 0) {
                make.top.equalTo(self.titleLb.mas_bottom).offset(__X(40));
                make.width.equalTo(@(actualWidth));
                if (index == 0) {
                    make.left.equalTo(@(__X(20)));
                }else {
                    make.left.equalTo(self.btnArray.lastObject.mas_right);
                    if (index == 4) {
                        make.right.lessThanOrEqualTo(@(__X(-20)));
                    }
                }
            }else {
                make.top.equalTo(self.btnArray.firstObject.mas_bottom).offset(__X(30));
                make.left.equalTo(@(__X(28)));
                make.bottom.equalTo(@(__X(-20)));
            }
        }];
        [self.btnArray addObject:btn];
    }
}

- (CGFloat)computeWidthText:(NSString *)text {
    UILabel *lb = [[UILabel alloc]init];
    lb.font = [UIFont systemFontOfSize:__X(28)];
    lb.text = text;
    [lb sizeToFit];
    return lb.bounds.size.width;
}

- (void)btnClick:(UIButton *)btn {
    btn.selected = !btn.selected;
    NSInteger index = [self.btnArray indexOfObject:btn];
    if (index != 4) {
        self.selectedBtn.selected = NO;
        self.selectedBtn = btn;
        self.type = index + 1;
    }else {
        if (self.inviteIngGroupBlock) {
            self.inviteIngGroupBlock();
        }
    }
}

- (NSString *)containsObject:(NSString *)object superDictionary:(NSDictionary *)dictionary {
    if ([[dictionary allKeys] containsObject:object]) {
        return dictionary[object];
    }else {
        return nil;
    }
}

-(UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(@(__X(20)));
            make.right.lessThanOrEqualTo(@(__X(-20)));
        }];
        _titleLb.font = [UIFont systemFontOfSize:__X(30)];
        _titleLb.textColor = [UIColor blackColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.numberOfLines = 1;
    }
    return _titleLb;
}

-(NSMutableArray<UIButton *> *)btnArray {
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc]init];
    }
    return _btnArray;
}

@end
