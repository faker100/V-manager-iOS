//
//  TMChatViewController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/14.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMChatViewController.h"
#import "TMMeetChatViewModel.h"
#import "TMMeetChat.h"
#import "TMMeetChatCell.h"

@interface TMChatViewController ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UIScrollViewDelegate>
/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* bottomView */
@property (nonatomic, strong) UIView *bottomView;

/* textField*/
@property (nonatomic, strong) UIView *tf;

/* dataArray */
@property (nonatomic, strong) NSMutableArray *dataArray;

/* dataArrayFrames */
@property (nonatomic, strong) NSMutableArray *dataArrayFrames;

@end

@implementation TMChatViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-SafeAreaTop-_titleH-40) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), kScreenW, 40)];
        [self.view addSubview:bottomView];
        bottomView.backgroundColor = Color(244, 244, 244);
        
        UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, kScreenW-80, 40)];
        [bottomView addSubview:tf];
        //tf.borderStyle = UITextBorderStyleLine;
        tf.delegate = self;
        tf.backgroundColor = [UIColor clearColor];
        tf.placeholder = @"请输入消息";
        [tf setValue:Color(220, 220, 220) forKeyPath:@"_placeholderLabel.textColor"];
        [tf setValue:Font13 forKeyPath:@"_placeholderLabel.font"];
        tf.tintColor = [UIColor blackColor];
        self.tf = tf;
        
        UIButton *meetBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW-70, 5, 60, 30)];
        [bottomView addSubview:meetBtn];
        meetBtn.titleLabel.font = Font13;
        [meetBtn setTitle:@"发送" forState:UIControlStateNormal];
        [meetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [meetBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        meetBtn.layer.cornerRadius = 5;
        meetBtn.layer.masksToBounds = YES;
        meetBtn.backgroundColor = Color(252, 88, 90);
        
        _bottomView = bottomView;
    }
    return _bottomView;
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        TMMeetChat *chat0 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。"];
         TMMeetChat *chat1 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。"];
        TMMeetChat *chat2 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。"];
        TMMeetChat *chat3 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。"];
        TMMeetChat *chat4 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。"];
        TMMeetChat *chat5 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅" andContent:@"这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。这是一个测试。这是一个测试这是一个测试。"];
        TMMeetChat *chat6 = [TMMeetChat creatModelwithImgName:@"placeholder" andName:@"张帅6" andContent:@"这是一个测试。这是一个测试这是一个测试。"];
        
        _dataArray = [NSMutableArray arrayWithObjects:chat0,chat1,chat2,chat3,chat4,chat5,chat6, nil];
        
    }
    return _dataArray;
}

- (NSMutableArray *)dataArrayFrames {
    if (!_dataArrayFrames) {
        _dataArrayFrames = [NSMutableArray array];
        for (TMMeetChat *model in self.dataArray) {
            TMMeetChatViewModel *viewModel = [TMMeetChatViewModel new];
            viewModel.model = model;
            [self.dataArrayFrames addObject:viewModel];
        }
    }
    return _dataArrayFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
 
    // 键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShown:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHiden:) name:UIKeyboardWillHideNotification object:nil];
    
    // 滚动scrollview通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDisappear) name:@"keyboardDis" object:nil];
    
    //手势
    UITapGestureRecognizer *tag =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tag:)];
    [self.view addGestureRecognizer:tag];
}


#pragma mark - buttonClick
- (void)BtnClick:(UIButton *)button {
    //[self.tf endEditing:YES];
}

#pragma mark -键盘监听方法
- (void)keyboardWillShown:(NSNotification *)notification
{
    // 获取键盘的高度
    CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSDictionary *userInfo = [notification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    CGFloat keyBoardDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    

    [UIView animateWithDuration:keyBoardDuration animations:^{
        self.bottomView.y -= frame.size.height;
        self.tableView.height -= frame.size.height;
        self.tableView.contentOffset = CGPointMake(0, self.tableView.contentOffset.y+frame.size.height);
    }];
}

- (void)keyboardWillBeHiden:(NSNotification *)notification
{
    CGRect frame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.bottomView.y += frame.size.height;
    self.tableView.height += frame.size.height;
    self.tableView.contentOffset = CGPointMake(0, self.tableView.contentOffset.y);
}

- (void)keyboardDisappear {
    [self.tf endEditing:YES];
}

#pragma mark - 手势
- (void)tag:(UITapGestureRecognizer *)tag {
    [self.tf endEditing:YES];
}

#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrayFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMeetChatCell *cell = [TMMeetChatCell TMMeetChatCellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.viewModel = self.dataArrayFrames[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMMeetChatViewModel *viewModel = self.dataArrayFrames[indexPath.row];
    return viewModel.cellHeight;
}

#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    textField.text = nil;
    [textField resignFirstResponder];
   return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"keyboardDis" object:nil];
}


@end
