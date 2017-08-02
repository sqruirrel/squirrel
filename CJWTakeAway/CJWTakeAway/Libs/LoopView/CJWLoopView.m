//
//  CJWLoopView.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWLoopView.h"
#import "CJWInfoView.h"

@interface CJWLoopView ()

//两个view
@property (nonatomic ,weak) CJWInfoView *infoView1;
@property (nonatomic ,weak) CJWInfoView *infoView2;

//索引 标记数据
@property (nonatomic ,assign) NSInteger index;

@end
@implementation CJWLoopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    //创建两个view
    CJWInfoView *infoView1 = [[CJWInfoView alloc] init];
    [self addSubview:infoView1];
    //约束
    [infoView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-16);
    }];

    CJWInfoView *infoView2 = [[CJWInfoView alloc] init];
    [self addSubview:infoView2];
    //约束
    [infoView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoView1).offset(0);
        make.top.equalTo(infoView1.mas_bottom).offset(0);
        make.width.height.equalTo(infoView1).offset(0);
    }];
    
    _infoView1 = infoView1;
    _infoView2 = infoView2;
}

-(void)setDiscounts:(NSArray<CJWLoopModel *> *)discounts
{
    _discounts = discounts;
    
    [self setValue];
    
    [self scroll];
}

-(void)setValue
{
    _infoView1.loopModel = _discounts[_index];
    _infoView2.loopModel = _discounts[(_index + 1) % 7];
}

- (void)scroll
{
    // 延迟两秒之后去滚动
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 动画的方式整体向上滚动
        [UIView animateWithDuration:0.5 animations:^{
            
            _infoView1.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            _infoView2.transform = CGAffineTransformMakeTranslation(0, -self.bounds.size.height);
            
            
        } completion:^(BOOL finished) {
            // 让索引++ 准备显示整体向下一条显示
            _index = (_index + 1) % 7;
            // 重新设置数据
            [self setValue];
            
            // 让两个infoView都回到初始位置
            _infoView1.transform = CGAffineTransformIdentity;
            _infoView2.transform = CGAffineTransformIdentity;
            
            // 滚动
            [self scroll];
        }];
        
        
        
    });
    
}

@end
