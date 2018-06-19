//
//  TMHolderPersonController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMHolderPersonController.h"

@interface TMHolderPersonController ()

@end

@implementation TMHolderPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"举办方成员";
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTop, kScreenW, 40)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel *personL = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
    personL.text = @"群聊成员";
    personL.textColor = [UIColor grayColor];
    personL.font = Font11;
    personL.textAlignment = NSTextAlignmentLeft;
    [topView addSubview:personL];
   
    UILabel *personNumL = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-65, 12.5, 50, 20)];
    personNumL.text = @"共15人";
    personNumL.textColor = [UIColor grayColor];
    personNumL.font = Font11;
    personNumL.textAlignment = NSTextAlignmentRight;
    [topView addSubview:personNumL];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
