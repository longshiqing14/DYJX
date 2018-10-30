//
//  YWDPopupControl.m
//  EA_CloudStoreBuyer
//
//  Created by liruiqin on 15/10/15.
//  Copyright © 2015年 liruiqin. All rights reserved.
//

#import "YWDPopupControl.h"
#import "FXBlurView.h"

static NSMutableArray<YWDPopupControl *> *__popupControlStack;
@interface YWDPopupControl ()<UIGestureRecognizerDelegate>


///自己持有自己，以防止被释放
@property(nonatomic,strong) YWDPopupControl *currentPopupControl;
@property(nonatomic,copy) YWDPopupControlEventHandleBlock hiddenEventHandleBlock;

@end
@implementation YWDPopupControl

static NSMutableDictionary<NSObject *,YWDPopupControlEventHandleBlock> * __observers;
static NSMutableArray * __handleBlocks;
-(instancetype)initWithTargetView:(UIView *)targetView maskView:(UIView *)maskView popupAnimation:(void (^)(UIView *))popupAnimationBlock popupCompletion:(void (^)(BOOL))popupCompletionBlock hiddenAnimation:(void (^)(void))hiddenAnimationBlock hiddenCompletion:(void (^)(BOOL))hiddenCompletionBlock
{
    if (self = [super init]) {
        _targetView = targetView;
        _maskView = maskView;
        _clickMaskToClose = YES;
        self.popupAnimationBlock = popupAnimationBlock;
        self.popupCompletionBlock = popupCompletionBlock;
        self.hiddenAnimationBlock = hiddenAnimationBlock;
        self.hiddenCompletionBlock = hiddenCompletionBlock;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            __observers = [NSMutableDictionary dictionary];
        });
    }
    return self;
}

-(void)addHiddenEvenHandler:(YWDPopupControlEventHandleBlock)handleBlock
{
    self.hiddenEventHandleBlock = handleBlock;
}

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __popupControlStack = [NSMutableArray arrayWithCapacity:2];
    });
}

-(void)dealloc
{
    self.hiddenEventHandleBlock = nil;
    NSLog(@"YWDPopupControl dealloc");
}

-(UIWindow *)keyWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

-(void)clickMaskView
{
    [self hide];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (!self.clickMaskToClose) {
        return NO;
    }
    CGPoint tPoint = [touch locationInView:nil];
    return !CGRectContainsPoint(self.targetView.frame, tPoint);
}

-(void)popup
{
    __weak typeof(self) weakSelf = self;
    if (!self.maskView) {
        self.maskView = [[UIView alloc] initWithFrame:CGRectZero];
        self.maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMaskView)];
    tap.delegate = self;
    [self.maskView addGestureRecognizer:tap];
    
    if (!self.hiddenAnimationBlock) {
        self.hiddenAnimationBlock = ^(){
            weakSelf.targetView.alpha = 0;
        };
    }
    if (!self.popupAnimationBlock) {
        self.popupAnimationBlock = ^(UIView *targetView) {
            
            targetView.alpha = 0;
            [targetView.po_frameBuilder centerInSuperview];
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                targetView.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        };
    }
    
    [self.keyWindow endEditing:YES];
    [self.maskView addSubview:self.targetView];
    [self.targetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
//    self.maskView.frame = self.keyWindow.bounds;
    
    [self.keyWindow addSubview:self.maskView];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    self.popupAnimationBlock(self.targetView);
    self.currentPopupControl = self;
    [__popupControlStack addObject:self];
}

-(void)hide
{
    [UIView animateWithDuration:self.animationDuration animations:self.hiddenAnimationBlock completion:^(BOOL finished) {
        if (finished) {
            if (self.hiddenCompletionBlock) {
                self.hiddenCompletionBlock(finished);
            }
            [self.targetView removeFromSuperview];
            [self.maskView removeFromSuperview];
            self.currentPopupControl = nil;
            if (self.hiddenEventHandleBlock) {
                self.hiddenEventHandleBlock();
            }
            [__popupControlStack removeObject:self];
        }
    }];
}

+(YWDPopupControl *)popupView:(UIView *)targetView onView:(UIView *)oView animation:(void (^)(UIView *))animationBlock
{
    YWDPopupControl *pControl = [[YWDPopupControl alloc] initWithTargetView:targetView maskView:oView popupAnimation:animationBlock popupCompletion:nil hiddenAnimation:nil hiddenCompletion:nil];
    [pControl popup];
    return pControl;
}

+(YWDPopupControl *)popupView:(UIView *)targetView animation:(void (^)(UIView *))animationBlock
{
    /*
    UIView *mView = [self maskView];
    if (!mView) {
        FXBlurView *maskView = [[FXBlurView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        maskView.tag = kPopupViewTag;
        maskView.blurRadius = 5;
        maskView.dynamic = NO;
        maskView.iterations = 1;;
        maskView.tintColor = [UIColor blackColor];
        [[UIApplication sharedApplication].keyWindow addSubview:maskView];
        mView = maskView;
    }
    [mView addSubview:targetView];
    [targetView.po_frameBuilder centerInSuperview];
    if (animationBlock) {
        animationBlock(targetView);
    }
    */
    return [self popupView:targetView onView:nil animation:animationBlock];
}

+(YWDPopupControl *)popupView:(UIView *)showingView
{
    return [self popupView:showingView onView:nil animation:nil];
}

+(void)hide
{
    [__popupControlStack.lastObject hide];
}

+(void)hiddenEvenHandler:(YWDPopupControlEventHandleBlock)handleBlock
{
    __popupControlStack.lastObject.hiddenEventHandleBlock = handleBlock;
    [__popupControlStack.lastObject hide];
}

+(void)hideWithDuration:(CGFloat)duration animations:(void (^)())animationBlock
{
    [self hideWithDuration:duration animations:animationBlock completion:nil];
}

+(void)hideWithDuration:(CGFloat)duration animations:(void (^)())animationBlock completion:(void (^)(BOOL))completeBlock
{
    [self hideTargetView:nil duration:duration animations:animationBlock completion:completeBlock];
}

+(void)hideTargetView:(UIView *)targetView duration:(CGFloat)duration animations:(void (^)())animationBlock completion:(void (^)(BOOL))completeBlock
{
    __popupControlStack.lastObject.animationDuration = duration;
    __popupControlStack.lastObject.hiddenAnimationBlock = animationBlock;
    __popupControlStack.lastObject.hiddenCompletionBlock = completeBlock;
    [__popupControlStack.lastObject hide];
}

@end
