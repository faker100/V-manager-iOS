//
//  TMHeaderView.m
//  VHkeeper
//
//  Created by 塔米 on 2018/6/10.
//  Copyright © 2018年 tami. All rights reserved.
//

#import "TMHeaderView.h"

#import "UIButton+cfphelper.h"


@interface TMHeaderView ()

@end

@implementation TMHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        CGFloat width = 50;
        CGFloat top = 15;
        CGFloat height = 100-2*top;
        CGFloat marg = (kScreenW-4*width)/5;
        _PayBtn  = [[UIButton alloc] initWithFrame:CGRectMake(marg, top, width, height)];
        [_PayBtn creatButtonWithImageName:@"pay" andTitleName:@"已付款项" andBgLabelName:@"10%"];
        [self addSubview:_PayBtn];
        
        _ideaBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*marg+width, top, width, height)];
        [_ideaBtn creatButtonWithImageName:@"opinion" andTitleName:@"意见箱" andBgLabelName:@""];
        [self addSubview:_ideaBtn];
       
        _needChangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(3*marg+2*width, top, width, height)];
        [_needChangeBtn creatButtonWithImageName:@"needChange" andTitleName:@"需求变化" andBgLabelName:@""];
        [self addSubview:_needChangeBtn];
        
        _remindBtn = [[UIButton alloc] initWithFrame:CGRectMake(4*marg+3*width, top, width, height)];
        [_remindBtn creatButtonWithImageName:@"Vnoti" andTitleName:@"小V提醒" andBgLabelName:@""];
        [self addSubview:_remindBtn];
      
        /*------------------*/
        
        UIView *midView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-60, kScreenW, 10)];
        [self addSubview:midView];
        midView.backgroundColor = Color(245, 245, 245);
        _midView = midView;
  
        
        /*------------------*/
        
        
        _bottomView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-50, kScreenW, 50)];
        [self addSubview:_bottomView];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 70, 30)];
        [_bottomView addSubview:label];
        label.text = @"活动流程";
        label.font = Font14;
        label.textColor = kRGBColor(35, 35, 35, 1);
        
        
        _lookForBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lookForBtn.frame = CGRectMake(kScreenW-100, 0, 50, 50);
        [_lookForBtn setTitle:@"查看" forState:UIControlStateNormal];
        _lookForBtn.titleLabel.font = Font12;
        [_lookForBtn setTitleColor:kRGBColor(119, 168, 236, 1) forState:UIControlStateNormal];
        [_bottomView addSubview:_lookForBtn];

        
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _editBtn.frame = CGRectMake(kScreenW-50, 0, 50, 50);
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        _editBtn.titleLabel.font = Font12;
        [_editBtn setTitleColor:kRGBColor(119, 168, 236, 1) forState:UIControlStateNormal];
        [_bottomView addSubview:_editBtn];
        //[_editBtn setImage:[UIImage imageNamed:@"laber-show"] forState:UIControlStateNormal];
        //[_editBtn setImage:[UIImage imageNamed:@"laber-show"] forState:UIControlStateSelected];
        //[_editBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -_editBtn.imageView.size.width, 0, _editBtn.imageView.size.width)];
        //[_editBtn setImageEdgeInsets:UIEdgeInsetsMake(15, _editBtn.titleLabel.bounds.size.width, 15, -_editBtn.titleLabel.bounds.size.width)];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _bottomView.height-1, kScreenW, 1)];
        lineView.backgroundColor = Color(245, 245, 245);
        [_bottomView addSubview:lineView];
        
    }
    return self;
}


@end
