//
//  SimpleMessageCell.m
//  user
//
//  Created by longshiqing on 2018/12/12.
//  Copyright © 2018年 xiaopenglive. All rights reserved.
//

#import "SimpleMessageCell.h"
#import <RongIMKit/RCIM.h>

@interface SimpleMessageCell ()

- (void)initialize;

@end

@implementation SimpleMessageCell

- (NSDictionary *)attributeDictionary {
    if (self.messageDirection == MessageDirection_SEND) {
        return @{
                 @(NSTextCheckingTypeLink) : @{NSForegroundColorAttributeName : [UIColor blueColor]},
                 @(NSTextCheckingTypePhoneNumber) : @{NSForegroundColorAttributeName : [UIColor blueColor]}
                 };
    } else {
        return @{
                 @(NSTextCheckingTypeLink) : @{NSForegroundColorAttributeName : [UIColor blueColor]},
                 @(NSTextCheckingTypePhoneNumber) : @{NSForegroundColorAttributeName : [UIColor blueColor]}
                 };
    }
    return nil;
}

- (NSDictionary *)highlightedAttributeDictionary {
    return [self attributeDictionary];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nickLabel];
        [self addSubview:self.timeLabel];
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.bubbleBackgroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.messageContentView addSubview:self.bubbleBackgroundView];

    self.textLabel = [[RCAttributedLabel alloc] initWithFrame:CGRectZero];
    self.textLabel.attributeDictionary = [self attributeDictionary];
    self.textLabel.highlightedAttributeDictionary = [self highlightedAttributeDictionary];
    [self.textLabel setFont:[UIFont systemFontOfSize:Text_Message_Font_Size]];

    self.textLabel.numberOfLines = 0;
    [self.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.textLabel setTextAlignment:NSTextAlignmentLeft];
    [self.textLabel setTextColor:[UIColor blackColor]];
    //[self.textLabel setBackgroundColor:[UIColor yellowColor]];

    [self.bubbleBackgroundView addSubview:self.textLabel];
    self.bubbleBackgroundView.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    [self.bubbleBackgroundView addGestureRecognizer:longPress];
}

- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];

    [self setAutoLayout];
}
- (void)setAutoLayout {
    self.clipsToBounds = false;
    RCTextMessage *_textMessage = (RCTextMessage *)self.model.content;
    if (_textMessage) {
        self.textLabel.text = _textMessage.content;
    } else {
        //DebugLog(@”[RongIMKit]: RCMessageModel.content is NOT RCTextMessage object”);
    }
    // ios 7

    CGFloat extraHeight = 50;
    self.messageTimeLabel.hidden = YES;
    self.nickLabel.hidden = YES;

    self.messageTimeLabel.frame = CGRectZero;
    for (UIView *subView in self.messageTimeLabel.subviews) {
        NSLog(@"%@",subView);
    }
    self.baseContentView.bounds = CGRectMake(0, 0, kScreenWidth, 100);
    self.messageTimeLabel.marginInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    CGSize globalsSize = [RCIM sharedRCIM].globalMessagePortraitSize;
    CGFloat width = self.baseContentView.bounds.size.width - ((20 + globalsSize.width)*2 + 40);
    CGSize __textSize =
    [_textMessage.content
     boundingRectWithSize:CGSizeMake(width,
                                     MAXFLOAT)
     options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |
     NSStringDrawingUsesFontLeading
     attributes:@{
                  NSFontAttributeName : [UIFont systemFontOfSize:Text_Message_Font_Size]
                  } context:nil]
    .size;
    __textSize = CGSizeMake(ceilf(__textSize.width), ceilf(__textSize.height));
    CGSize __labelSize = CGSizeMake(__textSize.width + 5, __textSize.height + 5);

    CGFloat __bubbleWidth = __labelSize.width + 15 + 20 < 50 ? 50 : (__labelSize.width + 15 + 20);
    CGFloat __bubbleHeight = __labelSize.height + 5 + 5 < 35 ? 35 : (__labelSize.height + 5 + 5);

    CGSize __bubbleSize = CGSizeMake(__bubbleWidth, __bubbleHeight);

    CGRect messageContentViewRect = self.messageContentView.frame;
    self.timeLabel.text = @"2018-12-11 12.45.65";
    self.nickLabel.text = @"wagnshiqing";
    self.timeLabel.frame = CGRectMake((300 - 135)/2.0, 22, 135, 20);

//    self.messageTimeLabel.frame = CGRectMake((300 - 135)/2.0, 22, 135, 20);
//    self.messageTimeLabel.text = @"2018-12-11 12.45.65";
//    self.messageTimeLabel.textColor = [UIColor whiteColor];
//    self.messageTimeLabel.backgroundColor = [UIColor colorWithRed:201/255.0 green:201/255.0 blue:201/255.0 alpha:1];
    self.nickLabel.hidden = !self.nicknameLabel.hidden;


    if (MessageDirection_RECEIVE == self.messageDirection) {
        messageContentViewRect.size.width = __bubbleSize.width;
        self.messageContentView.frame = messageContentViewRect;

        self.bubbleBackgroundView.frame = CGRectMake(0, 0, __bubbleSize.width, __bubbleSize.height);

        self.textLabel.frame = CGRectMake(20, 5, __labelSize.width, __labelSize.height);
        self.bubbleBackgroundView.image = [self imageNamed:@"chat_from_bg_normal" ofBundle:@"RongCloud.bundle"];
        UIImage *image = self.bubbleBackgroundView.image;
        self.bubbleBackgroundView.image = [self.bubbleBackgroundView.image
                                           resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.8,
                                                                                        image.size.height * 0.2, image.size.width * 0.2)];
    } else {
        BOOL isOwerner = NO;
        if (isOwerner) { // 本人
            CGSize globalSize = [RCIM sharedRCIM].globalMessagePortraitSize;
            messageContentViewRect.size.width = __bubbleSize.width;
            messageContentViewRect.origin.x =
            self.baseContentView.bounds.size.width -
            (messageContentViewRect.size.width + 10 + globalSize.width + 10);
            CGFloat originY = (messageContentViewRect.origin.y + extraHeight) > 45 ? (messageContentViewRect.origin.y + extraHeight) : 45;
            messageContentViewRect.origin.y =  originY;
            if ((messageContentViewRect.origin.y + messageContentViewRect.size.height) > 100) {
                messageContentViewRect.origin.y = 38;
            }
            self.messageContentView.frame = messageContentViewRect;
            UIImageView *porImageView = (UIImageView *)self.portraitImageView;
            CGRect porRect = CGRectMake(kScreenWidth - 60, messageContentViewRect.origin.y, globalSize.width, globalSize.height);
            porImageView.frame = porRect;
            self.bubbleBackgroundView.frame = CGRectMake(0, 0, __bubbleSize.width, __bubbleSize.height);

            self.textLabel.frame = CGRectMake(15, 5, __labelSize.width, __labelSize.height);

            self.bubbleBackgroundView.image = [self imageNamed:@"chat_to_bg_normal" ofBundle:@"RongCloud.bundle"];
            UIImage *image = self.bubbleBackgroundView.image;
            self.bubbleBackgroundView.image = [self.bubbleBackgroundView.image
                                               resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.2,
                                                                                            image.size.height * 0.2, image.size.width * 0.8)];
        }
        else {
            CGSize globalSize = [RCIM sharedRCIM].globalMessagePortraitSize;
            messageContentViewRect.size.width = __bubbleSize.width;
            messageContentViewRect.origin.x =
            self.baseContentView.bounds.size.width -
            (messageContentViewRect.size.width + 10 + globalSize.width + 10);
            CGFloat originY = (messageContentViewRect.origin.y + extraHeight) > 45 ? (messageContentViewRect.origin.y + extraHeight) : 60;
            messageContentViewRect.origin.y = originY;

            if ((messageContentViewRect.origin.y + messageContentViewRect.size.height) > 100) { //   超出部分
                messageContentViewRect.origin.y = 38;
                self.nickLabel.frame = CGRectMake(kScreenWidth - 220, messageContentViewRect.origin.y + 7, 120, 14);
            }
            else {
                self.nickLabel.frame = CGRectMake(kScreenWidth - 220, messageContentViewRect.origin.y - 17, 120, 14);
            }

            self.messageContentView.frame = messageContentViewRect;
            UIImageView *porImageView = (UIImageView *)self.portraitImageView;
            CGRect porRect = CGRectMake(kScreenWidth - 60, messageContentViewRect.origin.y, globalSize.width, globalSize.height);

            porImageView.frame = porRect;
            self.bubbleBackgroundView.frame = CGRectMake(0, 0, __bubbleSize.width, __bubbleSize.height);

            self.textLabel.frame = CGRectMake(15, 5, __labelSize.width, __labelSize.height);
            self.textLabel.hidden = NO;
            self.bubbleBackgroundView.image = [self imageNamed:@"chat_to_bg_normal" ofBundle:@"RongCloud.bundle"];
            UIImage *image = self.bubbleBackgroundView.image;
            self.bubbleBackgroundView.image = [self.bubbleBackgroundView.image
                                               resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.2,
                                                                                            image.size.height * 0.2, image.size.width * 0.8)];
        }
    }
}

-(UILabel *)nickLabel {
    if (!_nickLabel) {
        _nickLabel = [[UILabel alloc] init];
        _nickLabel.font = [UIFont systemFontOfSize:13];
        _nickLabel.textColor = [UIColor colorWithRed:139/255.0 green:139/255.0 blue:139/255.0 alpha:1];
        _nickLabel.textAlignment = NSTextAlignmentRight;
    }
    return _nickLabel;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.backgroundColor = [UIColor colorWithRed:201/255.0 green:201/255.0 blue:201/255.0 alpha:1];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.layer.masksToBounds = YES;
        _timeLabel.layer.cornerRadius = 4.0;
    }
    return _timeLabel;
}

- (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName {
    UIImage *image = nil;
    NSString *image_name = [NSString stringWithFormat:@"%@.png", name];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
    NSString *image_path = [bundlePath stringByAppendingPathComponent:image_name];
    image = [[UIImage alloc] initWithContentsOfFile:image_path];

    return image;
}

+(CGSize)sizeForMessageModel:(RCMessageModel *)model withCollectionViewWidth:(CGFloat)collectionViewWidth referenceExtraHeight:(CGFloat)extraHeight {
    return CGSizeMake(300, 100);
}

- (void)longPressed:(id)sender {
    UILongPressGestureRecognizer *press = (UILongPressGestureRecognizer *)sender;
    if (press.state == UIGestureRecognizerStateEnded) {
        //DebugLog(@”long press end”);
        return;
    } else if (press.state == UIGestureRecognizerStateBegan) {
        [self.delegate didLongTouchMessageCell:self.model inView:self.bubbleBackgroundView];
    }
}

@end
