//
//  JXSearchHistoryHotCollectionReusableHeaderView.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchHistoryHotCollectionReusableHeaderView.h"

@implementation JXSearchHistoryHotCollectionReusableHeaderView
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        
    }
    return self;
}

- (void)initSubViews{
    [self addSubview:self.textLabel];
    [self.textLabel setText:@"热门搜索"];
    [self.textLabel setFont:[UIFont systemFontOfSize:13]];
    [self.textLabel setTextColor:[UIColor colorWithHexString:@"#333333"]];
    
    [self addSubview:self.imageView];
    [self.imageView setImage:[UIImage imageNamed:@"ic_search_hot"]];
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews{
    WeakSelf;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.textLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(weakSelf.imageView.mas_right).mas_equalTo(4);
    }];
    

    
    
}
//- (void)delect
//{
//    if ([self.delectDelegate respondsToSelector:@selector(delectData:)]) {
//        [self.delectDelegate delectData:self];
//    }
//}

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




@end
