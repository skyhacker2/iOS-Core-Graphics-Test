//
//  AnimationView.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/29.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView


- (void) awakeFromNib{
    NSLog(@"awakeFromNib");
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self addSubview:view1];
    
    [UIView animateWithDuration:3 animations:^{
        view1.backgroundColor = [UIColor greenColor];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
