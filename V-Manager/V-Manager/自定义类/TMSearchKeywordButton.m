//
//  TMSearchKeywordButton.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/15.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMSearchKeywordButton.h"
@interface TMSearchKeywordButton()

@property (nonatomic, strong) UIFont *titleFont;

@end
@implementation TMSearchKeywordButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (void)initialize {
    if (self == [TMSearchKeywordButton self]) {
        UIImage *image0 = [UIImage n6_imageWithColor:UIColorFromRGBValue(0xFFFFFF)];
        UIImage *image1 = [UIImage n6_imageWithColor:UIColorFromRGBValue(0xC2C2C2)];
        
        [[self appearance] setBackgroundColor:UIColor.clearColor];
        
        [[self appearance] setBackgroundImage:image0 forState:UIControlStateNormal];
        [[self appearance] setBackgroundImage:image1 forState:UIControlStateSelected];
        
        [[self appearance] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [[self appearance] setTitleFont:[UIFont systemFontOfSize:15]];
        
        [[self appearance] setTitleColor:UIColorFromRGBValue(0xFFFFFF) forState:UIControlStateSelected];
    }
}
- (void)setTitleFont:(UIFont *)font {
    if (_titleFont != font) {
        _titleFont = font;
        self.titleLabel.font = font;
    }
}

@end
