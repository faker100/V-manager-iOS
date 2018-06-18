//
//  TMMeetingGistViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetingContentAndGistViewController.h"
#import "TMMeetingProcessViewController.h"

@interface TMMeetingContentAndGistViewController ()<UITableViewDelegate, UITableViewDataSource>

/* money */
@property (nonatomic, strong) NSString *money;

/* personNum */
@property (nonatomic, strong) NSString *personNum;

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TMMeetingContentAndGistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"会议服务内容及流程";
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10+SafeAreaTop, kScreenW, 250) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.contentSize = CGSizeMake(0, 0);
    _tableView.tableFooterView = [UIView new];
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    UIButton *_editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake(0, _tableView.maxY+20, kScreenW, 50);
    _editBtn.backgroundColor = [UIColor whiteColor];
    _editBtn.titleLabel.font = Font18;
    [_editBtn setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
    [_editBtn addTarget:self action:@selector(createEOList:) forControlEvents:UIControlEventTouchUpInside];
    [_editBtn setTitle:@"上传EO单" forState:UIControlStateNormal];
    [self.view addSubview:_editBtn];
}

- (void)createEOList:(UIButton *)button {
    
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
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"合同金额";
        cell.detailTextLabel.text = self.money;
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"参会人数";
        cell.detailTextLabel.text = self.personNum;
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"会议流程";
        //cell.detailTextLabel.text = @"xxx";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"VIP接待信息";
        //cell.detailTextLabel.text = @"xxx";
    } else {
        cell.textLabel.text = @"会议是否重要";
        cell.accessoryType = UITableViewCellAccessoryNone;
        UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(kScreenW-65, 10, 0, 0)];
        [cell addSubview:sw];
        //设置开关状态(默认是 关)
        //[sw setOn:YES animated:YES];
        [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
   
    if (indexPath.row == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入合同金额" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        //可以给alertview中添加一个输入框
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"合同金额";
        }];

        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.money= alert.textFields.lastObject.text;
            [tableView reloadData];
        }];
        
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];

    } else if (indexPath.row == 1) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入参会人数" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"参会人数";
        }];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.personNum= alert.textFields.lastObject.text;
            [tableView reloadData];
        }];
        
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 2) {
        
        TMMeetingProcessViewController *vc = [TMMeetingProcessViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (indexPath.row == 3) {
        
    } else {
        
    }
}

- (void)switchAction:(UISwitch *)sw {
    if (sw.on) {
        NSLog(@"on");
    } else {
        NSLog(@"off");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
