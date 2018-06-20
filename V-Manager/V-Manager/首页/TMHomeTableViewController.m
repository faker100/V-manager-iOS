//
//  TMHomeTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMHomeTableViewController.h"
#import "TMCreateMeetingTableViewController.h"

@interface TMHomeTableViewController ()
{
    //悬浮按钮
    UIButton *addMeetingBtn;
    int   buttonY;
    //是否隐藏合同金额
    bool  isShowAmount;
    

}
//合同金额
@property (strong, nonatomic) IBOutlet UILabel *contractAmountLbl;
//待付金额
@property (strong, nonatomic) IBOutlet UILabel *waitAmountLbl;
//共计
@property (strong, nonatomic) IBOutlet UILabel *totalMeetingLbl;
//已举办
@property (strong, nonatomic) IBOutlet UILabel *closedLbl;
//选择日期
@property (strong, nonatomic) IBOutlet UIButton *choosePeriodBtn;
//今日会议
@property (strong, nonatomic) IBOutlet UILabel *todayCountLbl;
//我的关注
@property (strong, nonatomic) IBOutlet UILabel *myFollowCountLbl;
//待办会议
@property (strong, nonatomic) IBOutlet UILabel *waitCountLbl;

- (IBAction)hideAmountBtnPressed:(UIButton *)sender;
- (IBAction)choosePeriodBtnPressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *hideAmountBtn;
@end

@implementation TMHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"希尔顿大酒店";
    [self initData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)initData
{


      //  添加悬浮按钮
    addMeetingBtn=[[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, SCREEN_HEIGHT-150, 50, 50)];
    addMeetingBtn.backgroundColor=[UIColor orangeColor];
    addMeetingBtn.layer.cornerRadius=25;
    [addMeetingBtn setImage:[UIImage imageNamed:@"icon_增加"] forState: UIControlStateNormal ];
    [addMeetingBtn addTarget:self action:@selector(createMeeting) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:addMeetingBtn];
    [self.tableView bringSubviewToFront:addMeetingBtn];
    buttonY=(int)addMeetingBtn.frame.origin.y;
   
    isShowAmount=YES;
//
//    [addView addSubview: addMeetingBtn];
      // [self.view bringSubviewToFront:addMeetingBtn];
}
-(void)createMeeting
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"meetingStoryboard" bundle:nil];
    TMCreateMeetingTableViewController * vc = (TMCreateMeetingTableViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"sid_createmeeting"];
  
    [self.navigationController pushViewController:vc animated:YES];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpTableViewHeaderView {
    
    //DDLogDebug(@"！！！！如果看到这条信息，有可能StoryBoard中设置的固定HeaderView无法显示，请用重载该方法为空！！！！");
    
 
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
    {
      //  NSLog(@"%d",(int)addMeetingBtn.frame.origin.y);
        addMeetingBtn.frame = CGRectMake(addMeetingBtn.frame.origin.x, buttonY+self.tableView.contentOffset.y , addMeetingBtn.frame.size.width, addMeetingBtn.frame.size.height);
    }
    
    
   


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)hideAmountBtnPressed:(UIButton *)sender
{
    isShowAmount=!isShowAmount;
    if (isShowAmount)
    {
        self.contractAmountLbl.text=@"0.0";
        self.waitAmountLbl.text=@"0.0";
        [self.hideAmountBtn setImage:[UIImage imageNamed:@"隐藏金额"] forState:UIControlStateNormal];
    }
    else
    {
        self.contractAmountLbl.text=@"******";
        self.waitAmountLbl.text=@"******";
         [self.hideAmountBtn setImage:[UIImage imageNamed:@"显示金额"] forState:UIControlStateNormal];
    }
}

- (IBAction)choosePeriodBtnPressed:(UIButton *)sender {
    
    NSString *cancelTitle = @"取消";
    NSString *todayTitle = @"今天";
    NSString *monthTitle = @"本月";
    NSString *yearTitle = @"本年度";
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择时间段统计金额" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
       
    }];
    
    
    //今天
    UIAlertAction *todayAction = [UIAlertAction actionWithTitle:todayTitle  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
              [self.choosePeriodBtn setTitle:todayTitle forState:UIControlStateNormal];
        
        
    }];
    //本月
    UIAlertAction *monthAction = [UIAlertAction actionWithTitle:monthTitle  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [self.choosePeriodBtn setTitle:monthTitle forState:UIControlStateNormal];
        
    }];
    //本年度
    UIAlertAction *yearAction = [UIAlertAction actionWithTitle:yearTitle  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
                     [self.choosePeriodBtn setTitle:yearTitle forState:UIControlStateNormal];
        
    }];
    
    //设置cancelAction的title颜色
    
    [cancelAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
     [todayAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
     [monthAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
     [yearAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    //设置cancelAction的title的对齐方式
    
   // [cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentLeft] forKey:@"titleTextAlignment"];
  
 
    [alertController addAction:todayAction];
    [alertController addAction:monthAction];
    [alertController addAction:yearAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
