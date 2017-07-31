//
//  NSObject+Formula.h
//  CJWTakeAway
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <Foundation/Foundation.h>

struct CJWValue {
    CGFloat consult;
    CGFloat result;
};
typedef struct CJWValue CJWValue;

CG_INLINE CJWValue
CJWValueMake(CGFloat consult, CGFloat result)
{
    CJWValue value; value.consult = consult; value.result = result; return value;
}


@interface NSObject (Formula)


-(CGFloat)resultWithConsult:(CGFloat)consult andValue1:(CJWValue)value1 andValue2:(CJWValue)value2;
@end
