//
//  CJWHeaderView.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/1.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWHeaderView.h"

@interface CJWHeaderView ()
//滚动视图
@property (nonatomic ,weak) UIView *loopView;

//头像
@property (nonatomic ,strong)UIImageView *iconView;
//背景
@property (nonatomic ,weak) UIImageView *backGroundView;
//公告
@property (nonatomic ,weak)UILabel *bulletinLabel;
//店名
@property (nonatomic ,weak) UILabel *nameLabel;
@end
@implementation CJWHeaderView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

//布局头部视图界面控件
-(void)setUpUI
{
    //创建背景
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.backgroundColor = [UIColor orangeColor];
    [self addSubview:bgView];
    //约束
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //添加轮播
    UIView *loopView = [[UIView alloc] init];
    loopView.backgroundColor = [UIColor redColor];
    [self addSubview:loopView];
    //约束
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-8);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(20);
    }];
    
    //虚线
    UIView *dashLineView = [[UIView alloc] init];
    dashLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:dashLineView];
    //约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView.mas_left).offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.right.offset(0);
        make.height.offset(2);
    }];
    
    //头像
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.backgroundColor = [UIColor blackColor];
    [self addSubview:iconView];
    //约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(64);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.left.equalTo(dashLineView.mas_left).offset(0);
        
    }];
    //切圆角
    iconView.layer.cornerRadius = 32;
    iconView.clipsToBounds = YES;
    
    //店名
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"黄焖鸡米线";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:nameLabel];
    //约束
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView.mas_centerY).offset(-16);
        make.left.equalTo(iconView.mas_right).offset(16);
    }];
    
    //公告
    UILabel *bulletinLabel = [[UILabel alloc] init];
    bulletinLabel.text = @"山寨高仿二手五折鸡";
    bulletinLabel.textColor = [UIColor colorWithWhite:1 alpha:0.9];
    bulletinLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:bulletinLabel];
    //约束
    [bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView.mas_centerY).offset(16);
        make.left.equalTo(iconView.mas_right).offset(16);
        
    }];
    
    
    
}

//给子控件设置数据
-(void)setHeaderViewModel:(CJWHeaderViewModel *)headerViewModel
{
    
    _headerViewModel = headerViewModel;
 
}

@end