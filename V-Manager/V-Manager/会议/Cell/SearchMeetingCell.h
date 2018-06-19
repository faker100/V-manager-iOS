//
//  SearchMeetingCell.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/15.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchMeetingCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *meetingNameLbl;
@property (strong, nonatomic) IBOutlet UIButton *followBtn;
@property (strong, nonatomic) IBOutlet UILabel *meetingStatusLbl;
@property (strong, nonatomic) IBOutlet UILabel *meetingAddressLbl;
@property (strong, nonatomic) IBOutlet UIImageView *meetingFlagImg;
@property (strong, nonatomic) IBOutlet UILabel *meetingTimeLbl;

@end
