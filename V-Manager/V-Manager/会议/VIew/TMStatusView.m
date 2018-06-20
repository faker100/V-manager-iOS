//
//  TMStatusView.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMStatusView.h"

@implementation TMStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}

- (void)addChildView {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.width = 10;
    imgView.height = 10;
    imgView.x = self.width/2-5;
    imgView.y = self.height/3+5;
    [self addSubview:imgView];
    imgView.image = [UIImage imageNamed:@"通用_删除"];
    self.imgView = imgView;
    
    UILabel *leftL = [[UILabel alloc] init];
    leftL.x = 0;
    leftL.centerY = imgView.centerY;
    leftL.height = 3;
    leftL.width = self.width/2 - imgView.width/2;
    [self addSubview:leftL];
    self.leftL = leftL;
    
    UILabel *rightL = [[UILabel alloc] init];
    rightL.centerY = imgView.centerY;
    rightL.height = 3;
    rightL.width = self.width/2 - imgView.width/2;
    rightL.x = CGRectGetMaxX(imgView.frame);
    [self addSubview:rightL];
    self.rightL = rightL;
    
    leftL.backgroundColor = [UIColor redColor];
    rightL.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.x = 0;
    titleLabel.y = self.height/2;
    titleLabel.width = self.width;
    titleLabel.height = self.height/2;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = Font11;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleL = titleLabel;
    
}

@end
