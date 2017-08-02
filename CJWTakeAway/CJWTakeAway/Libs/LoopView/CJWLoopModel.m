//
//  CJWLoopModel.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWLoopModel.h"

@implementation CJWLoopModel

+(instancetype)loopModelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
