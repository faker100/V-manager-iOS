//
//  BaseViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
+ (id)simpleInstance {
    NSString *defaultNibName = NSStringFromClass([self class]);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wmissing-declarations"
    
    BaseViewController *inst = [[[self class] alloc]initWithNibName:defaultNibName bundle:nil];
    
    return inst;
#pragma clang diagnostic pop
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.config                  = [VMConfig shared];
    self.userInfo                = [VMUserInfo shared];
    self.networkService          = [VMNetworkService sharedService];
    // self.localstorage          = [CFPLocalstorage Localstorage];
    
    
    [self setUpNavgationBar];
    
    self.view.backgroundColor = UIColorFromRGBValue(0xEEEEEE);  //统一下背景
    

    self.norecordImageView=[[UIImageView alloc] initWithFrame:CGRectMake( SCREEN_WIDTH/2-80,100, 160,160)];
    [self.view addSubview:self.norecordImageView];
    [self.norecordImageView setTintColor:[UIColor lightGrayColor]];
    self.norecordImageView.hidden=YES;
    [self.norecordImageView setImage:[[UIImage imageNamed:@"暂无记录"]
                                      imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.norecordLabel setTextColor:[UIColor lightGrayColor]];
    self.norecordLabel.textAlignment=NSTextAlignmentCenter;
    self.norecordLabel.text=@"暂无记录";
    
    [self.view addSubview:self.norecordLabel];
    
    self.norecordLabel.hidden=YES;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpNavgationBar {
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
     [self.navigationController.navigationBar lt_setBackgroundColor:MenuColor];
}
- (BOOL)shouldAutorotateToInteFXaceOrientation:(UIInterfaceOrientation)inteFXaceOrientation
{
    return (inteFXaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInteFXaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}


/**
 * 显示弹出式信息
 */
- (void)showToastMessage:(NSString*)message {
    CGRect scrBounds = [[UIScreen mainScreen]bounds];
    CGPoint toastPosition = CGPointMake(scrBounds.size.width / 2, scrBounds.size.height - 100);
    
    [[AppDelegate instance].window makeToast:message
                                    duration:1.25f
                                    position:[NSValue valueWithCGPoint:toastPosition]];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
