//
//  CJWHeaderView.h
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJWHeaderViewModel;
@interface CJWHeaderView : UIView

//接收模型数据
@property (nonatomic ,strong) CJWHeaderViewModel *headerViewModel;
@end
