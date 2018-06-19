//
//  UIView+Title.h
//  releaselife
//
//  Created by ZhaoMirror on 16/9/5.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface UIView (Title)


@property (nonatomic, assign) IBInspectable NSUInteger cfpStyle;
@property (nonatomic, strong) IBInspectable UIColor *normalColor;
@property (nonatomic, strong) IBInspectable UIColor *highlightColor;

@end
