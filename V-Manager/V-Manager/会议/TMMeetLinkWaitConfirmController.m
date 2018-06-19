//
//  TMMeetLinkWaitConfirmController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetLinkWaitConfirmController.h"

@interface TMMeetLinkWaitConfirmController ()

/* personView */
@property (nonatomic, strong) UIView *personView;

@end

@implementation TMMeetLinkWaitConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"会议环节待确认";
    
    [self initViews];
}

- (void)initViews {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTop, kScreenW, 40)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, bgView.height)];
    [bgView addSubview:lable];
    lable.text = @"确认内容";
    lable.textColor = [UIColor lightGrayColor];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.font = Font11;
    
    UILabel *rightLable = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-115, 0, 100, bgView.height)];
    [bgView addSubview:rightLable];
    rightLable.text = @"11:40会场午餐就绪";
    rightLable.textColor = [UIColor blackColor];
    rightLable.textAlignment = NSTextAlignmentRight;
    rightLable.font = Font11;
    
    //UIView *personView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame)+20, kScreenW, 40)];
    //personView.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:personView];
    //self.personView = personView;
    
    
    UIButton *addPerson = [UIButton buttonWithType:UIButtonTypeCustom];
    addPerson.frame = CGRectMake(0, CGRectGetMaxY(bgView.frame)+20, kScreenW, 40);
    addPerson.titleLabel.font = Font11;
    addPerson.backgroundColor = [UIColor whiteColor];
    [addPerson setTitle:@"+ 添加负责人" forState:UIControlStateSelected];
    [addPerson setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [addPerson setTitle:@"+ 添加负责人" forState:UIControlStateNormal];
    [addPerson setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:addPerson];
    [addPerson addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, .5)];
    lineLabel.backgroundColor = kRGBColor(113, 113, 113, 0.5);
    [addPerson addSubview:lineLabel];
    
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, kScreenW, 40)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    UILabel *troLable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, bottomView.height)];
    [bottomView addSubview:troLable];
    troLable.text = @"有无问题";
    troLable.textColor = [UIColor lightGrayColor];
    troLable.textAlignment = NSTextAlignmentLeft;
    troLable.font = Font11;
    
    UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(kScreenW-65, 5, 0, 0)];
    [bottomView addSubview:sw];
    [sw addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    UIButton *conBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    conBtn.frame = CGRectMake(0, kScreenH-50, kScreenW, 50);
    conBtn.titleLabel.font = Font11;
    conBtn.backgroundColor = [UIColor grayColor];
    [conBtn setTitle:@"确认" forState:UIControlStateSelected];
    [conBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [conBtn setTitle:@"确认" forState:UIControlStateNormal];
    [conBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:conBtn];
    [conBtn addTarget:self action:@selector(conBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)switchAction:(UISwitch *)sw {
    
}

- (void)conBtnClick:(UIButton *)button {
    
}

- (void)btnClick:(UIButton *)button {
    //self.personView.height += 40;
    button.y +=40;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
