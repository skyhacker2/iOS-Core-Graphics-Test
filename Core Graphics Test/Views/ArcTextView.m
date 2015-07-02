//
//  ArcTextView.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/26.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "ArcTextView.h"
#import "UIBezierPath+Text.h"
static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation ArcTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"draw rect");
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2 , rect.size.height/2 ) radius:100 startAngle:radians(0) endAngle:radians(360) clockwise:0];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"NovemberEleven NovemberEleven NovemberEleven NovemberEleven NovemberEleven "];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length)];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, string.length)];
    
    [path.reversed drawAttributedString:string];
    
    
    
    CGContextRestoreGState(ctx);
}


@end
