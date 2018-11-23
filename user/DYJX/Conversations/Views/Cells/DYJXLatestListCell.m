//
//  DYJXLatestListCell.m
//  user
//
//  Created by longshiqing on 2018/11/23.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "DYJXLatestListCell.h"

@implementation DYJXLatestListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.porityImageView];
    }
    return self;
}

-(void)layoutSubviews {
    WeakSelf

    [self.porityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}

-(UIImageView *)porityImageView {
    if (!_porityImageView) {
        _porityImageView = [[UIImageView alloc] initWithImage:@"ic_search_buy"];

    }
    return _porityImageView;
}

@end
