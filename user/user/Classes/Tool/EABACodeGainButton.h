//
//  EABACodeGainButton.h
//  EABuyerAPP
//
//  Created by liupeng on 9/26/16.
//  Copyright © 2016 eascs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EABACodeGainButton;
typedef NSString* (^DidChangeBlock)(EABACodeGainButton *countDownButton,int second);
typedef NSString* (^DidFinishedBlock)(EABACodeGainButton *countDownButton,int second);
typedef void (^TouchedDownBlock)(EABACodeGainButton *countDownButton, NSInteger tag);

@interface EABACodeGainButton : UIButton
{
    int _second;
    int _totalSecond;
    NSTimer *_timer;
    DidChangeBlock _didChangeBlock;
    DidFinishedBlock _didFinishedBlock;
    TouchedDownBlock _touchedDownBlock;
}

@property (nonatomic,assign) BOOL isCanClick;
@property (nonatomic,assign) BOOL isCountDown;
@property (nonatomic,assign) NSInteger textLength;
@property (nonatomic,assign) BOOL isSelected;//用于支付

-(void)addToucheHandler:(TouchedDownBlock)touchHandler;
-(void)didChange:(DidChangeBlock)didChangeBlock;
-(void)didFinished:(DidFinishedBlock)didFinishedBlock;
-(void)startWithSecond:(int)second;
- (void)stop;
@end
