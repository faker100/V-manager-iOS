//
//  TMMeetingServerViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetingServerViewController.h"
#import "TMMeetingInfoViewController.h"
#import "TMChatViewController.h"
#import "TMFeedbackViewController.h"
#import "TMNoticeViewController.h"

@interface TMMeetingServerViewController ()

@end

@implementation TMMeetingServerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"会议服务群";
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_个人中心_选中"] style:UIBarButtonItemStylePlain target:self action:@selector(toCheckPersonItem)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    //提前设置
    self.titleH = 40;
    self.titleC = [UIColor whiteColor];
    self.titleArray = @[@"会议信息",@"群聊",@"反馈",@"公告"];
    
    TMMeetingInfoViewController *oneVC = [[TMMeetingInfoViewController alloc] init];
    oneVC.titleH = self.titleH;
    
    TMChatViewController *twoVC = [[TMChatViewController alloc] init];
    twoVC.titleH = self.titleH;
    
  TMFeedbackViewController *streeVC = [[TMFeedbackViewController alloc] init];
    streeVC.titleH = self.titleH;
    
    TMNoticeViewController *fourVC = [[TMNoticeViewController alloc] init];
    fourVC.titleH = self.titleH;
    
    self.controllerArray = @[oneVC,twoVC,streeVC,fourVC];
}

- (void)toCheckPersonItem {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
