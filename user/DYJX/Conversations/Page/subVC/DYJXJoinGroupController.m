//
//  DYJXJoinGroupController.m
//  user
//
//  Created by YP on 2019/5/25.
//  Copyright © 2019 xiaopenglive. All rights reserved.
//

#import "DYJXJoinGroupController.h"

@interface DYJXJoinGroupController ()

@property (nonatomic, strong) UIImageView *groupImageView;
@property (nonatomic, strong) UILabel *groupNumberLb;
@property (nonatomic, strong) UILabel *groupNameLb;
@property (nonatomic, strong) UILabel *groupInfo;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *inputTitleLb;
@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, strong) UIButton *joinGroupBtn;

@end

@implementation DYJXJoinGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"发送请求";
    [self setUIWithGroupResponse:self.response];
}

- (void)setUIWithGroupResponse:(DYJXXYResult *)groupResponse {
    [self.groupImageView setImageWithURL:[NSURL URLWithString:[groupResponse.GroupHeadImg XYImageURL]] placeholder:[UIImage imageNamed:@"btn_group"]];
    self.groupNameLb.text = groupResponse.GroupName ?: @" ";
    self.groupNumberLb.text = groupResponse.NumberString ?: @" ";
    self.groupInfo.text = groupResponse.GroupInfo ?: @" ";
    [self lineView];
    [self inputTitleLb];
    [self inputTextView];
    [self joinGroupBtn];
}

- (void)joinGroupBtnClick:(UIButton *)btn {
    WeakSelf
    [self addFriendApplySuccess:^(DYJXXYGroupByIdResponse *respons) {
        [YDBAlertView showToast:@"发送申请成功！" dismissDelay:1.0];
        [weakSelf.navigationController popViewControllerAnimated:NO];
    } failed:^(NSString *errorMsg) {
        
    }];
}
//申请加入群
- (void)addFriendApplySuccess:(void(^)(DYJXXYGroupByIdResponse *respons))success failed:(void(^)(NSString *errorMsg))fail{
    [SVProgressHUD show];
    DYJXUserModel *userModel = [XYUserDefaults readUserDefaultsLoginedInfoModel];
    NSMutableDictionary *reqDict = [NSMutableDictionary dictionary];
    if (self.ApplyType == 1) {
        [reqDict setObject:[self setAddApplyGroupDataParams] forKey:@"Data"];
    }else {
        [YDBAlertView showToast:@"你还没设置参数中的Data参数" dismissDelay:1.0];
        return;
    }
    [reqDict setObject:userModel.UserID forKey:@"UserID"];
    [reqDict setObject:@"iOS" forKey:@"Device"];
    [reqDict setObject:userModel.ClientId forKey:@"ClientId"];
    [reqDict setObject:userModel.ObjResult forKey:@"DeviceToken"];
    [reqDict setObject:userModel.UserID forKey:@"CertificateId"];
    [reqDict setObject:userModel.MemberID forKey:@"MemberID"];
    
    [XYNetWorking XYPOST:kDYJXAPI_user_AddFriendApply params:reqDict success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([[responseObject objectForKey:@"Succeed"] boolValue]) {
                [SVProgressHUD dismiss];
                //TODO: 数据请求成功数据重组到数组中
                !success ?: success(responseObject);
            }else{
                [YDBAlertView showToast:[responseObject objectForKey:@"Message"] dismissDelay:1.0];
            }
        }else{
            [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
        }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [YDBAlertView showToast:@"连接异常" dismissDelay:1.0];
    }];
}

- (NSDictionary *)setAddApplyGroupDataParams {
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setObject:self.inputTextView.text ?: @"" forKey:@"ApplyContent"];
    [params setObject:@(self.ApplyType) forKey:@"ApplyType"];
    [params setObject:self.response.ParentEnterpriseId forKey:@"FromBelongEnterprise"];
    [params setObject:self.response.GroupNumber forKey:@"GroupID"];
    [params setObject:self.response.ParentEnterpriseId forKey:@"MemberIDFrom"];
    [params setObject:self.response.GroupNumber forKey:@"MemberIDTo"];
    [params setObject:self.response.GroupNumber forKey:@"ToBelongEnterprise"];
    return params;
}

- (UIImageView *)groupImageView {
    if (!_groupImageView) {
        _groupImageView =[[UIImageView alloc]init];
        [self.view addSubview:_groupImageView];
        [_groupImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.equalTo(@(__X(40)));
            make.width.and.height.equalTo(@(__X(160)));
        }];
        _groupImageView.backgroundColor = [UIColor orangeColor];
    }
    return _groupImageView;
}

-(UILabel *)groupNameLb {
    if (!_groupNameLb) {
        _groupNameLb = [[UILabel alloc]init];
        [self.view addSubview:_groupNameLb];
        [_groupNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.groupImageView);
            make.left.equalTo(self.groupImageView.mas_right).offset(__X(20));
            make.right.lessThanOrEqualTo(@(__X(-20)));
        }];
        _groupNameLb.font = [UIFont systemFontOfSize:__X(30)];
        _groupNameLb.textColor = [UIColor blackColor];
    }
    return _groupNameLb;
}

-(UILabel *)groupNumberLb {
    if (!_groupNumberLb) {
        _groupNumberLb = [[UILabel alloc]init];
        [self.view addSubview:_groupNumberLb];
        [_groupNumberLb mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.groupImageView);
            make.bottom.equalTo(self.groupNameLb.mas_top).offset(__X(-10));
            make.left.equalTo(self.groupImageView.mas_right).offset(__X(20));
            make.right.lessThanOrEqualTo(@(__X(-20)));
        }];
        _groupNumberLb.font = [UIFont systemFontOfSize:__X(30)];
        _groupNumberLb.textColor = [UIColor blackColor];
    }
    return _groupNumberLb;
}

-(UILabel *)groupInfo {
    if (!_groupInfo) {
        _groupInfo = [[UILabel alloc]init];
        [self.view addSubview:_groupInfo];
        [_groupInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.groupNameLb.mas_bottom).offset(__X(10));
            make.bottom.equalTo(self.groupImageView);
            make.left.equalTo(self.groupImageView.mas_right).offset(__X(20));
            make.right.lessThanOrEqualTo(@(__X(-20)));
        }];
        _groupInfo.font = [UIFont systemFontOfSize:__X(30)];
        _groupInfo.textColor = [UIColor blackColor];
    }
    return _groupInfo;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        [self.view addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.groupImageView.mas_bottom).offset(__X(40));
            make.left.and.right.equalTo(@0);
            make.width.equalTo(@(__X(2)));
        }];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}

-(UILabel *)inputTitleLb {
    if (!_inputTitleLb) {
        _inputTitleLb = [[UILabel alloc]init];
        [self.view addSubview:_inputTitleLb];
        [_inputTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.mas_bottom).offset(__X(40));
            make.left.equalTo(@(__X(40)));
            make.right.lessThanOrEqualTo(@(__X(40)));
        }];
        _inputTitleLb.text = @"请输入您的请求信息";
        _inputTitleLb.font = [UIFont systemFontOfSize:__X(30)];
        _inputTitleLb.textColor = [UIColor blackColor];
    }
    return _inputTitleLb;
}

-(UITextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[UITextView alloc]init];
        [self.view addSubview:_inputTextView];
        [_inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(__X(40)));
            make.right.equalTo(@(__X(-40)));
            make.top.equalTo(self.inputTitleLb.mas_bottom).offset(__X(40));
            make.height.equalTo(@(__X(400)));
        }];
        _inputTextView.layer.cornerRadius = __X(18);
        _inputTextView.layer.masksToBounds = YES;
        _inputTextView.backgroundColor = [UIColor whiteColor];
    }
    return _inputTextView;
}

-(UIButton *)joinGroupBtn {
    if (!_joinGroupBtn) {
        _joinGroupBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.view addSubview:_joinGroupBtn];
        [_joinGroupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputTextView.mas_bottom).offset(__X(80));
            make.centerX.equalTo(@0);
            make.width.equalTo(@(__X(300)));
            make.height.equalTo(@(__X(80)));
        }];
        _joinGroupBtn.backgroundColor = [UIColor orangeColor];
        [_joinGroupBtn setTitle:@"发送请求" forState:(UIControlStateNormal)];
        [_joinGroupBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_joinGroupBtn addTarget:self action:@selector(joinGroupBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        _joinGroupBtn.layer.cornerRadius = __X(40);
        _joinGroupBtn.layer.masksToBounds = YES;
    }
    return _joinGroupBtn;
}

@end
