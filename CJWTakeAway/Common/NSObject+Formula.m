//
//  NSObject+Formula.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "NSObject+Formula.h"

@implementation NSObject (Formula)

-(CGFloat)resultWithConsult:(CGFloat)consult andValue1:(CJWValue)value1 andValue2:(CJWValue)value2
{
    CGFloat a = (value1.result - value2.result) / (value1.consult - value2.consult);
    CGFloat b = value1.result - (a * value1.consult);
    return a * consult + b;
}

@end
