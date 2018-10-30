//
//  XYLanuchGuideVideoVC.m
//  user
//
//  Created by xingyun on 2017/10/20.
//  Copyright © 2017年 xiaopenglive. All rights reserved.
//

#import "XYLanuchGuideVideoVC.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "XYTabbarController.h"
@interface XYLanuchGuideVideoVC ()
/** 播放器 */
@property(nonatomic,strong) AVPlayer *player;

/** 倒计时 */
@property(strong,nonatomic) NSTimer *countTimer ;

@property(assign,nonatomic) NSUInteger count ;
/** 立即体验 */
@property(strong,nonatomic) UIButton *experienceBtn ;
@end

static CGFloat const btnH = 40.f;
@implementation XYLanuchGuideVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XYBlackColor;

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    [ud setObject:version forKey:@"version"];
    [ud synchronize];
    [self.player play];
    self.count = 16;//视频长度
    WeakSelf;
    self.countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.countTimer forMode:NSDefaultRunLoopMode];
    
  
 
    [self.view addSubview:self.experienceBtn];
    self.experienceBtn.frame=CGRectMake(35, XYScreenH - btnH-60-34, XYScreenW-70, btnH);
    
}

- (void)timerStart:(NSTimer*)time{
    _count--;
    if (_count == 0) {
        [self.countTimer invalidate];
        [_player pause];
        [self clickToEnterApplication];
    }
};
- (AVPlayer *)player
{
    if (_player == nil) {
        // 1.获取URL(远程/本地)
         NSURL *url = [[NSBundle mainBundle] URLForResource:@"qidong.mp4" withExtension:nil];
//        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
        
        // 2.创建AVPlayerItem
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        
        // 3.创建AVPlayer
        _player = [AVPlayer playerWithPlayerItem:item];
    
        // 4.添加AVPlayerLayer
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        layer.frame = [UIScreen mainScreen].bounds;
        [self.view.layer addSublayer:layer];
    }
    return _player;
}


-(UIButton *)experienceBtn
{

    if (!_experienceBtn) {
        _experienceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_experienceBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        _experienceBtn.enabled = YES;
        _experienceBtn.titleLabel.font = XYFont_15;
        _experienceBtn.layer.cornerRadius = btnH/2.0;
        _experienceBtn.layer.borderColor = XYWhiteColor.CGColor;
        _experienceBtn.layer.borderWidth = 1;
        _experienceBtn.layer.masksToBounds = YES;
        [_experienceBtn addTarget:self action:@selector(clickToEnterApplication) forControlEvents:UIControlEventTouchUpInside];
    }
    return _experienceBtn;
}

-(void)clickToEnterApplication
{
    [self.countTimer invalidate];
    [self.player pause];
    self.player = nil;
    [UIApplication sharedApplication].keyWindow.rootViewController = [[XYTabbarController alloc] init];
    
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
