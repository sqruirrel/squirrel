//
//  CJWShopController.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWShopController.h"
#import "CJWFoodDetailController.h"

@interface CJWShopController ()

@end

@implementation CJWShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.navItem.title = @"我喜欢吃";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CJWFoodDetailController *foodVC = [[CJWFoodDetailController alloc] init];
    
    [self.navigationController pushViewController:foodVC animated:YES];
}

@end
