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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //添加导航栏
        UINavigationBar *navBar = [[UINavigationBar alloc] init];
       
        
        
        UINavigationItem *navItem = [[UINavigationItem alloc] init];
        //建立联系
        [navBar setItems:@[navItem]];
        
        
        
        
        _navBar = navBar;
        _navItem = navItem;
        
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.view addSubview:_navBar];
    //约束
    [_navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(64);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
