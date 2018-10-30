//
//  XYOrderRecommentThirdCell.m
//  user
//
//  Created by xingyun on 2017/9/29.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYOrderRecommentThirdCell.h"

@implementation XYOrderRecommentThirdCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatGui];
    }
    return self;
    
}

-(void)creatGui{
    
    WeakSelf;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(XY_Left_Margin);
        make.width.height.mas_equalTo(60);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
    }];
    
  
    
    

        
        
    [self.descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImgView.mas_top);
        make.left.mas_equalTo(_iconImgView.mas_right).offset(17);
        make.height.mas_equalTo(40);
        make.right.mas_equalTo(XY_Right_Margin);
    }];
    
    
    
    
    
}

-(void)setStar:(NSString *)star
{

    _star = star;
    
    for (NSInteger i = 0; i<5; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        if (btn.tag <= [star integerValue]-1) {
            [btn setImage:[UIImage imageNamed:@"order_comment_star-check"] forState:UIControlStateNormal];
        }else
        {
            [btn setImage:[UIImage imageNamed:@"order_comment_star-uncheck"] forState:UIControlStateNormal];
        }
        
        [self.contentView addSubview:btn];
        CGFloat left = 8.5 +i*34;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconImgView.mas_right).offset(left);
            make.bottom.mas_equalTo(_iconImgView.mas_bottom).offset(6);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(34);
        }];
        
        
    }
    
}

-(void)setDescStr:(NSString *)descStr
{
    
    _descStr = descStr;
    
    self.descLab.text = self.descStr;
    [self.descLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImgView.mas_top);
        make.left.mas_equalTo(_iconImgView.mas_right).offset(17);
        make.height.mas_equalTo(30);
        
    }];
    
}


-(UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc] init];
        _iconImgView.layer.cornerRadius = 3;
        _iconImgView.layer.borderColor = XYGrayColor.CGColor;
        _iconImgView.layer.borderWidth = 0.5;
        _iconImgView.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconImgView];
    }
    return _iconImgView;
}

-(UILabel *)descLab
{
    if (!_descLab) {
        _descLab = [UILabel new];
        _descLab.font = XYFont_14;
        _descLab.text = @"评价";
        _descLab.numberOfLines = 2;
//        _descLab.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_descLab];
        _descLab.textColor = XYBlackColor;
    }
    return _descLab;
}



-(void)starBtnHandler:(UIButton *)sender{
    
    
    for (UIView *sub in self.contentView.subviews) {
        if ([sub isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)sub;
            
            if (self.star!=nil) {
                btn.enabled = NO;
            }
            if (btn.tag <= sender.tag) {
                [btn setImage:[UIImage imageNamed:@"order_comment_star-check"] forState:UIControlStateNormal];
            }else
            {
                [btn setImage:[UIImage imageNamed:@"order_comment_star-uncheck"] forState:UIControlStateNormal];
            }
            
        }
    }
    
    
    
    
    NSLog(@"xuxuxuxuxuxuxux:%@",sender);
    
}



@end
