//
//  SMSLoginViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "SMSLoginViewController.h"

@interface SMSLoginViewController ()
{
    int timeCount;
    NSString *smsCode;
}
@property (strong, nonatomic) IBOutlet UITextField *phoneNoTf;
@property (strong, nonatomic) IBOutlet UITextField *smsCodeTf;


- (IBAction)getSMSBtnPressed:(JKCountDownButton *)sender;
- (IBAction)loginBtnPressed:(UIButton *)sender;

@end

@implementation SMSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
            [self.timer invalidate];
}
-(void)initUI
{
    self.navigationItem.title=@"登陆";
    
    
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

- (IBAction)getSMSBtnPressed:(JKCountDownButton *)sender {

        
        sender.enabled = NO;
     
        int second = [[[NSUserDefaults standardUserDefaults ] valueForKey:@"tm-timer"] intValue];
        //button type要 设置成custom 否则会闪动
        [sender startWithSecond:second];
        
        [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
            NSString *title = [NSString stringWithFormat:@"(%d\")重新发送",second];
            return title;
        }];
        [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;

            return @"获取验证码";
        }];
    
}

- (IBAction)loginBtnPressed:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if (([self.smsCodeTf.text length] < 1)  || (![self.smsCodeTf.text  n6_isNumber])  ) {
        [self showToastMessage:@"请输入正确短信验证码"];
        return;
    }
    
 //   [self checkSMSCode];

}
@end

