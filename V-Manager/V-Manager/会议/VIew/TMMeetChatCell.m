//
//  TMMeetChatCell.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetChatCell.h"
#import "TMMeetChat.h"
#import "TMMeetChatViewModel.h"

@interface TMMeetChatCell ()
/* bgview */
@property (nonatomic, strong) UIView *bgview;
@end

@implementation TMMeetChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (instancetype)TMMeetChatCellWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"cell";
    TMMeetChatCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[TMMeetChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
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
            view.backgroundColor = Color(77, 141, 251);
            view.layer.cornerRadius = 5;
            view.layer.masksToBounds = YES;
            view;
        });
        
        _contenLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.textAlignment = NSTextAlignmentLeft;
            label.font = Font11;
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 0;
            label;
        });

        [self.contentView addSubview:_imgView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_bgview];
        [self.contentView addSubview:_contenLabel];        
    }
    return self;
}

- (void)setViewModel:(TMMeetChatViewModel *)viewModel {
    _viewModel = viewModel;

    self.imgView.frame = viewModel.imgViewFrame;
    self.nameLabel.frame = viewModel.nameFrame;
    self.contenLabel.frame = viewModel.contentFrame;
    self.bgview.frame = viewModel.bgviewFrame;
    
    self.imgView.image = [UIImage imageNamed:viewModel.model.imgName];
    self.nameLabel.text = viewModel.model.name;
    self.contenLabel.text = viewModel.model.content;
}
@end
