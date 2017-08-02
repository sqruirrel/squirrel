//
//  CJWLoopView.h
//  CJWTakeAway
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJWLoopModel;
@interface CJWLoopView : UIView

//所有优惠信息
@property (nonatomic, strong) NSArray<CJWLoopModel *> *discounts;

@end
