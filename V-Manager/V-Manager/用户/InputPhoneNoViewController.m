//
//  InputPhoneNoViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "InputPhoneNoViewController.h"
#import "InputSMSViewController.h"

@interface InputPhoneNoViewController ()
@property (strong, nonatomic) IBOutlet UITextField *phoneTF;
@property (strong, nonatomic) IBOutlet UIButton *sendSMSBtn;
- (IBAction)sendSMSBtnPressed:(UIButton *)sender;

@end

@implementation InputPhoneNoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initUI
{
    // 校验下一步按钮是否可用
    RACSignal *formValid = [RACSignal combineLatest:@[
                                                      self.phoneTF.rac_textSignal ,
                                                      ]
                                             reduce:^(NSString *phoneNumber) {
                                                 return @(![phoneNumber n6_isMobile] && [phoneNumber n6_trimmedString].length > 0);
                                             }];
    RAC(self.sendSMSBtn, enabled) = formValid;
    
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

- (IBAction)sendSMSBtnPressed:(UIButton *)sender {
    [self showToastMessage:@"验证码已发送"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"userStoryboard" bundle:nil];
    InputSMSViewController * vc = (InputSMSViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"sid_inputsms"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
