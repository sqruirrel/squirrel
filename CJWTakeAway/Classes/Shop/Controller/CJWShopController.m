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

//将头部视图定义成属性,在手势方法中更新约束
@property (nonatomic ,weak) UIView *shopHeaderView;
@end

@implementation CJWShopController

- (void)viewDidLoad {
   
    
    //创建首页视图的头部视图
    UIView *shopHeaderView = [[UIView alloc] init];
    shopHeaderView.backgroundColor = [UIColor purpleColor];
    //添加到父控制器
    [self.view addSubview:shopHeaderView];
    //约束
    [shopHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
        
    }];
    
    //这个super执行的时候会去执行父类的代码,包括创建添加导航条
     [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    self.navItem.title = @"我喜欢吃";

    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    //添加手势
    [self.view addGestureRecognizer:pan];
    
    
    
    _shopHeaderView = shopHeaderView;
    
}

//手势方法
- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    //平移距离
    CGPoint p = [pan translationInView:pan.view];
    
    //更新约束
    [_shopHeaderView mas_updateConstraints:^(MASConstraintMaker *make) {
        if(p.y + _shopHeaderView.bounds.size.height < 64){
            make.height.offset(64);
        }else if(p.y + _shopHeaderView.bounds.size.height >= 180){
            make.height.offset(180);
        }else{
             make.height.offset(p.y + _shopHeaderView.bounds.size.height);
        }
        
    }];
    
    //重置距离
    [pan setTranslation:CGPointZero inView:pan.view];
    
}




//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    CJWFoodDetailController *foodVC = [[CJWFoodDetailController alloc] init];
//    
//    [self.navigationController pushViewController:foodVC animated:YES];
//}




@end
