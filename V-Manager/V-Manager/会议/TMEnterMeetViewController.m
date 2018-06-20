//
//  TMEndMeetViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMEnterMeetViewController.h"
#import "MeetingHeaderView.h"
#import "TMStatusView.h"
#import "TMHolderPersonController.h"

@interface TMEnterMeetViewController (){
    NSMutableArray *stateArray;
}
/* MeetingHeaderView.h */
@property (nonatomic, strong) MeetingHeaderView *headerView;

@end

@implementation TMEnterMeetViewController
#pragma mark - lazy
- (MeetingHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MeetingHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeaderViewH)];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"进入会议";
    
    stateArray = [NSMutableArray arrayWithObjects:@"上午会场就绪",@"会议开始",@"茶歇就绪",@"餐厅午餐就绪", @"下午会场准备",@"会议开始",@"茶歇就绪",@"餐厅晚餐就绪",@"夜晚会场准备",@"会议开始",@"茶歇就绪",@"餐厅晚宴就绪",nil];
    
    [self initViews];
}

- (void)initViews {
    [self.view addSubview:self.headerView];
    
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, HeaderViewH, kScreenW, 90)];
    sc.contentSize = CGSizeMake(stateArray.count*90, 0);
    [self.view addSubview:sc];
    sc.backgroundColor = [UIColor whiteColor];
    
    for (int i= 0; i<stateArray.count; i++) {
        TMStatusView *view = [[TMStatusView alloc] initWithFrame:CGRectMake(i*90, 0, 90, 90)];
        [sc addSubview:view];
        view.titleL.text = stateArray[i];
        
        if (i == 0) {
            view.leftL.hidden = YES;
        }
        if (i == stateArray.count-1) {
            view.rightL.hidden = YES;
        }
    }
    
    
    UIButton *serverBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sc.frame)+10, kScreenW, 45)];
    serverBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:serverBtn];
    serverBtn.tag = 101;
    
    UIImageView *serverImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
    [serverBtn addSubview:serverImg];
    serverImg.image = [UIImage imageNamed:@"icon_分类"];
    
    UILabel *serverL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(serverImg.frame)+5, 15, 100, 20)];
    serverL.text = @"会议服务群";
    serverL.textColor = [UIColor grayColor];
    serverL.font = Font11;
    serverL.textAlignment = NSTextAlignmentLeft;
    [serverBtn addSubview:serverL];
    serverImg.centerY = serverL.centerY;
    
    UILabel *serverRightL = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-65, 12.5, 50, 20)];
    serverRightL.text = @"进入";
    serverRightL.textColor = [UIColor grayColor];
    serverRightL.font = Font11;
    serverRightL.textAlignment = NSTextAlignmentRight;
    [serverBtn addSubview:serverRightL];
    
    [serverBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UIButton *personBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(serverBtn.frame)+1, kScreenW, 45)];
    personBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:personBtn];
    personBtn.tag = 102;
    
    UIImageView *personImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 15, 15)];
    [personBtn addSubview:personImg];
    personImg.image = [UIImage imageNamed:@"icon_分类"];
   
    UILabel *personL = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(personImg.frame)+5, 15, 100, 20)];
    personL.text = @"主办方成员";
    personL.textColor = [UIColor grayColor];
    personL.font = Font11;
    personL.textAlignment = NSTextAlignmentLeft;
    [personBtn addSubview:personL];
    personImg.centerY = personL.centerY;
    
    UILabel *personRightL = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-65, 12.5, 50, 20)];
    personRightL.text = @"查看";
    personRightL.textColor = [UIColor grayColor];
    personRightL.font = Font11;
    personRightL.textAlignment = NSTextAlignmentRight;
    [personBtn addSubview:personRightL];
    
    [personBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH-50-SafeAreaTop, kScreenW, 50)];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lineL = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW*0.5-0.5, 15, 1, 20)];
    lineL.backgroundColor = [UIColor grayColor];
    [bottomView addSubview:lineL];
    
    UIButton *meetBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW/2, 50)];
    [bottomView addSubview:meetBtn];
    meetBtn.titleLabel.font = Font11;
    meetBtn.tag = 103;
    [meetBtn setTitle:@"会议详情" forState:UIControlStateNormal];
    [meetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [meetBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *VIPBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW/2, 0, kScreenW/2, 50)];
    [bottomView addSubview:VIPBtn];
    VIPBtn.titleLabel.font = Font11;
    VIPBtn.tag = 104;
    [VIPBtn setTitle:@"VIP详情" forState:UIControlStateNormal];
    [VIPBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [VIPBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)BtnClick:(UIButton *)button {
    NSLog(@"button.tag = %ld",(long)button.tag);
    if (button.tag == 101) {
        
    }
    
    if (button.tag == 102) {
        TMHolderPersonController *vc = [TMHolderPersonController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (button.tag  == 103) {
        
    }
    
    if (button.tag == 104) {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
