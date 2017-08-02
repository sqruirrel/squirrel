//
//  CJWLoopModel.h
//  CJWTakeAway
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWLoopModel : NSObject
//图标
@property (nonatomic, copy) NSString *icon_url;
//信息
@property (nonatomic, copy) NSString *info;

+ (instancetype)loopModelWithDict:(NSDictionary *)dict;
@end
