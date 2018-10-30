//
//  JXSearchHistoryCollectionViewCell.m
//  user
//
//  Created by 岩  熊 on 2017/11/10.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "JXSearchHistoryCollectionViewCell.h"

@implementation JXSearchHistoryCollectionViewCell

- (instancetype)init{
    if (self = [super init]) {
        [self initSubViews];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    [self.contentLb setTextColor:[UIColor colorWithHexString:@"333333"]];
    [self.contentLb setTextAlignment:NSTextAlignmentCenter];
    [self.contentLb.layer setMasksToBounds:YES];
    [self.contentLb.layer setCornerRadius:3.0];
    self.contentLb.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [self.contentLb setBackgroundColor:[UIColor colorWithHexString:@"#F2F2F2"]];
    [self layoutIfNeeded];
    
}

- (void)layoutSubviews{
    [self addSubview:self.contentLb];
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(CGRectMake(0, 0, 0, 0));
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
        
    }];
}

+ (CGSize) getSizeWithText:(NSString*)text;
{
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 24) options: NSStringDrawingUsesLineFragmentOrigin   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11.0f],NSParagraphStyleAttributeName:style} context:nil].size;
    return CGSizeMake(size.width+20 > kScreenWidth - 30 ?kScreenWidth - 30 :size.width+20, 24);
}

- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc]init];
        _contentLb.font = [UIFont systemFontOfSize:11];
    }
    return _contentLb;
}
@end
