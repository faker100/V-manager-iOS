//
//  InputSMSViewController.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "InputSMSViewController.h"

@interface InputSMSViewController ()
@property (strong, nonatomic) IBOutlet JKCountDownButton *getSMSBtn;
@property (strong, nonatomic) IBOutlet UITextField *phoneTf;
@property (strong, nonatomic) IBOutlet UIButton *confirmBtn;
- (IBAction)getSMSBtnPressed:(JKCountDownButton *)sender;

@end

@implementation InputSMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI
{
    int second = [[[NSUserDefaults standardUserDefaults ] valueForKey:@"tm-timer"] intValue];
    //button type要 设置成custom 否则会闪动
    [self.getSMSBtn startWithSecond:second];
    
    [self.getSMSBtn didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
        NSString *title = [NSString stringWithFormat:@"(%d\")重新获取",second];
        return title;
    }];
    [self.getSMSBtn didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        
        return @"获取验证码";
    }];
    // 校验下一步按钮是否可用
    RACSignal *formValid = [RACSignal combineLatest:@[
                                                      self.phoneTf.rac_textSignal ,
                                                      ]
                                             reduce:^(NSString *phoneNumber) {
                                                 return @(![phoneNumber n6_isMobile] && [phoneNumber n6_trimmedString].length > 0);
                                             }];
    RAC(self.confirmBtn, enabled) = formValid;
    
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
        NSString *title = [NSString stringWithFormat:@"(%d\")重新获取",second];
        return title;
    }];
    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        countDownButton.enabled = YES;
        
        return @"获取验证码";
    }];
}
@end
