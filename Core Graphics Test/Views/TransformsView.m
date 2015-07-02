//
//  TransformsView.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/25.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "TransformsView.h"
#include <math.h>
static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation TransformsView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat centerX = rect.size.width/2;
    CGFloat centerY = rect.size.height/2;
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect aRect = CGRectMake(-width/2, -height/2, width, height);
    UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:aRect];
    
    [[UIColor blueColor] setFill];
    
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    // TranslateCTM
    // 移动原点
    //CGContextTranslateCTM(aRef, 100, 100);
    
    // RotateCTM
    CGContextTranslateCTM(aRef, centerX, centerY);
    CGContextRotateCTM(aRef, radians(45));
    
    // ScaleCTM
    CGContextScaleCTM(aRef, 0.5, 1);
    
    [aPath fill];
    
}


@end
