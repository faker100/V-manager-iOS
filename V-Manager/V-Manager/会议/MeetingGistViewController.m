//
//  MeetingGistViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/13.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MeetingGistViewController.h"
#import <Masonry.h>
#import "MeetingHeaderView.h"
#import "TMHeaderView.h"
#import "TMHomeTableView.h"
#import "TMMeetingContentAndGistViewController.h"
#import "TMMeetingServerViewController.h"

@interface MeetingGistViewController ()<UIScrollViewDelegate, TMBaseTableViewDelegate>

/* MeetingHeaderView.h */
@property (nonatomic, strong) MeetingHeaderView *headerView;

/* scrollView */
@property (nonatomic, strong) UIScrollView *mainScrollView;

/* functionView */
@property (nonatomic, strong) TMHeaderView *functionView;

/* 表示图 */
@property (nonatomic, strong) TMHomeTableView *tableView;

/* button */
@property (nonatomic, strong) UIButton *editB;

@property (nonatomic, assign) int a;
@end

@implementation MeetingGistViewController

#pragma mark - lazy
- (MeetingHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MeetingHeaderView alloc] initWithFrame:CGRectMake(0, SafeAreaTop, SCREEN_WIDTH, HeaderViewH)];
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[TMHomeTableView alloc] initWithFrame:self.mainScrollView.bounds style:UITableViewStyleGrouped];
        _tableView.tableFooterView = [UIView new];
        _tableView.functionView = self.functionView;
        _tableView.nextDelegate = self;
    }
    return _tableView;
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTop+HeaderViewH, SCREEN_WIDTH, SCREEN_HEIGHT- SafeAreaTop -HeaderViewH)];
        _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 0);
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.delegate = self;
        [_mainScrollView addSubview:self.tableView];
    }
    return _mainScrollView;
}

- (TMHeaderView *)functionView {
    if (!_functionView) {
        _functionView = [[TMHeaderView alloc] initWithFrame:CGRectMake(0, SafeAreaTop+HeaderViewH, SCREEN_WIDTH, 150)];
        _functionView.itemHeight = 50;
        _functionView.backgroundColor = [UIColor redColor];
    }
    return _functionView;
}

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"会议概要";
    
    self.a = 1;
    
    [self initViews];
}

- (void)initViews {
    
//    [self.view addSubview:self.mainScrollView];
//    [self.view addSubview:self.functionView];
//    [self.view addSubview:self.headerView];
//    self.tabBarController.tabBar.hidden = YES;

    UIButton *editB = [UIButton buttonWithType:UIButtonTypeCustom];
    editB.frame = CGRectMake(0, kScreenH-50, kScreenW, 50);
    editB.backgroundColor = kRGBColor(135, 135,135, 1);
    editB.titleLabel.font = Font12;
    [editB setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
    
    if(self.a) {
        [editB setTitle:@"进入会议" forState:UIControlStateNormal];

        self.functionView.bottomView.hidden = NO;
        self.functionView.height = 150;
        [self.view addSubview:self.mainScrollView];
    } else {
        [editB setTitle:@"创建流程" forState:UIControlStateNormal];

        self.functionView.bottomView.hidden = YES;
        self.functionView.height = 100;
    }
    
    [self.view addSubview:self.functionView];
    [self.view addSubview:self.headerView];
    [self.view addSubview:editB];

    [self.functionView.editBtn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionView.PayBtn addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionView.ideaBtn addTarget:self action:@selector(ideaAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionView.needChangeBtn addTarget:self action:@selector(needChangeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.functionView.remindBtn addTarget:self action:@selector(remindAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView.EOButton addTarget:self action:@selector(EOBtnAction:) forControlEvents:UIControlEventTouchUpInside];
  
    [editB addTarget:self action:@selector(createMeetProcess:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - ButtonAction

- (void)editAction:(UIButton *)button {
    NSLog(@"1");

}

- (void)payAction:(UIButton *)button {
    
    NSString *str1 = [NSString stringWithFormat:@"合同金额：10000"];
    NSString *str2 = [NSString stringWithFormat:@"已付金额：8000"];
    str1 = [str1 stringByAppendingFormat:@"\n%@",str2];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"已付款项" message:str1 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (void)ideaAction:(UIButton *)button {
    NSLog(@"1");
}

- (void)needChangeAction:(UIButton *)button {
    NSLog(@"1");

}

- (void)remindAction:(UIButton *)button {
    NSLog(@"1");

}

- (void)EOBtnAction:(UIButton *)btn {
    NSLog(@"1");

}

- (void)createMeetProcess:(UIButton *)button {
    
    self.a = 1;
    //[self initViews];
    
    if ([button.titleLabel.text isEqualToString:@"创建流程"]) {
        TMMeetingContentAndGistViewController *vc = [TMMeetingContentAndGistViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认进入此会议" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"仅查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            TMMeetingServerViewController *vc = [TMMeetingServerViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            TMMeetingServerViewController *vc = [TMMeetingServerViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:^{}];
    }
}

#pragma mark - TMBaseTableViewDelegate
- (void)toNextVC {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
