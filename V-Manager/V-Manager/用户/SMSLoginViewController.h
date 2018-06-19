//
//  SMSLoginViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/12.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "BaseViewController.h"

@interface SMSLoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet JKCountDownButton *getSMSBtn;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong,nonatomic) NSTimer *timer;
@end
