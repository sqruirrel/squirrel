//
//  CJWHeaderViewModel.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWHeaderViewModel.h"
#import "CJWLoopModel.h"

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
    //套一层转模型 将数据存进
    if([key isEqualToString:@"discounts2"]){
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in value) {
        CJWLoopModel *loopModel = [CJWLoopModel loopModelWithDict:dict];
        [arrM addObject:loopModel];
    }
          _discounts = arrM.copy;
    }
    
  
}
@end
