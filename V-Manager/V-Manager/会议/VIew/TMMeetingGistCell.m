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

        UILabel *upLine = [[UILabel alloc] init];
        [self.contentView addSubview:upLine];
        upLine.backgroundColor = Color(202, 202, 202);
        _upline = upLine;
        
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        
        
        UILabel *downLine = [[UILabel alloc] init];
        [self.contentView addSubview:downLine];
        downLine.backgroundColor = Color(202, 202, 202);
        _downline = downLine;
        
        
        _titleL = [[UILabel alloc] init];
        [self.contentView addSubview:_titleL];
        _titleL.textAlignment = NSTextAlignmentLeft;
        _titleL.font = Font12;
       
        _statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _statusBtn.backgroundColor = [UIColor clearColor];
        _statusBtn.layer.masksToBounds = YES;
        _statusBtn.layer.cornerRadius = 3;
        _statusBtn.layer.borderWidth = 1;
        _statusBtn.layer.borderColor = [[UIColor grayColor] CGColor];
        _statusBtn.titleLabel.font = Font10;
        [_statusBtn setTitle:@"已确认" forState:UIControlStateSelected];
        [_statusBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
        [_statusBtn setTitle:@"就绪" forState:UIControlStateNormal];
        [_statusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //[_statusBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_statusBtn];
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@18);
            make.left.equalTo(self.contentView).offset(11);
            make.centerY.equalTo(self.contentView);
        }];
        
        [_upline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@2);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(_imgView.mas_top);
            make.centerX.equalTo(_imgView);
        }];
        
        [_downline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@2);
            make.bottom.equalTo(self.contentView);
            make.top.equalTo(_imgView.mas_bottom);
            make.centerX.equalTo(_imgView);
        }];
        
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(_imgView.mas_right).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@200);
        }];
        
        [_statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.height.equalTo(@20);
            make.width.equalTo(@40);
            make.right.equalTo(self.contentView).offset(-10);
        }];
    }
    
    return self;
}

- (void)btnClick:(UIButton *)button {
    button.selected = !button.selected;
}


- (void)setStatus:(NSString *)status {
    _status = status;
    if ([status isEqualToString:@"0"]) {
        _imgView.image = [UIImage imageNamed:@"stepview-icon-nor"];
        _upline.backgroundColor = Color(202, 202, 202);
        _downline.backgroundColor = Color(202, 202, 202);
    } else {
        _imgView.image = [UIImage imageNamed:@"stepview-icon-pre"];
        _upline.backgroundColor = Color(63, 218, 144);
        _downline.backgroundColor = Color(63, 218, 144);
    }
}

@end
