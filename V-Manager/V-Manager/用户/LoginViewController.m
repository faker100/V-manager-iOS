//
//  LoginViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"登陆";
    [self initUI];
 
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
-(void)initUI
{
    self.mobileTextField.text=@"13800138000";
    self.passWordTextField.text=@"111111";
}

- (IBAction)loginButtonPressed:(UIButton *)sender
{
            [self askUserInfo];
            self.userInfo.token=@"111111";
             AppDelegate *appDelegate = [AppDelegate instance];
             [appDelegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
             [appDelegate resetApplication];
    
}
/**
 * 获取用户信息
 */

-(void)askUserInfo
{
    
 //   [SVProgressHUD showWithStatus:@"登录中..."];
    LoginRequest *request = [LoginRequest  new];
  //  self.userInfo.userId=@"11";
    request.mobile=@"13800138000";
    request.passWord=@"111111";
    @weakify(self);
    
    [self.networkService postMessageRequest:request
                             taskIdentifier:self.networkAccessIdentifier
                                  inSession:NO
                            disbleOperation:NO
                                layerString:nil
                                 completion:^(MessageResponse *messageResponse, NSError *err)
     
     {
         [SVProgressHUD popActivity];
         @strongify(self)
         if (err) {
             [self showToastMessage:err.userInfo[kVMErrorDescriptionKey]];
             return;
         }
         
         LoginResponse *res = (LoginResponse *)messageResponse;
//         self.userInfo.nickName=res.nickName;
//         self.userInfo.headImgUrl=res.headImgUrl;
//         self.userInfo.token=res.token;
//         [self dismissViewControllerAnimated:YES completion:nil];
//         AppDelegate *appDelegate = [AppDelegate instance];
//         [appDelegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
//         [appDelegate resetApplication];
         
     }];
}


@end
