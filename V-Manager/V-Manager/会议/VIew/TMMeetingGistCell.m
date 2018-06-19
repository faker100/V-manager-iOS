//
//  TMMeetingGistCell.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetingGistCell.h"

@implementation TMMeetingGistCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        _imgView.frame = CGRectMake(0, 0, 40, self.height);
        
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_imgView.frame), 0, 200, self.height)];
        [self.contentView addSubview:_titleL];
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.font = Font12;
       
        _statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _statusBtn.frame = CGRectMake(self.width-50, (self.height-20)*0.5, 40, 20);
        _statusBtn.backgroundColor = [UIColor clearColor];
        _statusBtn.layer.masksToBounds = YES;
        _statusBtn.layer.cornerRadius = 3;
        _statusBtn.layer.borderWidth = 1;
        _statusBtn.titleLabel.font = Font10;
        [_statusBtn setTitle:@"已确认" forState:UIControlStateSelected];
        [_statusBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [_statusBtn setTitle:@"就绪" forState:UIControlStateNormal];
        [_statusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[_statusBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_statusBtn];
    }
    
    return self;
}

- (void)btnClick:(UIButton *)button {
    button.selected = !button.selected;
}

@end
