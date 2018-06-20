//
//  TMMeetingProcessViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetingProcessViewController.h"
#import "TMEditProcessViewController.h"

@interface TMMeetingProcessViewController ()<UITableViewDelegate, UITableViewDataSource>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TMMeetingProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"会议流程";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, kScreenW, 250) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.contentSize = CGSizeMake(0, 0);
    _tableView.tableFooterView = [UIView new];
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseFirstTableViewCell = @"CellID";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseFirstTableViewCell];
    cell.textLabel.font = Font16;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.font = Font16;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text =@"2018/06/09";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TMEditProcessViewController *vc = [TMEditProcessViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
