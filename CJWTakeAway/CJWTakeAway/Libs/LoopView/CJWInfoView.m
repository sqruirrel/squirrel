//
//  CJWInfoView.m
//  CJWTakeAway
//
//  Created by admin on 2017/8/2.
//  Copyright © 2017年 lym. All rights reserved.
//

#import "CJWInfoView.h"
#import "CJWLoopModel.h"

@interface CJWInfoView ()

//图标
@property (nonatomic ,weak) UIImageView *iconView;
//优惠消息
@property (nonatomic ,weak) UILabel *infoLabel;

@end
@implementation CJWInfoView

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
    //图标
    UIImageView *iconView = [[UIImageView alloc] init];
    
    [self addSubview:iconView];
    //约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.offset(0);
        make.width.equalTo(iconView.mas_height);
    }];
    
    //消息
    UILabel *infoLabel = [[UILabel alloc] init];
    infoLabel.text = @"hei";
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:infoLabel];
    
    //约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
        make.centerY.offset(0);
        
    }];
    
    _iconView = iconView;
    _infoLabel = infoLabel;

    
}

-(void)setLoopModel:(CJWLoopModel *)loopModel
{
    _loopModel = loopModel;
    //图标
    [_iconView sd_setImageWithURL:[NSURL URLWithString:loopModel.icon_url]];
    //消息
    _infoLabel.text = loopModel.info;
}

@end
