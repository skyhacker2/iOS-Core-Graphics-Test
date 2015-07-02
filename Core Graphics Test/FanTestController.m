//
//  FanTestController.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/30.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "FanTestController.h"
#import "PreviewView.h"

@interface FanTestController()

@property (weak, nonatomic) IBOutlet PreviewView *previewView;
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray* buttons;

@end

@implementation FanTestController

- (void) viewDidLoad
{
    self.previewView.string = @"Hello NovemberEleven";
    self.previewView.imageName = @"fan.png";
}

- (IBAction)touchLeft2Right:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:0 middleEffect:255 closeEffect:0 finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchRight2Left:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_RIGHT2LEFT middleEffect:255 closeEffect:PREVIEW_RIGHT2LEFT finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchUp2Down:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_UP2DOWN middleEffect:255 closeEffect:PREVIEW_UP2DOWN finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchDown2Up:(id)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_DOWN2UP middleEffect:255 closeEffect:PREVIEW_DOWN2UP finishBlock:^{
        NSLog(@"finish");
    }];
    
}
- (IBAction)touchMiddle2Nearby:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_MIDDLE2NEARBY middleEffect:255 closeEffect:PREVIEW_MIDDLE2NEARBY finishBlock:^{
        NSLog(@"finish");
    }];
    
}
- (IBAction)touchNearby2Middle:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_NEARBY2MIDDLE middleEffect:255 closeEffect:PREVIEW_NEARBY2MIDDLE finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchAllDisplay:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_ALL_DISPLAY middleEffect:255 closeEffect:PREVIEW_ALL_EXTINGUISHES finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchFlash2:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_ALL_DISPLAY middleEffect:PREVIEW_FLASH2 closeEffect:PREVIEW_LEFT2RIGHT finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchRemain:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_RIGHT2LEFT middleEffect:PREVIEW_REMAIN closeEffect:PREVIEW_LEFT2RIGHT finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchAnitClockwise:(id)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_ALL_DISPLAY middleEffect:PREVIEW_ANTICLOCKWISE closeEffect:PREVIEW_LEFT2RIGHT finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchClockwise:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_LEFT2RIGHT middleEffect:PREVIEW_CLOCKWISE closeEffect:PREVIEW_LEFT2RIGHT finishBlock:^{
        NSLog(@"finish");
    }];
}
- (IBAction)touchSequence:(UIButton *)sender {
    [self.previewView runActionWithOpenEffect:PREVIEW_LEFT2RIGHT middleEffect:PREVIEW_CLOCKWISE closeEffect:PREVIEW_LEFT2RIGHT finishBlock:^{
        NSLog(@"下一个动作");
        self.previewView.string = @"我爱你!";
        [self.previewView runActionWithOpenEffect:PREVIEW_DOWN2UP middleEffect:PREVIEW_FLASH2 closeEffect:PREVIEW_RIGHT2LEFT finishBlock:^{
            NSLog(@"finish");
        }];
    }];
}

@end
