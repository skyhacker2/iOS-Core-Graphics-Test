//
//  FontView.m
//  Core Graphics Test
//
//  Created by Eleven Chen on 15/6/25.
//  Copyright (c) 2015年 Eleven. All rights reserved.
//

#import "FontView.h"

@implementation FontView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    // Drawing code
    int size = 11; // 字体大小
//    UIFont *font = [UIFont systemFontOfSize:size];
    UIFont *font = [UIFont fontWithName:@"DroidSansFallback" size:size];
//    UIFont *font = [UIFont fontWithName:@"MicrosoftYaHei" size:size];
//    UIFont *font = [UIFont fontWithName:@"SimSun" size:size];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter; // 文字居中
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : [UIColor blueColor],
                             NSParagraphStyleAttributeName: style,
                             NSFontAttributeName: font };
    
    NSString* rawText = @"Love ♥︎";
    
    //
    int w = size * rawText.length;  // 图片宽
    int h = size;                   // 图片高
    // 开始一个bitmap的context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(w, h), NO, 1.0);
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    CGContextSetShouldAntialias(aRef, NO);
    CGContextSetShouldSmoothFonts(aRef, YES);
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(0, 0, w, h));
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:rawText attributes:attrs];
    [text drawInRect:CGRectMake(0, -3, w, h+3)]; // 把文字画到bitmap上
    // 注释的代码是分别把每一个字画到bitmap上
    // 但是对于特殊的字符没法显示
//    for (int i = 0; i < rawText.length; i++) {
//        NSString* subString = [rawText substringWithRange:NSMakeRange(i, 1)];
//        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:subString attributes:attrs];
//        [text drawInRect:CGRectMake(size * i, -2, size, h+2) ];
////        [text drawWithRect:CGRectMake(size * i, -2, size, h+2) options:nil context:nil];
//    }
    
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
//    UIImage *image = [UIImage imageNamed:@"Image.png"];
    
    UIGraphicsEndImageContext();

    
    // 获取图片的像素数据
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSLog(@"width: %lu, height: %lu", (unsigned long)width, (unsigned long)height);
    int bytePerPiexl = 4;
    long bytesPerRow = bytePerPiexl * width;
    int bitsPerComponent = 8;
    
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    unsigned char* pixelData = rawData;
    
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (int i = 0; i < height; i++) {
        mutableString = [[NSMutableString alloc] init];
        for (int j = 0; j < width; j++) {
            UInt8 blue = pixelData[(i * w + j) * 4 + 2]; // 获取蓝色值
            //NSLog(@"r:%d g:%d: b:%d", red, green, blue);
//            [mutableString appendFormat:@"%d ", red];
            if (blue == 255) {
                //NSLog(@"%d", blue);
                [mutableString appendString:@"● "];
            } else {
                [mutableString appendString:@"○ "];
            }
        }
        NSLog(@"%@", mutableString);
    }
    
    [image drawAtPoint:CGPointMake(rect.size.width/2 - w/2, rect.size.height/2 - h/2)];
    
    // 把图片保存到本地，
    // 方便用ps打开观察
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Image.png"];
    NSLog(@"filePath %@", filePath);
    [UIImagePNGRepresentation(image) writeToFile:filePath atomically:YES];

}


@end
