//
//  TMMeetServerCell.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetServerCell.h"
#import "TMMeetServerViewModel.h"
#import "TMMeetServer.h"

@interface TMMeetServerCell ()

@end

@implementation TMMeetServerCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (instancetype)TMMeetServerCellWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"cell";
    TMMeetServerCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[TMMeetServerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgView = ({
            UIImageView *view = [[UIImageView alloc] init];
            view.size = CGSizeMake(40, 40);
            view.layer.cornerRadius = view.width/2 ;
            view.layer.masksToBounds = YES;
            view;
        });

        _nameLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = Font13;
            label.textColor = [UIColor blackColor];
            label;
        });
        
        _bgview = ({
            UIView *view = [[UIView alloc] init];
            view.size = CGSizeMake(100, 20);
            view.backgroundColor = Color(220, 220, 220);
            view.layer.cornerRadius = 3;
            view.layer.masksToBounds = YES;
            view;
        });
        
        _contenLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = Font11;
            label.textColor = [UIColor grayColor];
            label.numberOfLines = 0;
            label;
        });

        _dateLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentRight;
            label.font = Font11;
            label.textColor = [UIColor grayColor];
            label;
        });
        
        [self.contentView addSubview:_imgView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_bgview];
        [self.contentView addSubview:_contenLabel];
        [self.contentView addSubview:_dateLabel];

//        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self).offset(22);
//            make.left.equalTo(self).offset(15);
//            make.height.width.equalTo(@(40));
//        }];
//
//        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_imgView.mas_right).offset(5);
//            make.top.equalTo(self).offset(20);
//            make.width.equalTo(@80);
//        }];
//
//        [_contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_imgView.mas_right).offset(5);
//            make.top.equalTo(_nameLabel.mas_bottom);
//            make.bottom.equalTo(self).offset(-20);
//            make.right.equalTo(self).offset(-8);
//        }];
//
//        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_nameLabel.mas_right);
//            make.centerY.equalTo(_nameLabel);
//            make.right.equalTo(self).offset(-8);
//            make.height.equalTo(@20);
//        }];
    }
    return self;
}

- (void)setViewModel:(TMMeetServerViewModel *)viewModel {
    _viewModel = viewModel;
    self.imgView.frame = viewModel.imgViewFrame;
    self.nameLabel.frame = viewModel.nameFrame;
    self.dateLabel.frame = viewModel.dateFrame;
    self.bgview.frame = viewModel.bgviewFrame;
    self.contenLabel.frame = viewModel.contentFrame;
    
    self.imgView.image = [UIImage imageNamed:viewModel.model.imgName];
    self.nameLabel.text = viewModel.model.name;
    self.dateLabel.text = viewModel.model.date;
    self.contenLabel.text = viewModel.model.content;
}

@end
