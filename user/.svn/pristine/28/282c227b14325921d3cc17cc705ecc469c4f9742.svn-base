//
//  JXStyleView.m
//  user
//
//  Created by 岩  熊 on 2017/11/14.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXStyleView.h"
typedef void(^listBlock)(NSInteger index);

@interface JXStyleView ()
@property (nonatomic, strong) UIButton *styleBTN;
@property (nonatomic, strong) UIImageView *styleImageView;
@property (nonatomic, assign) BOOL isList;
@property (nonatomic,strong) UIView *lineView;

@end

@implementation JXStyleView
- (instancetype)init{
    if (self = [super init]) {
        [self initSubViews];
//        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    }
    return self;
}

- (void)initSubViews
{
    
//    self.isList = NO;
//    self.styleBTN = [UIButton buttonWithType:UIButtonTypeCustom];
//    //0 -- 44
//    [self addSubview:self.styleImageView];
//    [self.styleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(20, 19));
//    }];
    
//    [self addSubview:self.styleBTN];
//    [self.styleBTN mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
//
//    [self.styleBTN addTarget:self action:@selector(clickStyle:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self addSubview:self.lineView];
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
}

#pragma mark - clickStyle
- (void)clickStyle:(UIButton *)sender
{
    self.isList = !self.isList;
    if (self.isList) {
        [self.styleImageView setImage:[UIImage imageNamed:@"ic_prolist_1"]];
        if (self.delegate && [self.delegate respondsToSelector:@selector(witchStyle:)]) {
            [self.delegate witchStyle:2];
        }
    } else {
        [self.styleImageView setImage:[UIImage imageNamed:@"ic_prolist_2"]];
        if (self.delegate && [self.delegate respondsToSelector:@selector(witchStyle:)]) {
            [self.delegate witchStyle:1];
        }
    }
    //    self.tempBlock(self.isList);
}

- (UIImageView *)styleImageView{
    if (!_styleImageView) {
        _styleImageView = [[UIImageView alloc] init];
    }
    [_styleImageView setImage:[UIImage imageNamed:@"ic_prolist_2"]];
    return _styleImageView;
}

//- (UIView *)lineView{
//    if (!_lineView) {
//        _lineView = [[UIView alloc]init];
//        [_lineView setBackgroundColor:[UIColor colorWithHexString:@"D8D8D8"]];
//    }
//    return _lineView;
//}

@end
