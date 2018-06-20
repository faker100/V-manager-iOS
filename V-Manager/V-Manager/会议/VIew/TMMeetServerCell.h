//
//  TMMeetServerCell.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMMeetServerViewModel;

@interface TMMeetServerCell : UITableViewCell
/* imgView */
@property (nonatomic, strong) UIImageView *imgView;

/* nameLabel */
@property (nonatomic, strong) UILabel *nameLabel;

/* contentLabel */
@property (nonatomic, strong) UILabel *contenLabel;

/* dateLabel */
@property (nonatomic, strong) UILabel *dateLabel;

/* viewModel */
@property (nonatomic, strong) TMMeetServerViewModel *viewModel;

+ (instancetype)TMMeetServerCellWithTableView:(UITableView *)tableView;

@end
