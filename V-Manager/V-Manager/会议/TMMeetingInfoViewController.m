//
//  TMMeetingInfoViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetingInfoViewController.h"
#import "MeetingHeaderView.h"

@interface TMMeetingInfoViewController ()
/* MeetingHeaderView.h */
@property (nonatomic, strong) MeetingHeaderView *headerView;

@end

@implementation TMMeetingInfoViewController
/*
 这个控制器要注意
 self.view.height 还是 整个屏幕的高度。
 只是view整体下移，超出屏幕，所以没有显示
 在配置子控件frame的时候高度要注意。
 （0，0）也随着view下移
 
 self.view.height-SafeAreaTop-40
 
 NSLog(@"TM ----- self.view.height = %f",self.view.height);
 
 UILabel *label0 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 30)];
 [self.view addSubview:label0];
 label0.text = @"000";
 label0.backgroundColor = [UIColor whiteColor];
 
 UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.height-SafeAreaTop-40-30, 50, 30)];
 [self.view addSubview:label];
 label.text = @"123";
 label.backgroundColor = [UIColor whiteColor];
 */

#pragma mark - lazy
- (MeetingHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MeetingHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeaderViewH)];
    }
    return _headerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
