//
//  MeetingHeaderView.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/13.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MeetingHeaderView.h"
#import <Masonry.h>

@interface MeetingHeaderView ()

@property (nonatomic, strong) UILabel *meetingLabel;

@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *positionLabel;

@property (nonatomic, strong) UILabel *personLabel;

@property (nonatomic, strong) UILabel *expectedNumLabel;

@property (nonatomic, strong) UILabel *expectedLabel;

@property (nonatomic, strong) UILabel *keepNumLabel;

@property (nonatomic, strong) UILabel *keepLabel;

@property (nonatomic, strong) UILabel *factNumLabel;

@property (nonatomic, strong) UILabel *factLabel;
@end

@implementation MeetingHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addChildView];
    }
    
    return self;
}

- (void)addChildView {
    
    //UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    //bgView.backgroundColor = _bgColor;
    //[self addSubview:bgView];
    
    self.meetingLabel = [[UILabel alloc] init];
    self.meetingLabel.textColor = [UIColor whiteColor];
    self.meetingLabel.textAlignment = NSTextAlignmentLeft;
    self.meetingLabel.font = Font20;
    [self addSubview:self.meetingLabel];
    self.meetingLabel.text = @"2018中国绿公司年会";

    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    self.dateLabel.font = Font12;
    [self addSubview:self.dateLabel];
    self.dateLabel.text = @"5月18日 9:00 - 17:00";
    
    self.positionLabel = [[UILabel alloc] init];
    self.positionLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.positionLabel.textAlignment = NSTextAlignmentLeft;
    self.positionLabel.font = Font12;
    [self addSubview:self.positionLabel];
    self.positionLabel.text = @"红宾厅";

    self.personLabel = [[UILabel alloc] init];
    self.personLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.personLabel.textAlignment = NSTextAlignmentLeft;
    self.personLabel.font = Font12;
    [self addSubview:self.personLabel];
    self.personLabel.text = @"张帅";
    
    
     _EOButton = [UIButton buttonWithType:UIButtonTypeCustom];
     _EOButton.backgroundColor = kRGBColor(89, 102, 128, 1);
     _EOButton.layer.masksToBounds = YES;
     _EOButton.layer.cornerRadius = 5;
     [_EOButton setTitle:@"查看EO单" forState:UIControlStateNormal];
     _EOButton.titleLabel.font = Font12;
     [_EOButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_EOButton];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = kRGBColor(0, 0, 0, 0.2);
    [self addSubview:bottomView];
    

    [self.meetingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(15);
        make.height.mas_equalTo(30);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(self.meetingLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];

    [self.positionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(self.dateLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.mas_equalTo(self.positionLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.EOButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-16);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(70);
        make.bottom.mas_equalTo(-60);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(45);
    }];
    
    self.expectedNumLabel = [[UILabel alloc] init];
    self.expectedNumLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.expectedNumLabel.textAlignment = NSTextAlignmentCenter;
    self.expectedNumLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.expectedNumLabel];
    
    self.expectedLabel = [[UILabel alloc] init];
    self.expectedLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.expectedLabel.textAlignment = NSTextAlignmentCenter;
    self.expectedLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.expectedLabel];
    
    self.keepNumLabel = [[UILabel alloc] init];
    self.keepNumLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.keepNumLabel.textAlignment = NSTextAlignmentCenter;
    self.keepNumLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.keepNumLabel];
    
    self.keepLabel = [[UILabel alloc] init];
    self.keepLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.keepLabel.textAlignment = NSTextAlignmentCenter;
    self.keepLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.keepLabel];
    
    self.factNumLabel = [[UILabel alloc] init];
    self.factNumLabel.textColor = [UIColor redColor];
    self.factNumLabel.textAlignment = NSTextAlignmentCenter;
    self.factNumLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.factNumLabel];
    
    self.factLabel = [[UILabel alloc] init];
    self.factLabel.textColor = kRGBColor(220, 220, 220, 1);
    self.factLabel.textAlignment = NSTextAlignmentCenter;
    self.factLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.factLabel];
    
    self.expectedNumLabel.text = @"0";
    self.expectedLabel.text = @"预计人数";
    self.keepNumLabel.text = @"0";
    self.keepLabel.text = @"保底人数";
    self.factNumLabel.text = @"0";
    self.factLabel.text = @"实到人数";
    
    [self.expectedNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView);
        make.left.mas_equalTo(bottomView);
        make.width.mas_equalTo(kScreenW/3);
        make.height.mas_equalTo(25);
    }];
    
    [self.expectedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.expectedNumLabel.mas_bottom);
        make.left.mas_equalTo(bottomView);
        make.width.mas_equalTo(kScreenW/3);
        make.bottom.mas_equalTo(bottomView.mas_bottom);
    }];
    

    [self.keepNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView);
        make.left.mas_equalTo(kScreenW/3);
        make.width.mas_equalTo(kScreenW/3);
        make.height.mas_equalTo(25);
    }];
    
    [self.keepLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.keepNumLabel.mas_bottom);
        make.left.mas_equalTo(kScreenW/3);
        make.width.mas_equalTo(kScreenW/3);
        make.bottom.mas_equalTo(bottomView.mas_bottom);
    }];
    
    [self.factNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bottomView);
        make.left.mas_equalTo(kScreenW/3*2);
        make.width.mas_equalTo(kScreenW/3);
        make.height.mas_equalTo(25);
    }];
    
    [self.factLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.factNumLabel.mas_bottom);
        make.left.mas_equalTo(kScreenW/3*2);
        make.width.mas_equalTo(kScreenW/3);
        make.bottom.mas_equalTo(bottomView.mas_bottom);
    }];
}

@end










