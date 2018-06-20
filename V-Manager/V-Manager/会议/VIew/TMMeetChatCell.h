//
//  TMMeetChatCell.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMMeetChatViewModel;

@interface TMMeetChatCell : UITableViewCell
/* imgView */
@property (nonatomic, strong) UIImageView *imgView;

/* nameLabel */
@property (nonatomic, strong) UILabel *nameLabel;

/* contentLabel */
@property (nonatomic, strong) UILabel *contenLabel;

/* viewModel */
@property (nonatomic, strong) TMMeetChatViewModel *viewModel;

+ (instancetype)TMMeetChatCellWithTableView:(UITableView *)tableView;
@end
