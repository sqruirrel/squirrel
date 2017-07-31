//
//  CJWBaseViewController.h
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJWNavigationBar.h"

@interface CJWBaseViewController : UIViewController

//将导航条作为属性公开给子类,让子类可以自己定义属于自己的导航条样式
@property (nonatomic ,strong ,readonly) CJWNavigationBar *navBar;
//navigationItem
@property (nonatomic ,strong ,readonly) UINavigationItem *navItem;
//状态栏颜色
@property (nonatomic ,assign) UIStatusBarStyle stateBarStyle;
@end
