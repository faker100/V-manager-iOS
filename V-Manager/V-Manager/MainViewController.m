//
//  MainViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MainViewController.h"
@interface MainViewController ()
@property (nonatomic, strong) VMConfig *config;
@property (nonatomic, weak) VMUserInfo*         userinfo;
@property (nonatomic, copy) NSString*           networkAccessIdentifier;
@property (nonatomic, strong) VMNetworkService *networkService;
@end

@implementation MainViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    //self.userInfo = [FXUserInfo shared];
    self.delegate = [MainViewControllerDelegate staticInstance];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  判断显示的主界面
 */
- (void)configViewControllers {
    
    //首页
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"homeStoryboard" bundle:nil];
    UINavigationController *homeVC = [homeStoryboard instantiateInitialViewController];
    homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"tab-home-pre"] selectedImage:nil];
    homeVC.tabBarItem.image = [[UIImage imageNamed:@"tab-home-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-home-pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVC.navigationBar.barTintColor = MenuColor;
    
    
    //会议
    UIStoryboard *meetingStoryboard = [UIStoryboard storyboardWithName:@"meetingStoryboard" bundle:nil];
    UINavigationController *meetingVC = [meetingStoryboard instantiateInitialViewController];
    meetingVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"会议" image:[UIImage imageNamed:@"tab-meeting-nor"] selectedImage:nil];
    meetingVC.tabBarItem.image = [[UIImage imageNamed:@"tab-meeting-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meetingVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-meeting-pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //我的
    UIStoryboard *mineStoryboard = [UIStoryboard storyboardWithName:@"mineStoryboard" bundle:nil];
    UINavigationController *mineVC = [mineStoryboard instantiateInitialViewController];
    mineVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"tab-me-pre"] selectedImage:nil];
    mineVC.tabBarItem.image = [[UIImage imageNamed:@"tab-me-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab-me-pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[homeVC,meetingVC,mineVC];
  
    //顶部导航栏颜色
    //self.navigationController.navigationBar.barTintColor =  MenuColor;
    
    //选中字体颜色
     [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:Color(252, 88, 90)} forState:UIControlStateSelected];
    //[self.navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:Color(252, 88, 90)} forState:UIControlStateSelected];
     //meetingVC.tabBarController.tabBar.tintColor = MenuColor;
     //mineVC.tabBarController.tabBar.tintColor = MenuColor;
     //homeVC.tabBarController.tabBar.tintColor = MenuColor;
    
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

#pragma mark -
@implementation MainViewControllerDelegate

+ (MainViewControllerDelegate *)staticInstance {
    static dispatch_once_t predicate = 0;
    static MainViewControllerDelegate *object = nil;
    dispatch_once(&predicate, ^{ object = [[self class] new]; });
    return object;
}

/**  */
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    
//    int index = 0;
//    VMUserInfo *userInfo = [VMUserInfo shared];
//
//    if (userInfo.userId != nil) {
//        return YES;
//    }
//
//    for (; index < tabBarController.viewControllers.count; index++) {
//        if (tabBarController.viewControllers[index] == viewController) {
//            break;
//        }
//    }
//
//
//    UIStoryboard *userStoryboard = [UIStoryboard storyboardWithName:@"userStoryboard" bundle:nil];
//
//    UIViewController *initialViewController = [userStoryboard instantiateInitialViewController];
//    [tabBarController presentViewController:initialViewController
//                                       animated:YES
//                                     completion:nil];
//
//    return NO;
   
  return YES;
    
    
}

@end
