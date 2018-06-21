//
//  TMFeedbackViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMFeedbackViewController.h"
#import "TMMeetServerCell.h"
#import "TMMeetServer.h"
#import "TMMeetServerViewModel.h"

@interface TMFeedbackViewController ()<UITableViewDelegate, UITableViewDataSource>
/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* dataArray */
@property (nonatomic, strong) NSMutableArray *dataArray;

/* dataArrayFrames */
@property (nonatomic, strong) NSMutableArray *dataArrayFrames;
@end

@implementation TMFeedbackViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-SafeAreaTop-_titleH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        TMMeetServer *server0 = [TMMeetServer creatModelWith:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。" andDate:@"2018-6-20 15:00"];
        TMMeetServer *server1 = [TMMeetServer creatModelWith:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试这是一个测试。这是一个测试" andDate:@"2018-6-20 15:00"];
        _dataArray = [NSMutableArray arrayWithObjects:server0,server1, nil];
        
    }
    return _dataArray;
}

- (NSMutableArray *)dataArrayFrames {
    if (!_dataArrayFrames) {
        _dataArrayFrames = [NSMutableArray array];
        for (TMMeetServer *model in self.dataArray) {
            TMMeetServerViewModel *viewModel = [TMMeetServerViewModel new];
            viewModel.model = model;
            [self.dataArrayFrames addObject:viewModel];
        }
    }
    return _dataArrayFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrayFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMeetServerCell *cell = [TMMeetServerCell TMMeetServerCellWithTableView:tableView];

    cell.viewModel = self.dataArrayFrames[indexPath.row];
    cell.bgview.hidden = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMeetServerViewModel *viewModel = self.dataArrayFrames[indexPath.row];
    return viewModel.cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
