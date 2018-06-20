//
//  BaseTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.config                  = [VMConfig shared];
    self.userInfo                = [VMUserInfo shared];
    self.networkService          = [VMNetworkService sharedService];
    // self.localstorage          = [CFPLocalstorage Localstorage];
    [self setUpNavgationBar];
    [self setUpTableViewHeaderView];
    
    self.norecordLabel=[[UILabel alloc] initWithFrame:CGRectMake( SCREEN_WIDTH/2-80,CGRectGetMaxY(self.norecordImageView.frame), 160,160)];
    [self.norecordLabel setTextColor:[UIColor lightGrayColor]];
    self.norecordLabel.textAlignment=NSTextAlignmentCenter;
    self.norecordLabel.text=@"暂无记录";
    [self.view addSubview:self.norecordImageView];
    [self.view addSubview:self.norecordLabel];
    [self.norecordImageView setTintColor:[UIColor lightGrayColor]];
    self.norecordImageView.hidden=YES;
    self.norecordLabel.hidden=YES;
    [self.norecordImageView setImage:[[UIImage imageNamed:@"暂无记录"]
                                      imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
   // self.view.backgroundColor = UIColorFromRGBValue(0xEEEEEE);  //统一下背景
    if (self.config.osVersion >= 8) {
        self.tableView.separatorInset = UIEdgeInsetsZero;
        self.tableView.layoutMargins  = UIEdgeInsetsZero;
    }
    //去掉多余的分割线和空行
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.tableView setTableFooterView:v];
    
    
}

/**
 *  清空返回按钮的title
 */
- (void)setUpNavgationBar {
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

/**
 *  添加tableHeaderView
 */
- (void)setUpTableViewHeaderView {
    
//DDLogDebug(@"！！！！如果看到这条信息，有可能StoryBoard中设置的固定HeaderView无法显示，请用重载该方法为空！！！！");
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    view.width = self.view.width;
    view.height = 15.0f;
    self.tableView.tableHeaderView = view;
}



/**
 * 显示弹出式信息
 */
- (void)showToastMessage:(NSString*)message {
    CGRect scrBounds = [[UIScreen mainScreen]bounds];
    CGPoint toastPosition = CGPointMake(scrBounds.size.width / 2, scrBounds.size.height - 100);
    
    [[AppDelegate instance].window makeToast:message
                                    duration:1.25f
                                    position:[NSValue valueWithCGPoint:toastPosition]];
}
- (void)adjustHeightOfTableview
{
    CGFloat height = self.tableView.contentSize.height;
    CGFloat maxHeight = self.tableView.superview.frame.size.height - self.tableView.frame.origin.y;
    
    // if the height of the content is greater than the maxHeight of
    // total space on the screen, limit the height to the size of the
    // superview.
    
    if (height > maxHeight)
        height = maxHeight;
    
    // now set the frame accordingly
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.tableView.frame;
        frame.size.height = height;
        self.tableView.frame = frame;
        
        // if you have other controls that should be resized/moved to accommodate
        // the resized tableview, do that here, too
    }];
}

@end
