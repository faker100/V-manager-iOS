//
//  MainNavigationController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)awakeFromNib {
    
    // 引导页处理
   VMConfig *config = [VMConfig shared];
    
    config.launchCount = config.launchCount + 1;
    
    if (config.launchCount > 1) {
        UIViewController *viewController
        = [self.storyboard instantiateViewControllerWithIdentifier:@"sid_main"];
        
        [self setViewControllers:@[viewController] animated:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
