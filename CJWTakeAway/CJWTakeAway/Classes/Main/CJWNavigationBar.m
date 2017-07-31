//
//  CJWNavigationBar.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWNavigationBar.h"

@implementation CJWNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //将导航条设置透明
        [self setShadowImage:[[UIImage alloc] init]];
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        
        //创建一个imageview  用来当做导航条的背景, 然后设置imageview的透明度
        
        UIImageView *navBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        [self addSubview:navBarView];
        //约束
        [navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
            
        }];
        
        _navBarView = navBarView;
        
    }
    return self;
}
@end
