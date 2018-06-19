//
//  AccountTableViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "AccountTableViewController.h"
#import "InputPhoneNoViewController.h"

@interface AccountTableViewController ()
{
   TMSaveButton *logoutBtn;
    int   buttonY;
}

@end

@implementation AccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initUI
{
    self.navigationItem.title=@"账号设置";
    //  添加悬浮退出按钮
    logoutBtn=[[TMSaveButton alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT-80, SCREEN_WIDTH-60, 50)];
    logoutBtn.backgroundColor=[UIColor orangeColor];
    logoutBtn.layer.cornerRadius=5;
    [logoutBtn setTitle:@"退出登陆" forState:UIControlStateNormal];
  //  [addMeetingBtn setImage:[UIImage imageNamed:@"icon_增加"] forState: UIControlStateNormal ];
    [logoutBtn addTarget:self action:@selector(createMeeting) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:logoutBtn];
    [self.tableView bringSubviewToFront:logoutBtn];
    buttonY=(int)logoutBtn.frame.origin.y;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        //调用
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"userStoryboard" bundle:nil];
        InputPhoneNoViewController * vc = (InputPhoneNoViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"sid_inputphone"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    logoutBtn.frame = CGRectMake(logoutBtn.frame.origin.x, buttonY+self.tableView.contentOffset.y , logoutBtn.frame.size.width, logoutBtn.frame.size.height);
}
@end
