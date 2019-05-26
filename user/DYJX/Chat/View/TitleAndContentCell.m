//
//  TitleAndContentCell.m
//  user
//
//  Created by 岩  熊 on 2018/11/26.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "TitleAndContentCell.h"

@implementation TitleAndContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSubViews];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangEvent:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    }
    return self;
}

//-(void)setModel:(GroupDetailModel *)model {
////    self.model = (GroupDetailModel *)model;
//    [self.iconImage setImage:[UIImage imageNamed:model.iconName]];
//    self.contentLb.placeholder = model.placeHolder;
//}

- (void)initSubViews{
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.contentLb];
    [self.contentView addSubview:self.separatorLineView];
    [self layoutIfNeeded];
}

-(void)setModel:(LPXNewCustomerCellModel *)model {
    _model = model;
    self.iconImage.image = [UIImage imageNamed:model.leftViewImage];
    self.contentLb.placeholder = model.placeholder;
    self.contentLb.text = model.text;
    self.contentLb.userInteractionEnabled = model.userInteractionEnabled;
}

- (void)textDidChangEvent:(NSNotification *)notication {
    if (notication.object == _contentLb) {
        _model.text =  _contentLb.text?:@"";
    }
}

- (void)textDidBeginEditing:(NSNotification *)notication {
    if (notication.object == _contentLb) {
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (void)layoutSubviews{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).mas_equalTo(5);
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
//        make.height.mas_equalTo(16);
//        make.top.mas_equalTo(0);
//        make.bottom.mas_equalTo(1);
    }];
    
    [self.separatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];

    }
    return _iconImage;
}

- (UITextField *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UITextField alloc]init];
        _contentLb.font = [UIFont systemFontOfSize:13];
        _contentLb.textColor = [UIColor colorWithHexString:@"999999"];
    }
    return _contentLb;
}

- (UIView *)separatorLineView{
    if (!_separatorLineView) {
        _separatorLineView = [[UIView alloc] init];
        _separatorLineView.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
    }
    return _separatorLineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
