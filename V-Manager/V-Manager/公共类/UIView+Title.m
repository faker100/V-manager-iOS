//
//  UIView+Title.m
//  releaselife
//
//  Created by ZhaoMirror on 16/9/5.
//  Copyright © 2016年 mirrorzhao. All rights reserved.
//

#import "UIView+Title.h"

@implementation UIView (Title)
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextSetLineWidth(context, 0.1);
    CGContextMoveToPoint(context, 0,self.frame.size.height-0.1);
    CGContextAddLineToPoint(context,self.frame.size.width, self.frame.size.height-0.1);
    
    
    
    
    CGContextMoveToPoint(context, 0,0.1);
    CGContextAddLineToPoint(context,self.frame.size.width,0.1);
    
    CGContextMoveToPoint(context, 0,40);
    CGContextSetRGBStrokeColor(context, 0.0, 0, 0, 0.5);
    CGContextAddLineToPoint(context,self.frame.size.width, 40);
    
    //    CGContextMoveToPoint(context, 10,self.frame.size.height-50);
    //    CGContextAddLineToPoint(context,self.frame.size.width-10, self.frame.size.height-50);
    
    CGContextStrokePath(context);
}


@end
