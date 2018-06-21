//
//  MainViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController

@end

#pragma mark -

@interface MainViewControllerDelegate : NSObject <UITabBarControllerDelegate>

+ (MainViewControllerDelegate *)staticInstance;

@property(nonatomic,strong) UINavigationController *mine;

//+(void)configViewControllers ;
@end
