//
//  MyAnnotationView.m
//  user
//
//  Created by longshiqing on 2018/12/29.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView

- (id)initWithAnnotation:(id <QAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.myImageView];
    }
    return self;
}


-(UIImageView *)myImageView {
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"greenPin_lift"]];
        _myImageView.frame = CGRectMake(0, 0, 30, 50);
    }
    return _myImageView;
}

@end
