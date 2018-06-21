//
//  YZCViewController.m
//  YZCSegmentController
//
//  Created by dyso on 16/8/1.
//  Copyright © 2016年 yangzhicheng. All rights reserved.
//

#import "YZCViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define titleWidth SCREEN_WIDTH/_titleArray.count
#define backColor [UIColor colorWithWhite:0.300 alpha:1.000]

#define iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define SafeAreaTop (iPhoneX ? 88 : 64)

@interface YZCViewController ()<UIScrollViewDelegate> {
    UIButton *selectButton;
    UIView *_sliderView;
    UIViewController *_viewController;
    UIScrollView *_scrollView;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation YZCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _buttonArray = [NSMutableArray array];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initWithTitleButton];
}

- (void)setControllerArray:(NSArray *)controllerArray {
    _controllerArray = controllerArray;
    [self initWithController];
}

- (void)initWithTitleButton
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _titleH)];
    titleView.backgroundColor = _titleC;
    [self.view addSubview:titleView];
  
    if (self.navigationController.navigationBar) {
        titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _titleH);
    }
    else {
        titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _titleH);
    }
    
    for (int i = 0; i < _titleArray.count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(titleWidth*i, 0, titleWidth, _titleH);
        [titleButton setTitle:_titleArray[i] forState:UIControlStateNormal];
        [titleButton setTitleColor:backColor forState:UIControlStateNormal];
        titleButton.tag = 100+i;
        [titleButton addTarget:self action:@selector(scrollViewSelectToIndex:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleView addSubview:titleButton];
    
        if (i == 0) {
            selectButton = titleButton;
            [selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        [_buttonArray addObject:titleButton];
    }
    
    //滑块
    _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, _titleH-1, titleWidth, 1)];
    _sliderView.backgroundColor = [UIColor redColor];
    [titleView addSubview:_sliderView];
}

- (void)scrollViewSelectToIndex:(UIButton *)button
{
    [self selectButton:button.tag-100];
    [UIView animateWithDuration:0 animations:^{
        _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH*(button.tag-100), 0);
    }];
}

//选择某个标题
- (void)selectButton:(NSInteger)index
{
    [selectButton setTitleColor:backColor forState:UIControlStateNormal];
    selectButton = _buttonArray[index];
    [selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        _sliderView.frame = CGRectMake(titleWidth*index, _titleH-1, titleWidth, 1);
    }];
}

//监听滚动事件判断当前拖动到哪一个了
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    [self selectButton:index];
  
    //NSLog(@"scrollView.contentOffset.x = %lf",scrollView.contentOffset.x);
  
    //处理键盘事件
    CGFloat contentX = scrollView.contentOffset.x;
    if (contentX == 0 ||contentX == 2*SCREEN_WIDTH || contentX == 3*SCREEN_WIDTH) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keyboardDis" object:self];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
}

- (void)initWithController
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.backgroundColor = [UIColor orangeColor];
    
    if (self.navigationController.navigationBar) {
        scrollView.frame = CGRectMake(0, _titleH, SCREEN_WIDTH, SCREEN_HEIGHT-_titleH-SafeAreaTop);
    } else {
        scrollView.frame = CGRectMake(0, _titleH, SCREEN_WIDTH, SCREEN_HEIGHT-_titleH);
    }
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_controllerArray.count, 0);
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
  
    for (int i = 0; i < _controllerArray.count; i++) {
        UIView *viewcon = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIViewController *viewcontroller = _controllerArray[i];
        viewcon = viewcontroller.view;
        viewcon.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, scrollView.height);

        [scrollView addSubview:viewcon];
    }
}


@end
