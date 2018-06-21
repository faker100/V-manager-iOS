//
//  TMMeetingGistCell.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMMeetingGistCell : UITableViewCell
/* imgView */
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *upline;

@property (nonatomic, strong) UILabel *downline;

/* upline */
@property (nonatomic, strong) UILabel *titleL;

/* statusBtn */
@property (nonatomic, strong) UIButton *statusBtn;

/* status */
@property (nonatomic, strong) NSString *status;

@end
