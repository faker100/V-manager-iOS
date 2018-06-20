//
//  TMEditProcessViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMEditProcessViewController.h"
#import "TMEditProcessHeaderView.h"
#import "WSDatePickerView.h"
#import "TMEditProcessCell.h"

@interface TMEditProcessViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray      *dataSource;
    NSMutableArray      *sectionArray;
    NSMutableArray      *stateArray;
}

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* 会场就绪*/
@property (nonatomic, strong) NSString *monPlanDate;
@property (nonatomic, strong) NSString *monTeaDate;
@property (nonatomic, strong) NSString *monMeetLunchDate;
@property (nonatomic, strong) NSString *monDiningLunchDate;

@property (nonatomic, strong) NSString *aftPlanDate;
@property (nonatomic, strong) NSString *aftTeaDate;
@property (nonatomic, strong) NSString *aftMeetDinnerDate;
@property (nonatomic, strong) NSString *aftDiningDinnerDate;

@property (nonatomic, strong) NSString *nigPlanDate;
@property (nonatomic, strong) NSString *nigTeaDate;
@property (nonatomic, strong) NSString *nigMeetDinnerDate;
@property (nonatomic, strong) NSString *nigDiningDinnerDate;

@property (nonatomic, strong) NSString *addSecurityDate;
@property (nonatomic, strong) NSString *flowersDisplayDate;
@property (nonatomic, strong) NSString *receptionistDate;

@end

@implementation TMEditProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"编辑流程";

    [self initViews];
    
    [self initData];
}

- (void)initData {
    
    sectionArray  = [NSMutableArray arrayWithObjects:@"上午", @"下午", @"晚上", @"其他",nil];
    
    NSArray *one = @[@"会场就绪",@"茶歇就绪",@"会场午餐就绪",@"餐厅午餐就绪"];
    NSArray *two = @[@"会场就绪",@"茶歇就绪",@"会场晚餐就绪",@"餐厅晚餐就绪"];
    NSArray *three = @[@"会场就绪",@"茶歇就绪",@"会场晚宴就绪",@"餐厅晚宴就绪"];
    NSArray *four = @[@"加强安保",@"鲜花陈列",@"前台接待"];
    dataSource = [NSMutableArray arrayWithObjects:one,two,three,four, nil];
    
    stateArray = [NSMutableArray array];
    for (int i = 0; i < dataSource.count; i++) {
        //所有的分区都是闭合
        [stateArray addObject:@"0"];
    }
}

- (void)initViews {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenW, 30)];
    label.text = @"2018-6-20";
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), kScreenW, kScreenH-80-SafeAreaTop) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.bounces = NO;
    
    UIButton *editB = [UIButton buttonWithType:UIButtonTypeCustom];
    editB.frame = CGRectMake(0, kScreenH-50-SafeAreaTop, kScreenW, 50);
    editB.backgroundColor = kRGBColor(135, 135,135, 1);
    editB.titleLabel.font = Font12;
    [editB setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
    [editB setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:editB];
    [editB addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)confirm:(UIButton *)button {
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if ([stateArray[section] isEqualToString:@"1"]){
        //如果是展开状态
        NSArray *array = [dataSource objectAtIndex:section];
        return array.count;
    } else {
        //如果是闭合，返回0
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"CellID";
    TMEditProcessCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[TMEditProcessCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellID];
    }
    cell.imageView.image = [UIImage imageNamed:@"icon_首页"];
    cell.textLabel.text = dataSource[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = [self methodWithIndexPath:indexPath];
    return cell;
}

- (NSString *)methodWithIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 ) {
        if (indexPath.row == 0) {
            return self.monPlanDate;
        } else if (indexPath.row == 1) {
            return self.monTeaDate;
        } else if (indexPath.row == 2) {
            return self.monMeetLunchDate;
        } else {
            return self.monDiningLunchDate;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return self.aftPlanDate;
        } else if (indexPath.row == 1) {
            return self.aftTeaDate;
        } else if (indexPath.row == 2) {
            return self.aftMeetDinnerDate;
        } else {
            return self.aftDiningDinnerDate;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return self.nigPlanDate;
        } else if (indexPath.row == 1) {
            return self.nigTeaDate;
        } else if (indexPath.row == 2) {
            return self.nigMeetDinnerDate;
        } else {
            return self.nigDiningDinnerDate;
        }
    } else {
        if (indexPath.row == 0) {
            return self.addSecurityDate;
        } else if (indexPath.row == 1) {
            return self.flowersDisplayDate;
        }  else {
            return self.receptionistDate;
        }
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return sectionArray[section];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [button setTag:section+1];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, button.frame.size.height-1, button.frame.size.width, 1)];
    [line setImage:[UIImage imageNamed:@"line_real"]];
    [button addSubview:line];
    
    UIImageView *_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30, (44-6)/2, 10, 6)];
    
    if ([stateArray[section] isEqualToString:@"0"]) {
        _imgView.image = [UIImage imageNamed:@"ico_listdown"];
    }else if ([stateArray[section] isEqualToString:@"1"]) {
        _imgView.image = [UIImage imageNamed:@"ico_listup"];
    }
    [button addSubview:_imgView];
    
    UILabel *tlabel = [[UILabel alloc]initWithFrame:CGRectMake(15, (44-20)/2, 200, 20)];
    [tlabel setBackgroundColor:[UIColor clearColor]];
    [tlabel setFont:[UIFont systemFontOfSize:14]];
    [tlabel setText:sectionArray[section]];
    [button addSubview:tlabel];
    return button;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
        
        NSString *dateStr = [selectDate stringWithFormat:@"HH点mm分"];

        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                self.monPlanDate = dateStr;
            } else if (indexPath.row == 1) {
                self.monTeaDate = dateStr;

            } else if (indexPath.row == 2) {
                self.monMeetLunchDate = dateStr;
            } else {
                self.monDiningLunchDate = dateStr;
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                self.aftPlanDate = dateStr;
            } else if (indexPath.row == 1) {
                self.aftTeaDate = dateStr;
            } else if (indexPath.row == 2) {
                self.aftMeetDinnerDate = dateStr;
            } else {
                self.aftMeetDinnerDate = dateStr;
            }
        } else if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                self.nigPlanDate = dateStr;
            } else if (indexPath.row == 1) {
                self.nigTeaDate = dateStr;
            } else if (indexPath.row == 2) {
                self.nigMeetDinnerDate = dateStr;
            } else {
                self.nigDiningDinnerDate = dateStr;
            }
        } else {
            if (indexPath.row == 0) {
                self.addSecurityDate = dateStr;
            } else if (indexPath.row == 1) {
                self.flowersDisplayDate = dateStr;
            } else {
                self.receptionistDate = dateStr;
            }
        }
        //刷新某一固定的行
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    datepicker.hideBackgroundYearLabel = YES;
    [datepicker show];
}

//headButton点击
- (void)buttonPress:(UIButton *)sender
{
    //判断状态值
    if ([stateArray[sender.tag - 1] isEqualToString:@"1"]){
        //修改
        [stateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"0"];
    } else {
        [stateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"1"];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-1] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
