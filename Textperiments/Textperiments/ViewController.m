//
//  ViewController.m
//  Textperiments
//
//  Created by Adi Mathew on 5/2/16.
//  Copyright © 2016 BumBum & Co. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer *timer;
    NSString *text;
    NSUInteger pos;
}

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

// https://redd.it/3i39hx
// Put the solutuon into -viewDidAppear.
- (void)viewDidLoad {
    [super viewDidLoad];
//    pos = 5;
    text = @"My long text I want to animate on the label";
    timer = [NSTimer timerWithTimeInterval:0.25 target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
    NSRunLoop *rl = [NSRunLoop currentRunLoop];
    [rl addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)updateLabel {
    if (pos > text.length) {
        [timer invalidate];
        timer = nil;
        return;
    }
//    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    NSArray *scaleValues                = [NSArray arrayWithObjects:
//                                           [NSValue valueWithCATransform3D:CATransform3DScale(self.label.layer.transform, 1, 1, 1)],
//                                           [NSValue valueWithCATransform3D:CATransform3DScale(self.label.layer.transform, 1.1, 1.1, 1)],
//                                           [NSValue valueWithCATransform3D:CATransform3DScale(self.label.layer.transform, 1, 1, 1)], nil];
//    [scaleAnimation setValues:scaleValues];
//    scaleAnimation.fillMode             = kCAFillModeForwards;
//    scaleAnimation.removedOnCompletion  = NO;
//    [self.label.layer addAnimation:scaleAnimation forKey:@"scale"];
    self.label.text = [text substringToIndex:pos++];
}

@end