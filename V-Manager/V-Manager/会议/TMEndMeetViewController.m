//
//  TMEndMeetViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMEndMeetViewController.h"
#import "MeetingHeaderView.h"

@interface TMEndMeetViewController ()
/* MeetingHeaderView.h */
@property (nonatomic, strong) MeetingHeaderView *headerView;
@end

@implementation TMEndMeetViewController
#pragma mark - lazy
- (MeetingHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MeetingHeaderView alloc] initWithFrame:CGRectMake(0, SafeAreaTop, SCREEN_WIDTH, HeaderViewH)];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"进入会议";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
