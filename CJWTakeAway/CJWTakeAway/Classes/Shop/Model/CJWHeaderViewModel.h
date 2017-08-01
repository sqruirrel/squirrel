//
//  CJWHeaderViewModel.h
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJWHeaderViewModel : NSObject

//背景
@property (nonatomic, copy) NSString *poi_back_pic_url;
//店名
@property (nonatomic, copy) NSString *name;
//头像
@property (nonatomic, copy) NSString *pic_url;
//公告
@property (nonatomic, copy) NSString *bulletin;


+(instancetype)headerViewModelWithDict:(NSDictionary *)dict;

@end
