//
//  TMMeetChatViewModel.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetChatViewModel.h"
#import "TMMeetChat.h"

@implementation TMMeetChatViewModel

- (void)setModel:(TMMeetChat *)model {
    _model = model;
    
    [self setBodyFrames];
    [self setCellHeight];
}

- (void)setBodyFrames {
    
    self.imgViewFrame = CGRectMake(15, 22, 40, 40);
    
    CGSize nameSize = [self.model.name sizeWithAttributes:@{NSFontAttributeName : Font13}];
    self.nameFrame = (CGRect){{60,22},nameSize};
    

    
    
    CGFloat contentX = 60+5;
    CGFloat contentY = CGRectGetMaxY(self.nameFrame)+10;
    CGFloat contentW = kScreenW - 60 - 5 -8 - 5;
    CGSize contentSize = [self.model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : Font11} context:nil].size;
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
