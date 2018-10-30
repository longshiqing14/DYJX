//
//  JXConfirmSuccessViewController.m
//  user
//
//  Created by liu_yakai on 2018/1/27.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "JXConfirmSuccessViewController.h"

@interface JXConfirmSuccessViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabe;
@end

@implementation JXConfirmSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"确认收货成功";//oderSuccess
    [self ConfirmSuccesslayer];
}

-(void)black_controller{
    UIViewController *viewController=self.navigationController.viewControllers[1];
    [self.navigationController popToViewController:viewController animated:YES];
}

-(void)ConfirmSuccesslayer{
    WeakSelf;
    [self.view addSubview:self.imageView];
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top);
        make.centerX.mas_equalTo(0);
//        make.right.mas_equalTo(weakSelf.view.mas_right);
    }];
    [self.view addSubview:self.titleLabe];
    [self.titleLabe mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imageView.mas_bottom);
        make.centerX.mas_equalTo(0);
    }];
}


-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        _imageView.image=SETIMAGENAME(@"oderSuccess");
    }
    return _imageView;
}

-(UILabel *)titleLabe{
    if (!_titleLabe) {
        _titleLabe=[[UILabel alloc]init];
        _titleLabe.text=@"订单确认收货成功！";
        _titleLabe.textColor=XYRGBAColor(236,59,44, 1);
        _titleLabe.font=[UIFont systemFontOfSize:15];
    }
    return _titleLabe;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
