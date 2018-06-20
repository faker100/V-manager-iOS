//
//  MeetingListTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MeetingListTableViewController.h"
#import "MeetingGistViewController.h"
#import "TMMeetingContentAndGistViewController.h"
#import "MeetingListCell.h"

@interface MeetingListTableViewController ()
{
    //关键字查询
    searchKeywordType keywordType;
    //会议列表
    NSMutableArray *meetingList;
    //分页设置
    int             pageNo;
    BOOL            hasMore;
    NSString *      pageSize;
    int             KPageCount;
}
@property (strong, nonatomic) IBOutlet UIView *headerView;

@end

@implementation MeetingListTableViewController
- (void)awakeFromNib {
    [super awakeFromNib];
    self.hidesBottomBarWhenPushed = NO;
    pageNo    = 1;
    meetingList   = [NSMutableArray new];
    hasMore    = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
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





#pragma mark - 下拉刷新
- (IBAction)onRefreshViewControlEventValueChanged:(id)sender {
    [self.refreshControl endRefreshing];
    // 刷新所有数据
    hasMore = YES;
    pageNo = 1;
    [meetingList removeAllObjects];
    [self getMeetingInfo];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
      self.hidesBottomBarWhenPushed=NO;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)initUI
{
    self.navigationItem.title=@"北京香格里拉酒店";
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [searchBtn  setImage:[UIImage imageNamed:@"搜索图标"] forState:UIControlStateNormal];
    [searchBtn  sizeToFit];
    [searchBtn setTintColor:[UIColor whiteColor]];
    [searchBtn addTarget:self action:@selector(searchMeeting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * searchBtnItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    
    self.navigationItem.rightBarButtonItems  = @[searchBtnItem];
    // 初始化下拉刷新
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"重新获取..."];
    self.clearsSelectionOnViewWillAppear = YES;
    self.navigationController.navigationBar.translucent = NO;
    [self.refreshControl addTarget:self action:@selector(onRefreshViewControlEventValueChanged:)
                  forControlEvents:UIControlEventValueChanged];

}
//跳转搜索页
- (void)searchMeeting {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"meetingStoryboard" bundle:nil];
    TMSearchTableViewController * vc = (TMSearchTableViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"sid_search"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:NO];

    
}

- (void)setUpTableViewHeaderView {
    //DDLogDebug(@"！！！！如果看到这条信息，有可能StoryBoard中设置的固定HeaderView无法显示，请用重载该方法为空！！！！");
}
#pragma mark - Table view data source

#pragma mark - UITableViewDataSource, Delegate
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    //如果还有数据显示上拉刷新按钮
//    if (meetingList.count > 0 ) {
//        if (hasMore) {
//            return meetingList.count + 1;
//        } else {
//            return  meetingList.count;
//        }
//    } else {
//        return 0;
//    }
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return  1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    if (indexPath.row < meetingList.count) {
//        MeetingListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_meetinglist"];
//        
//        return cell;
//    } else {
//        //上拉刷新
//        static NSString *CellIdentifier = @"cell_loading";
//        UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        cell.hidden=YES;
//        
//        return cell;
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MeetingGistViewController *vc = [MeetingGistViewController new];
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        TMMeetingContentAndGistViewController *vc = [TMMeetingContentAndGistViewController new];
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
//读取会议信息
- (void)getMeetingInfo
{
    
}
@end
