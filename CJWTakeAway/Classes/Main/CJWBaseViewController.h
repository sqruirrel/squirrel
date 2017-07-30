//
//  CJWBaseViewController.h
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJWBaseViewController : UIViewController

//将导航条作为属性公开给子类,让子类可以自己定义属于自己的导航条样式
@property (nonatomic ,strong) UINavigationBar *navBar;
@end
