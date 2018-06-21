//
//  Created by Guo Yu on 15/11/27.
//  Copyright © 2015年 zkbc. All rights reserved.
//

#import "UIButton+cfphelper.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton(cfphelper)

@dynamic normalColor, highlightColor;

- (NSUInteger)cfpStyle {
    return 0;
}

- (void)setCfpStyle:(NSUInteger)cfpStyle {
    switch (cfpStyle) {
        case 0: {
            self.layer.cornerRadius = 4.0f;
            self.backgroundColor = UIColor.whiteColor;
            [self setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:@"user_red_button"] forState:UIControlStateNormal];
            [self setTitleColor:UIColorFromRGBValue(0xf22c2c) forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageNamed:@"user_hollow_button"] forState:UIControlStateHighlighted];
        }
            break;
        case 1: {
            self.layer.cornerRadius = 4.0f;
            self.backgroundColor = UIColor.whiteColor;
            [self setTitleColor:UIColorFromRGBValue(0xf22c2c) forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:@"user_hollow_button"] forState:UIControlStateNormal];
            [self setTitleColor:UIColor.whiteColor forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageNamed:@"user_red_button"] forState:UIControlStateHighlighted];
        }
            break;
        default:
            break;
    }
}

- (void)setNormalColor:(UIColor *)normalColor {
    [self setBackgroundImage:[UIImage n6_imageWithColor:normalColor] forState:UIControlStateNormal];
    [self setBackgroundColor:UIColor.clearColor];
}

- (void)setHighlightColor:(UIColor *)highlightColor {
    [self setBackgroundImage:[UIImage n6_imageWithColor:highlightColor] forState:UIControlStateHighlighted];
    [self setBackgroundColor:UIColor.clearColor];
}

- (void)creatButtonWithImageName:(NSString *)imgName andTitleName:(NSString *)titleName andBgLabelName:(NSString *)bgLabelName {
   
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = self.frame.size.width * .5;
    imgView.image = [UIImage imageNamed:imgName];
    [self addSubview:imgView];
    
    
    UILabel *bgLabel = [[UILabel alloc] init];
    bgLabel.frame = imgView.frame;
    bgLabel.font = Font12;
    bgLabel.text = bgLabelName;
    bgLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:bgLabel];
    

    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height-self.frame.size.width)];
    titleLabel.font = Font12;
    titleLabel.text = titleName;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    
    self.backgroundColor = [UIColor whiteColor];
}
@end
