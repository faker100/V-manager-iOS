//
//  TMPersonCollectCell.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMPersonCollectCell.h"

@interface TMPersonCollectCell()
//@property (nonatomic, strong) UIImageView *personImageView;
//@property (nonatomic, strong) UILabel *personNameLabel;
@end

@implementation TMPersonCollectCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        _personImageView = ({
            UIImageView *view = [[UIImageView alloc]init];
            view.contentMode = UIViewContentModeScaleAspectFill;
            view.clipsToBounds = YES;
            view.layer.cornerRadius = 8;
            view;
        });
        
        _personNameLabel = ({
            UILabel *view = [[UILabel alloc]init];
            view.font = Font11;
            view.textColor = [UIColor blackColor];
            view.textAlignment = NSTextAlignmentCenter;
            view;
        });
        
        [self.contentView addSubview:_personImageView];
        [self.contentView addSubview:_personNameLabel];
        
        [_personImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@(50));
        }];
        
        [_personNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_personImageView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    }
    
    return self;
}

+ (NSString *)identifer {
    return @"CellString";
}
@end
