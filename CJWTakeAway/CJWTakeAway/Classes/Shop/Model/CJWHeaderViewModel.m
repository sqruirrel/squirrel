//
//  CJWHeaderViewModel.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWHeaderViewModel.h"

@implementation CJWHeaderViewModel

+(instancetype)headerViewModelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //什么都不做,重写此方法解决数据比模型属性多的问题
}
@end
