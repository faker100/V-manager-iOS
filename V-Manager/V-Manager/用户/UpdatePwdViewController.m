//
//  UpdatePwdViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "UpdatePwdViewController.h"
#import "UpdatePwdOKViewController.h"

@interface UpdatePwdViewController ()
@property (strong, nonatomic) IBOutlet UITextField *changePwdTf;
@property (strong, nonatomic) IBOutlet UITextField *reTypePwdTf;
@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;
- (IBAction)confirmBtnPressed:(UIButton *)sender;

@end

@implementation UpdatePwdViewController

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

- (IBAction)confirmBtnPressed:(UIButton *)sender {
    
    [self.view endEditing:YES];
    if(![self.changePwdTf.text n6_isMMPassword]){
        [self showToastMessage:@"新密码格式不正确"];
        return;
    }
    
    [self.view endEditing:YES];
    if ([self.changePwdTf.text length]< 6 || [self.changePwdTf.text  length]>18) {
        [self showToastMessage:@"密码输入格式错误"];
        return;
    }
    NSString *passwordRegex0 =
    @"[a-z]+$";
    NSPredicate *predicate0 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex0];
    BOOL isabc =   [predicate0 evaluateWithObject:self.changePwdTf.text];
    DDLogVerbose(@"字母%@",isabc?@"YES":@"NO");
    NSString *passwordRegex1 =
    @"[A-Z]+$";
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex1];
    BOOL isABC =   [predicate1 evaluateWithObject:self.changePwdTf.text];
    DDLogVerbose(@"字母%@",isABC?@"YES":@"NO");
    NSString *passwordRegex2 =
    @"[0-9]+$";
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex2];
    BOOL isNumber =   [predicate2 evaluateWithObject:self.changePwdTf.text];
    DDLogVerbose(@"数字%@",isNumber?@"YES":@"NO");
    NSString *passwordRegex3 =
    @"[A-Za-z0-9]+$";
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex3];
    BOOL isMix =   [predicate3 evaluateWithObject:self.changePwdTf.text];
    DDLogVerbose(@"混合%@",isMix?@"YES":@"NO");
    BOOL isOK = !isNumber && !isABC && !isabc;
    if ( isOK && isMix ) {
        DDLogVerbose(@"正确");
    }else{
        [self showToastMessage:@"新密码格式输入错误"];
        return;
    }
}
- (void)updatePassword{
    //发送更改密码请求请求
    //请求成功跳转恭喜页面
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"userStoryboard" bundle:nil];
    UpdatePwdOKViewController * vc = (UpdatePwdOKViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"sid_updatepwdok"];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end
