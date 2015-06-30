//
//  WobbleAnimation.m
//  WobbleAnimation
//
//  Created by Jialiang Xiang on 2015-06-25.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "WobbleAnimator.h"

#define ARC4RANDOM_MAX 0x100000000
#define ANIM_TOTOAL_NUM_OF_FRAME 4
#define FRAME_RATE 0.05

@implementation WobbleAnimator {
    UIView* target;
}

- (instancetype)initWithTarget:(UIView*) t
{
    target = t;
    return self;
}

- (void)startAnimation
{
    CAKeyframeAnimation* animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"transform.rotation.z";
    animation1.duration = 0.2;
    animation1.repeatCount = INFINITY;
    
    NSNumber* frame11 = @(0.015);
    NSNumber* frame12 = @(0.005);
    NSNumber* frame13 = @(-0.03);
    NSNumber* frame14 = @(-0.005);
    
    animation1.values = @[frame11,frame12,frame13,frame14];
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [target.layer addAnimation:animation1 forKey:@"wobble_rotation"];
    
    CAKeyframeAnimation* animation2 = [CAKeyframeAnimation animation];
    animation2.keyPath = @"transform.translation";
    animation2.duration = 0.13;
    animation2.repeatCount = INFINITY;
    
    NSValue* frame21 = [NSValue valueWithCGSize:CGSizeMake(-1.0, 0.55)];
    NSValue* frame22 = [NSValue valueWithCGSize:CGSizeMake(0.0, 0.8)];
    NSValue* frame23 = [NSValue valueWithCGSize:CGSizeMake(0.3, -0.4)];
    NSValue* frame24 = [NSValue valueWithCGSize:CGSizeMake(-0.1, 1.0)];
    NSValue* frame25 = [NSValue valueWithCGSize:CGSizeMake(0.55, -0.45)];
    
    animation2.values = @[frame21,frame22,frame23,frame24,frame25];
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [target.layer addAnimation:animation2 forKey:@"wobble_translation"];
}

- (void)stopAnimation
{
    [target.layer removeAnimationForKey:@"wobble_rotation"];
    [target.layer removeAnimationForKey:@"wobble_translation"];
}

@end
