//
//  CJWNavigationController.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWNavigationController.h"
#import "CJWBaseViewController.h"

@interface CJWNavigationController ()

@end

@implementation CJWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏系统自带的导航栏,改用自定义的
    self.navigationBar.hidden = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)pushViewController:(CJWBaseViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    //当不是根控制器的时候,在导航栏上创建一个返回按钮
    if (self.childViewControllers.count > 1) {
        UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem"] style:UIBarButtonItemStylePlain target:self action:@selector(backToLastVC)];
        viewController.navItem.leftBarButtonItem = leftBarBtn;
        
        //刚开始设置完不显示的原因是因为刚开始是在基类中的viewdidload里面添加的导航栏,但是当上面这些代码执行的时候,基类中的viewdidload还没有执行,所以其中的navbar和navitem都没有值,所以在这边不能修改.所以将基类中创建navbar等代码执行优先级提前,放在初始化控制器的时候执行.
}
    
}

//返回上一个控制器
-(void)backToLastVC
{
    [self popViewControllerAnimated:YES];
}



@end
