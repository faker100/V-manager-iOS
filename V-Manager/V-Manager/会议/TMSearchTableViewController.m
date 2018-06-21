//
//  TMSearchTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMSearchTableViewController.h"
#import "SearchMeetingCell.h"

@interface TMSearchTableViewController ()
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
CGRect          viewFrame;

}
@property (strong, nonatomic) IBOutlet UIView *searchConfigView;
@property (strong, nonatomic) IBOutlet UIButton *keywordBtn1;
@property (strong, nonatomic) IBOutlet UIButton *keywordBtn2;
@property (strong, nonatomic) IBOutlet UIButton *keywordBtn3;
@property (strong, nonatomic) IBOutlet UIButton *keywordBtn4;
@property (strong, nonatomic) IBOutlet UIButton *keywordBtn5;
- (IBAction)keywordBtnPressed:(UIButton *)sender;

@end
@implementation TMSearchTableViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.hidesBottomBarWhenPushed = NO;
    pageNo    = 1;
    meetingList   = [NSMutableArray new];
    hasMore    = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBarButtonItem];
    [self initUI];
    
}
-(void)initUI
{
    self.hidesBottomBarWhenPushed=YES;
    //记录headerView 高度
    viewFrame = self.searchConfigView.frame;
    [self.keywordBtn1.layer setBorderWidth:1];
    [self.keywordBtn1.layer setBorderColor:[[UIColor orangeColor] CGColor]];
    self.searchBar.placeholder=@"搜索会议名称";
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    self.searchConfigView.hidden=NO;
//self.tableView.hidden=YES;
    //
    // 初始化下拉刷新
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"重新获取..."];
    self.clearsSelectionOnViewWillAppear = YES;
    self.navigationController.navigationBar.translucent = NO;
    [self.refreshControl addTarget:self action:@selector(onRefreshViewControlEventValueChanged:)
                  forControlEvents:UIControlEventValueChanged];
    
    
}
//点击任意位置隐藏键盘
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.searchBar resignFirstResponder];
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


- (void)setBarButtonItem
{
    //隐藏导航栏上的返回按钮
    //[self.navigationItem setHidesBackButton:YES];
    //用来放searchBar的View
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 7, self.view.frame.size.width-50, 30)];
    titleView.backgroundColor=[UIColor clearColor];
    //创建searchBar
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(titleView.frame) - 15, 30)];
    //默认提示文字
    searchBar.placeholder = @"搜索内容";
    //背景图片
    searchBar.backgroundImage = [UIImage imageNamed:@"clearImage"];
    //代理
    searchBar.delegate = self;
    //显示右侧取消按钮
    searchBar.showsCancelButton = YES;
    //光标颜色
    // searchBar.tintColor = UIColorFromRGB(0x595959);
    //拿到searchBar的输入框
    UITextField *searchTextField = [searchBar valueForKey:@"_searchField"];
    //字体大小
    searchTextField.font = [UIFont systemFontOfSize:15];
    //输入框背景颜色
    searchTextField.backgroundColor = [UIColor colorWithRed:234/255.0 green:235/255.0 blue:237/255.0 alpha:1];
    
    //拿到取消按钮
    UIButton *cancleBtn = [searchBar valueForKey:@"cancelButton"];
    //设置按钮上的文字
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    //设置按钮上文字的颜色
    [cancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [titleView addSubview:searchBar];
    self.searchBar = searchBar;
    self.navigationItem.titleView = titleView;
}


#pragma mark - 下拉刷新
- (IBAction)onRefreshViewControlEventValueChanged:(id)sender {
    [self.refreshControl endRefreshing];
    // 刷新所有数据
    hasMore = YES;
    pageNo = 1;
    [meetingList removeAllObjects];
    [self getMeetingInfo];
    
    
}

- (IBAction)keywordBtnPressed:(UIButton *)sender
{
    
    [_keywordBtn1.layer setBorderWidth:0];
    [_keywordBtn2.layer setBorderWidth:0];
    [_keywordBtn3.layer setBorderWidth:0];
    [_keywordBtn4.layer setBorderWidth:0];
    [_keywordBtn5.layer setBorderWidth:0];
    [sender.layer setBorderWidth:1];
    [sender.layer setBorderColor:[[UIColor orangeColor] CGColor]];
    sender.layer.cornerRadius=5;
    self.searchBar.placeholder=[NSString stringWithFormat:@"搜索%@",sender.titleLabel.text];
    
    
}
/**
 *  添加tableHeaderView
 */
- (void)setUpTableViewHeaderView {
    
    
}
//查询时不显示view,取消就显示view
-(void)showHeaderView:(bool)isShow
{
    if (isShow)
    {
        self.searchConfigView.frame = viewFrame;
          self.searchConfigView.hidden=NO;
    }
    else
    {
        CGRect newFrame=CGRectMake(viewFrame.origin.x, viewFrame.origin.y, viewFrame.size.width, 0);
        
        self.searchConfigView.frame = newFrame;
        self.searchConfigView.hidden=YES;
        
    }
    [self.tableView setTableHeaderView:self.searchConfigView];
}
#pragma mark - Table view data source


#pragma mark - UITableViewDataSource, Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
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
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
   // if (indexPath.row < meetingList.count) {
        SearchMeetingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_meeting"];
        
        return cell;
//    } else {
//        //上拉刷新
//        static NSString *CellIdentifier = @"cell_loading";
//        UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        cell.hidden=YES;
//        
//        return cell;
//    }
}
#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = YES;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    //隐藏config view ，显示tableView
    [self.searchBar resignFirstResponder];
    [self showHeaderView:NO];

    
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    //显示config view ，隐藏tableView
    [self.searchBar resignFirstResponder];
   // self.searchConfigView.hidden=NO;
      [self showHeaderView:YES];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
#pragma mark - 后台接口读取会议信息
-(void)getMeetingInfo
{
    
    //        CFPMmMyFavoriteListRequest *request = [CFPMmMyFavoriteListRequest new];
    //        request.pageno = [NSString stringWithFormat:@"%d", pageNo];
    //        request.pagesize = PageSize;
    ////
    //        @weakify(self);
    //        [self.networkService postMessageRequest:request
    //                                 taskIdentifier:self.networkAccessIdentifier
    //                                      inSession:YES
    //                                     completion:^(MessageResponse *messageResponse, NSError *err)
    //         {
    //             @strongify(self)
    //             if (err) {
    //                 [self.refreshControl endRefreshing];
    //
    //                 [self showToastMessage:err.userInfo[kTMErrorDescriptionKey]];
    //
    //                 return;
    //             }
    //
    //             CFPMmMyFavoriteListResponse *res = (CFPMmMyFavoriteListResponse*)messageResponse;
    //
    //
    //
    //             if (res.favoriteList.count) {
    //
    //                 [articleList_ addObjectsFromArray:res.favoriteList];
    //
    //                 if (articleList_.count>0) {
    //                     [ self  removeNoHaveGiftPackageView];
    //                 }else
    //                 {
    //                     [ self  addNoHaveGiftPackageView];
    //
    //                 }
    //
    //
    //
    //                 if (res.favoriteList.count % KPageCount == 0) {
    //                     hasMore_ = YES;
    //                 } else {
    //                     hasMore_ = NO;
    //                 }
    //                 pageNo_++;
    //             }
    //             else {
    //                 hasMore_ = NO;
    //
    //             }
    //
    //             [self.tableView reloadData];
    //             [self.refreshControl endRefreshing];
    //             //已登录用户更改用户未读消息数和文章数
    //             if (self.config.sessionId !=nil)
    //             {
    //                 [self askChangeArticleCount];
    //             }
    //
    //
    //
    //         }];
    //
    //    }
}
@end
