//
//  PreviewView.h
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/30.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"

typedef void (^FinishBlock)();
#define PREVIEW_LEFT2RIGHT 0
#define PREVIEW_RIGHT2LEFT 1
#define PREVIEW_UP2DOWN 2
#define PREVIEW_DOWN2UP 3
#define PREVIEW_MIDDLE2NEARBY 4
#define PREVIEW_NEARBY2MIDDLE 5
#define PREVIEW_ALL_DISPLAY 6
#define PREVIEW_ANTICLOCKWISE 7
#define PREVIEW_CLOCKWISE 8
#define PREVIEW_FLASH2 9
#define PREVIEW_REMAIN 10
#define PREVIEW_ALL_EXTINGUISHES 11

@interface PreviewView : UIView

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *imageName;

- (void) runActionWithOpenEffect: (int)openEffect middleEffect: (int) middleEffect closeEffect: (int) closeEffect finishBlock: (FinishBlock) block;


@end
