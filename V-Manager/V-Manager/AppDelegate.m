//
//  AppDelegate.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

//zheshiceshi
#import "AppDelegate.h"

@interface AppDelegate ()
/** 全局配置对象*/
@property (nonatomic, strong) VMConfig *config;
/** 全局配置对象*/
@property (nonatomic, strong) VMUserInfo *userInfo;
/** 网络请求对象 */
@property (nonatomic, strong) VMNetworkService *networkService;
@property (nonatomic, copy) NSString*           networkAccessIdentifier;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 初始化全局风格
    [self unifyAppearance];
    
    self.config = [VMConfig shared];
    self.userInfo = [VMUserInfo shared];
    self.networkService = [VMNetworkService sharedService];
    self.networkAccessIdentifier = N6GenerateUUID();
    self.networkService.lock = NO;
    
    
    //判断是否已登录 未登录跳转登录界面，已登录跳转首页
    self.userInfo.token=nil;
    if (self.userInfo.token==nil)
    {
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"userStoryboard" bundle:nil] instantiateInitialViewController];
        
    }
    else
    {
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/**
 *  实例化appDelegate单例对象
 */
+ (AppDelegate*)instance {
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}
- (void)unifyAppearance {
    
    //字体大小
    
    //[self setBackgroundColor:[UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                            NSForegroundColorAttributeName:UIColorFromRGBValue(0xFFFFFF)}];
    [[UINavigationBar appearance] setTintColor:UIColorFromRGBValue(0xFFFFFF)];
    [[UINavigationBar appearance] setBackgroundColor:MenuColor];
    [[UINavigationBar appearance] setBarTintColor:MenuColor];
    
    // [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    //导航栏左右按钮字体颜色
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackIndicatorImage:)]) {
        [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"icon_返回"]];
        [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_返回"]];
    }
    
    //[[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1.0] }
    //                                         forState:UIControlStateSelected];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(5, 0) forBarMetrics:UIBarMetricsDefault];
    
    // [[UITabBarItem appearance] setTintColor:[UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1.0]];
    
    //修改UISegmentedControl的颜色
    //    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1.0]];
    //    [[UISegmentedControl appearance] setTitleTextAttributes:@{
    //                                                              NSForegroundColorAttributeName:[UIColor colorWithRed:19/255.0 green:153/255.0 blue:229/255.0 alpha:1.0]
    //                                                              }
    //                                                   forState:UIControlStateNormal];
    //    [[UISegmentedControl appearance] setTitleTextAttributes:@{
    //                                                              NSForegroundColorAttributeName:[UIColor whiteColor]
    //                                                              }
    //                                                   forState:UIControlStateSelected];
    if (self.config.osVersion >= 8) {
        // UITableViewCell顶头
        [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsZero];
        
        [[UITableViewCell appearance] setLayoutMargins :UIEdgeInsetsZero];
        
    }
    
}

- (void)resetApplication {
    self.networkService.lock = NO;
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
}
@end
