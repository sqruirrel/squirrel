//
//  CJWShopController.m
//  CJWTakeAway
//
//  Created by admin on 2017/7/30.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWShopController.h"
#import "CJWFoodDetailController.h"
#import "NSObject+Formula.h"
#import "CJWNavigationBar.h"
#import "CJWEvaluateController.h"
#import "CJWBusinessController.h"
#import "CJWCommodityController.h"
#import "UIColor+Addition.h"
#import "CJWHeaderView.h"
#import "CJWHeaderViewModel.h"


@interface CJWShopController ()<UIScrollViewDelegate>

//将头部视图定义成属性,在手势方法中更新约束
@property (nonatomic ,weak) UIView *shopHeaderView;
//分享按钮
@property (nonatomic ,weak) UIBarButtonItem *rightBarBtn;
//标签栏
@property (nonatomic ,weak) UIView *tagView;
//小黄条
@property (nonatomic ,weak) UIView *yellowView;
//滚动视图
@property (nonatomic ,weak) UIScrollView *scrollView;
//定义数组存放模型数据
//@property (nonatomic ,strong) NSArray *jsonData;
//定义模型属性
@property (nonatomic ,strong) CJWHeaderViewModel *headerViewModel;
@end

@implementation CJWShopController

- (void)viewDidLoad {
   
    //加载数据
    [self loadHeaderViewData];
    //创建头部视图
    [self setUpHeaderView];
    
    [self defaultSetting];
    //添加导航条和滚动视图
    [self setUpUI];
    
    //这个super执行的时候会去执行父类的代码,包括创建添加导航条
     [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    
}

- (void)setUpUI
{
    //创建标签栏
    [self setUpTagView];
    //创建滚动视图
    [self setUpScrollView];
    
}



//创建标签栏的方法
- (void)setUpTagView
{
    //创建标签栏
    UIView *tagView = [[UIView alloc] init];
    //颜色
    tagView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tagView];
    
    //约束
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(_shopHeaderView.mas_bottom).offset(0);
        make.height.offset(44);
    }];
    
    _tagView = tagView;
    
    //创建按钮
   UIButton *btn = [self setUpBtnWithTitle:@"点菜"];
    //初始字体
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self setUpBtnWithTitle:@"评价"];
    [self setUpBtnWithTitle:@"商家"];
    
    //约束
    [tagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [tagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    //创建小黄条
    UIView *yellowView = [[UIView alloc] init];
    //设置
    yellowView.backgroundColor = [UIColor colorWithHex:0xfed30a];
    //添加
    [tagView addSubview:yellowView];
    //约束
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(tagView.subviews.firstObject.mas_centerX).offset(0);
        make.height.offset(4);
        make.width.offset(50);
        make.bottom.offset(0);
    }];
    _yellowView = yellowView;
    
}


//创建按钮的方法
- (UIButton *)setUpBtnWithTitle:(NSString *)title
{
    //创建按钮
    UIButton *btn = [[UIButton alloc] init];
    //设置按钮文字
    [btn setTitle:title forState:UIControlStateNormal];
    //按钮字体
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    //字体颜色
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    //添加监听
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置按钮的tag
    btn.tag = _tagView.subviews.count;
    
    //添加
    [_tagView addSubview:btn];
 
//    NSLog(@"%zd",btn.tag);
    return btn;
    
}

//按钮的监听方法
- (void)btnClick:(UIButton *)btn
{
    //点击按钮,控制滚动视图滚动到相应的页数
     [_scrollView setContentOffset:CGPointMake(btn.tag * _scrollView.bounds.size.width, 0) animated:YES];
}

//创建滚动视图方法
- (void)setUpScrollView
{
    //创建scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scrollView];
    
    //设置分页  滚动条  弹簧
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    //约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.top.equalTo(_tagView.mas_bottom).offset(0);
    }];
    //创建三个scrollview的子视图
    CJWCommodityController *vc1 = [[CJWCommodityController alloc] init];
    CJWEvaluateController *vc2 = [[CJWEvaluateController alloc] init];
    CJWBusinessController *vc3 = [[CJWBusinessController alloc] init];
    
    //建立一个数组存放三个控制器
    NSArray *vcArr = @[vc1,vc2,vc3];
    
    //遍历,依次将三个控制器的view添加到滚动视图中,然后建立父子控制器关系
    for (UIViewController *vc in vcArr) {
        //将子视图添加到滚动视图中
        [scrollView addSubview:vc.view];
        //建立父子控制器关系
        [self addChildViewController:vc];
        //通知父控制器 已经创建联系
        [vc didMoveToParentViewController:self];
        
    }
    
    //约束  需要明确的宽高来计算contentsize
    [scrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        //height不能让代码自己计算,需要给一个明确的... 虽然设置了bottom和top,但是不设置height的话依旧无法滚动
        make.width.height.equalTo(scrollView);
    }];
    
    [scrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    scrollView.delegate = self;
    
    _scrollView = scrollView;
    
}

//监听scrollView滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //实时获取滚动视图的页数,并且取小数
    CGFloat page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //修改小黄条的transform让其实现实时滚动
    _yellowView.transform = CGAffineTransformMakeTranslation(_tagView.bounds.size.width / 3 * page, 0);
    
    
}

//当滚动减速完成的时候,改变标签栏按钮字体
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //遍历子控件
    for (NSInteger i = 0; i < scrollView.subviews.count; i++) {
        
        if (_tagView.subviews[i].tag == page) {
            
            ((UIButton *)_tagView.subviews[i]).titleLabel.font = [UIFont boldSystemFontOfSize:14];
        }
        else{
             ((UIButton *)_tagView.subviews[i]).titleLabel.font = [UIFont systemFontOfSize:14];
        }
        
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //滚动动画结束的时候 在调用一下改变按钮字体颜色的方法
     [self scrollViewDidEndDecelerating:scrollView];
}



//默认设置
- (void)defaultSetting
{
    self.navItem.title = @"我喜欢吃";
    
    //添加右边分享按钮
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:self action:@selector(xxxx)];
    self.navItem.rightBarButtonItem = rightBarBtn;
    rightBarBtn.tintColor = [UIColor whiteColor];
    
    //导航条初始背景完全透明
    self.navBar.navBarView.alpha = 0;
    
    //设置状态栏一开始为白色
    self.stateBarStyle = UIStatusBarStyleLightContent;
    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    //添加手势
    [self.view addGestureRecognizer:pan];

    
      _rightBarBtn = rightBarBtn;

}

//创建头部视图
- (void)setUpHeaderView
{
    //创建首页视图的头部视图
    CJWHeaderView *shopHeaderView = [[CJWHeaderView alloc] init];
    shopHeaderView.backgroundColor = [UIColor purpleColor];
    //添加到父控制器
    [self.view addSubview:shopHeaderView];
    //约束
    [shopHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(180);
        
    }];
    
    _shopHeaderView = shopHeaderView;
    //创建完成头部视图后,给内部子控件传数据
    shopHeaderView.headerViewModel = _headerViewModel;
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
    
    //设置导航条imageview的透明度
    CGFloat alpha = [self resultWithConsult:_shopHeaderView.bounds.size.height andValue1:CJWValueMake(64, 1) andValue2:CJWValueMake(180, 0)];
    //设置导航条背景透明度
    self.navBar.navBarView.alpha = alpha;
    
    CGFloat gray = [self resultWithConsult:_shopHeaderView.bounds.size.height andValue1:CJWValueMake(180, 1) andValue2:CJWValueMake(64, 0.4)];
    //设置分享按钮
    _rightBarBtn.tintColor = [UIColor colorWithWhite:gray alpha:1];
    
    //当高度为180的时候,状态栏用白色,其他时候为黑色
    if (_shopHeaderView.bounds.size.height == 180) {
        self.stateBarStyle = UIStatusBarStyleLightContent;

    }else {
        
        self.stateBarStyle = UIStatusBarStyleDefault;
    }
    
    //重置距离
    [pan setTranslation:CGPointZero inView:pan.view];
    
}


//加载数据
- (void)loadHeaderViewData
{
    //将json文件转为data文件
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil]];
    //将data文件转成字典
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    //获取需要的数据
    NSDictionary *dict = jsonDict[@"data"][@"poi_info"];
    CJWHeaderViewModel *headerViewModel = [CJWHeaderViewModel headerViewModelWithDict:dict];
    _headerViewModel = headerViewModel;
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    CJWFoodDetailController *foodVC = [[CJWFoodDetailController alloc] init];
//    
//    [self.navigationController pushViewController:foodVC animated:YES];
//}




@end
