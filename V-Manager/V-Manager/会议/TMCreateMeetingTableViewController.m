//
//  TMCreateMeetingTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMCreateMeetingTableViewController.h"
#import "WSDatePickerView.h"

@interface TMCreateMeetingTableViewController ()
{
    //悬浮按钮
   TMSaveButton *saveMeetingBtn;
    //悬浮视图
    UIView  * saveView;
    int   buttonY;
    IBOutlet UITextField *meetingNameTf;
    IBOutlet UITextField *respPeopleTf;
    IBOutlet UITextField *addressTf;
    IBOutlet UITextField *startTimeTf;
    IBOutlet UITextField *endTimeTf;
    
}
@end

@implementation TMCreateMeetingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"新建会议";
    [self initData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)initData
{
    
    //  添加悬浮视图
    saveView=[[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80, SCREEN_WIDTH, 80)];
    saveView.backgroundColor=[UIColor lightGrayColor];
    [self.tableView addSubview:saveView];
    [self.tableView bringSubviewToFront:saveView];
    //  添加悬浮按钮
    saveMeetingBtn=[[TMSaveButton alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 50)];
    saveMeetingBtn.layer.cornerRadius=5;
    [saveMeetingBtn setTitle:@"确定" forState:UIControlStateNormal];
    [saveMeetingBtn addTarget:self action:@selector(saveMeeting) forControlEvents:UIControlEventTouchUpInside];
    [saveView addSubview:saveMeetingBtn];
    buttonY=(int)saveView.frame.origin.y;
     startTimeTf.enabled=NO;
    endTimeTf.enabled=NO;
    
    //
    //    [addView addSubview: addMeetingBtn];
    // [self.view bringSubviewToFront:addMeetingBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

    saveView.frame = CGRectMake(saveView.frame.origin.x, buttonY+self.tableView.contentOffset.y , saveView.frame.size.width, saveView.frame.size.height);
}

- (void)setUpTableViewHeaderView {
    
    //DDLogDebug(@"！！！！如果看到这条信息，有可能StoryBoard中设置的固定HeaderView无法显示，请用重载该方法为空！！！！");
    
    
}
-(void)saveMeeting
{
     if(meetingNameTf.text.length<=0)
     {
         [self showToastMessage:@"会议名称不可为空"];
         return;
     }
    if(respPeopleTf.text.length<=0)
    {
        [self showToastMessage:@"负责人不可为空"];
         return;
    }
    if(addressTf.text.length<=0)
    {
        [self showToastMessage:@"会议地点不可为空"];
         return;
    }
    if(startTimeTf.text.length<=0)
    {
        [self showToastMessage:@"开始时间不可为空"];
         return;
    }
    if(endTimeTf.text.length<=0)
    {
        [self showToastMessage:@"结束时间不可为空"];
         return;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 3) {
        
        WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
            
            startTimeTf.text= [selectDate stringWithFormat:@"YYYY年 MM月 dd日 HH点mm分"];
        }];
        datepicker.hideBackgroundYearLabel = YES;
        [datepicker show];
    }
    else if (indexPath.row == 4)
    {
        WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDayHourMinute CompleteBlock:^(NSDate *selectDate) {
            
            endTimeTf.text = [selectDate stringWithFormat:@"YYYY年 MM月 dd日 HH点mm分"];
        }];
        datepicker.hideBackgroundYearLabel = YES;
        [datepicker show];
        
    }
   
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

@end
