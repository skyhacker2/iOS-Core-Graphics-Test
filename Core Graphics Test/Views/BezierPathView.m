//
//  BezierPathView.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/25.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    // 画一个多边形
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    // 开始点
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40, 140)];
    [aPath addLineToPoint:CGPointMake(0, 40)];
    [aPath closePath];
    
    // 设置path的颜色
    [[UIColor blackColor] setFill]; // 填充颜色
    [[UIColor redColor]setStroke]; // 描边颜色
    // 先填充，再描边，填充的颜色不会挡着描边的颜色
    
    CGContextSaveGState(aRef);
    [aPath fill];
    [aPath stroke];
    CGContextRestoreGState(aRef);
    
    NSLog(@"%f %f", rect.size.width, rect.size.height);
    
    // 移动原点
    CGContextSaveGState(aRef);
    CGContextTranslateCTM(aRef, 200, 0);
    [aPath fill];
    [aPath stroke];
    CGContextRestoreGState(aRef);
    
    // 圆弧
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:60 startAngle:0 endAngle:DEGREES_TO_RADIANS(90) clockwise:YES];
    
    CGContextSaveGState(aRef);
    [[UIColor blueColor] setStroke];
    [arcPath stroke];
    CGContextRestoreGState(aRef);
    
    
}


@end
