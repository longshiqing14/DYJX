//
//  JXSearchHistoryCollectionReusableFooterView.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchHistoryCollectionReusableFooterView.h"

@interface JXSearchHistoryCollectionReusableFooterView ()

@property (strong,nonatomic) UILabel* textLabel;

@property (strong,nonatomic) UIImageView *imageView;


@end

@implementation JXSearchHistoryCollectionReusableFooterView

- (void) awakeFromNib
{
    [super awakeFromNib];
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubViews];
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    return self;
}

- (void) setText:(NSString*)text
{
    self.textLabel.text = text;
}

- (void) setImage:(NSString *)image;
{
    [self.imageView setImage:[UIImage imageNamed:image]];
}


- (void)initSubViews{
    //    [self addSubview:self.textLabel];
    [self.textLabel setText:@"搜索历史"];
    [self.textLabel setFont:[UIFont systemFontOfSize:12]];
    [self.textLabel setTextColor:[UIColor colorWithHexString:@"#B2B2B2"]];
    
    //    [self addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:@"common_nav_icon_search"]];
    
    [self addSubview:self.delectButton];
    [self.delectButton setTitle:@"删除历史记录" forState:UIControlStateNormal];
    [self.delectButton setTintColor:[UIColor colorWithHexString:@"#B2B2B2"]];
    [self.delectButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.delectButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [self.delectButton setImage:[UIImage imageNamed:@"icon_search_history_delate"] forState:UIControlStateNormal];
    [self.delectButton addTarget:self action:@selector(delect) forControlEvents:UIControlEventTouchUpInside];
    self.delectButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    //    WS(weakSelf)
    //    [self.textLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(0);
    //        make.left.mas_equalTo(weakSelf.imageView.mas_right).mas_equalTo(5);
    //    }];
    //
    //    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(0);
    //        make.left.mas_equalTo(5);
    //        make.size.mas_equalTo(CGSizeMake(16, 16));
    //    }];
    
    [self.delectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(93);
    }];
}

- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
    }
    return _textLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UIButton *)delectButton{
    if (!_delectButton) {
        _delectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return  _delectButton;
}

- (void)delect
{
    if ([self.delectDelegate respondsToSelector:@selector(delectData:)]) {
        [self.delectDelegate delectData:self];
    }
}

@end
