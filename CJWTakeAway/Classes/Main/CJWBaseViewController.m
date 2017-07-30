//
//  CJWBaseViewController.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWBaseViewController.h"

@interface CJWBaseViewController ()

@end

@implementation CJWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [self.view addSubview:navBar];
    //约束
    [navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(64);
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
