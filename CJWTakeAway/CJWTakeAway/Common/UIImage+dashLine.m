//
//  UIImage+dashLine.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "UIImage+dashLine.h"

@implementation UIImage (dashLine)

+ (instancetype)dashLineWithColor:(UIColor *)color
{
    //开启图片类型上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(8, 1), NO, 0);
    //获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //画图
    CGContextMoveToPoint(ref, 0, 1);
    CGContextAddLineToPoint(ref, 8, 1);
    //创建虚线
    CGFloat lengths[] = {4,2};
    CGContextSetLineDash(ref, 0, lengths, 2);
    //设置颜色
    [color set];
    //渲染
    CGContextStrokePath(ref);
    //截图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
