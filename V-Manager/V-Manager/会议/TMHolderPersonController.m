//
//  TMHolderPersonController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMHolderPersonController.h"

@interface TMHolderPersonController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TMHolderPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"举办方成员";
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, SafeAreaTop, kScreenW, 40)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel *personL = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
    personL.text = @"群聊成员";
    personL.textColor = [UIColor grayColor];
    personL.font = Font11;
    personL.textAlignment = NSTextAlignmentLeft;
    [topView addSubview:personL];
   
    UILabel *personNumL = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-65, 12.5, 50, 20)];
    personNumL.text = @"共15人";
    personNumL.textColor = [UIColor grayColor];
    personNumL.font = Font11;
    personNumL.textAlignment = NSTextAlignmentRight;
    [topView addSubview:personNumL];
    
    [self.view addSubview:self.collectionView];
    
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat  maxCol = 6;
        CGFloat itemH = 60;
        CGFloat margin = 8;
        CGFloat itemW   = (kScreenW - (margin * (maxCol +1)))/maxCol;
        layout.itemSize = CGSizeMake(itemW, itemH);
        //minimumInteritemSpacing 设置同一列中间隔的cell最小间距。
        layout.minimumInteritemSpacing = margin;
        //minimumLineSpacing 设置最小行间距
        layout.minimumLineSpacing      = margin;
        layout.sectionInset = UIEdgeInsetsMake(0,margin,0, margin);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[ZFilterCell class] forCellWithReuseIdentifier:[ZFilterCell identifer]];
    }
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
