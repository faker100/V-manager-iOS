//
//  TMMeetServerViewModel.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetServerViewModel.h"
#import "TMMeetServer.h"

@implementation TMMeetServerViewModel

- (void)setModel:(TMMeetServer *)model {
    _model = model;
    
    //计算主体Frame
    [self setBodyFrames];
    
    [self setCellHeight];
}

- (void)setBodyFrames {
    
    self.imgViewFrame = CGRectMake(15, 22, 40, 40);
    
    
    
    CGSize nameSize = [self.model.name sizeWithAttributes:@{NSFontAttributeName : Font13}];
    self.nameFrame = (CGRect){{60,22},nameSize};
    
    
    
    CGSize dateSize = [self.model.date boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : Font11} context:nil].size;
    CGFloat dateX = kScreenW-dateSize.width-8;
    CGFloat dateY = 22+(nameSize.height-dateSize.height)*0.5;
    self.dateFrame = (CGRect){{dateX,dateY},dateSize};
    
    
    
    CGFloat contentX = 60+5;
    CGFloat contentY = CGRectGetMaxY(self.nameFrame)+10;
    CGFloat contentW = kScreenW -60 -8 -5 -5;
    CGSize contentSize = [self.model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : Font11} context:nil].size;
//    if (contentSize.width < contentW) {
//        contentSize.width = contentW;
//    }
//    contentSize.height += 10;
    self.contentFrame = (CGRect){{contentX, contentY},contentSize};
    
    
    CGFloat bgviewX = 60;
    CGFloat bgviewY = CGRectGetMaxY(self.nameFrame)+5;
    //CGFloat bgviewW = kScreenW - 60 -8;
    CGFloat bgviewH = contentSize.height+10;
    self.bgviewFrame = (CGRect){{bgviewX, bgviewY}, {contentSize.width+10, bgviewH}};
}

- (void)setCellHeight {
    self.cellHeight = CGRectGetMaxY(self.bgviewFrame)+10;
}
@end
