//
//  TMHomeTableView.m
//  VHkeeper
//
//  Created by 塔米 on 2018/6/8.
//  Copyright © 2018年 tami. All rights reserved.
//

#import "TMHomeTableView.h"
#import "TMHeaderView.h"
#import "TMMeetingGistCell.h"

@interface TMHomeTableView()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *stateArray;
}

@end

@implementation TMHomeTableView

- (void)setFunctionView:(TMHeaderView *)functionView {
    
    stateArray = [NSMutableArray arrayWithObjects:@"上午会场就绪",@"会议开始",@"茶歇就绪",@"餐厅午餐就绪", @"下午会场准备",@"会议开始",@"茶歇就绪",@"餐厅晚餐就绪",@"夜晚会场准备",@"会议开始",@"茶歇就绪",@"餐厅晚宴就绪就绪",nil];
    
    _functionView = functionView;
    
    self.dataSource = self;
    self.delegate = self;
    
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.functionView.height, 0, 0, 0);
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.functionView.height)];
    self.tableHeaderView = tableHeaderView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return stateArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID";
    TMMeetingGistCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TMMeetingGistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.titleL.text = stateArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.imgView.image = [UIImage imageNamed:@"linestart"];
    } else if (indexPath.row == stateArray.count-1) {
        cell.imgView.image = [UIImage imageNamed:@"lineend"];
    } else {
        cell.imgView.image = [UIImage imageNamed:@"linemiddle"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.nextDelegate toNextVC];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat placeHolderHeight = self.functionView.height - self.functionView.itemHeight;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //导航条的高度SafeAreaTop    
    if (offsetY >= 0 && offsetY <= placeHolderHeight) {
        self.functionView.y = -offsetY+SafeAreaTop+HeaderViewH;
    }
    else if (offsetY > placeHolderHeight) {
        self.functionView.y = - placeHolderHeight+SafeAreaTop+HeaderViewH;
    }
    else if (offsetY <0) {//下拉
        //self.headerView.y =  - offsetY+naviBarH;
        self.functionView.y =  SafeAreaTop+HeaderViewH;

    }
}


@end
