//
//  DYJXAddCompanyPageCell.m
//  user
//
//  Created by YP on 2019/4/22.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXAddCompanyPageCell.h"

@interface DYJXAddCompanyPageCell ()

@property (nonatomic, strong) UILabel *leftLb;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *contentLb;
@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation DYJXAddCompanyPageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self leftLb];
        [self textField];
        [self contentLb];
        [self nextBtn];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangEvent:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setModel:(LPXNewCustomerCellModel *)model {
    _model = model;
    self.leftLb.text = model.leftViewText;
    UILabel *lb = [[UILabel alloc]init];
    lb.text = model.leftViewText;
    lb.font = self.leftLb.font;
    [lb sizeToFit];
    [self.leftLb mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(lb.size.width));
    }];
    self.textField.placeholder = model.placeholder;
    self.textField.keyboardType = model.keyboardType;
    self.textField.hidden = model.isHiddenField;
    self.contentLb.hidden = !model.isHiddenField;
    self.textField.text = model.text;
    
    if (model.text && ![model.text isEqualToString:@""]) {
        self.leftLb.text = model.text;
    }
    if (!model.righImageName || ![model.righImageName isEqualToString:@""]) {
        self.nextBtn.hidden = NO;
        [self.nextBtn setImage:[UIImage imageNamed:model.righImageName] forState:(UIControlStateNormal)];
        BOOL isRighImageNil = (!model.righSelectedImageName || ![model.righSelectedImageName isEqualToString:@""]);
        [self.nextBtn setImage:[UIImage imageNamed:isRighImageNil ? model.righSelectedImageName : model.righImageName] forState:(UIControlStateSelected)];
    }else {
        self.nextBtn.hidden = YES;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pt1 = [touch locationInView:self.leftLb];
    CGPoint pt2 = [touch locationInView:self.nextBtn];
//    //点击中间区域（当前为cell可点击范围）
//    if (!CGRectContainsPoint(CGRectMake(0, 0, self.leftLb.frame.origin.x + self.leftLb.frame.size.width, self.bounds.size.height), pt1) && !CGRectContainsPoint(CGRectMake(0, self.nextBtn.frame.origin.x, self.nextBtn.frame.size.width, self.nextBtn.size.height), pt2) && [self.model.leftViewText isEqualToString:@""]) {
//        if (self.nextBtnBlock) {
//            self.nextBtnBlock(self);
//        }
//    }
    if (self.model.isShowSelectetView) {
        //        if ([self.model.righImageName isEqualToString:@""]) {
        if (self.nextBtnBlock) { // 跳到下一步操作
            self.nextBtnBlock(self);
        }
        //        }else { // 勾选/非勾选
        //            self.nextBtn.selected = !self.nextBtn.selected;
        //        }
    }
}

- (void)nextBtnClick:(UIButton *)btn {
    if (self.model.isShowSelectetView) {
        if ([self.model.righImageName isEqualToString:@"ic_category_close"]) {
            if (self.nextBtnBlock) { // 跳到下一步操作
                self.nextBtnBlock(self);
            }
        }else { // 勾选/非勾选
            self.nextBtn.selected = !self.nextBtn.selected;
            self.model.isSelected = self.nextBtn.selected;
        }
    }
}

- (void)textDidChangEvent:(NSNotification *)notication {
    if (notication.object == _textField) {
        _model.text =  _textField.text?:@"";
    }
}

- (void)textDidBeginEditing:(NSNotification *)notication {
    if (notication.object == _textField) {
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}

- (UILabel *)leftLb {
    if (!_leftLb) {
        _leftLb = [[UILabel alloc]init];
        [self.contentView addSubview:_leftLb];
        [_leftLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(__X(20)));
            make.centerY.equalTo(@0);
            make.width.equalTo(@(__X(128)));
        }];
        _leftLb.textColor = [UIColor lightGrayColor];
        _leftLb.textAlignment = NSTextAlignmentLeft;
        _leftLb.font = [UIFont systemFontOfSize:__X(30)];
        _leftLb.numberOfLines = 1;
    }
    return _leftLb;
}

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:_nextBtn];
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.and.right.equalTo(@0);
            make.width.and.height.equalTo(@(__X(80)));
            make.left.equalTo(self.textField.mas_right);
        }];
        [_nextBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _nextBtn;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftLb.mas_right).offset(__X(6));
            make.centerY.equalTo(@(0));
            make.top.and.bottom.equalTo(@0);
        }];
    }
    return _textField;
}

- (UILabel *)contentLb {
    if (!_contentLb) {
        _contentLb = [[UILabel alloc]init];
        [self.contentView addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(@0);
            make.left.equalTo(self.textField);
            make.right.equalTo(self.nextBtn.mas_left).offset(__X(4));
        }];
        _contentLb.font = [UIFont systemFontOfSize:__X(30)];
        _contentLb.textColor = [UIColor blackColor];
        _contentLb.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLb;
}

@end
