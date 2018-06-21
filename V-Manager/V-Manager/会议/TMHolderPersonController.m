//
//  TMHolderPersonController.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMHolderPersonController.h"
#import "TMPersonCollectCell.h"

@interface TMHolderPersonController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation TMHolderPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"举办方成员";
    
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 40)];
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
    
    UIButton *editB = [UIButton buttonWithType:UIButtonTypeCustom];
    editB.tag = 101;
    editB.frame = CGRectMake(0, self.collectionView.maxY, kScreenW, 50);
    editB.backgroundColor = kRGBColor(255, 255,255, 1);
    editB.titleLabel.font = Font12;
    [editB setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
    [editB setTitle:@"展开全部" forState:UIControlStateNormal];
    [self.view addSubview:editB];
    [editB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *notiB = [UIButton buttonWithType:UIButtonTypeCustom];
    notiB.tag = 102;
    notiB.frame = CGRectMake(0, editB.maxY+5, kScreenW, 50);
    notiB.backgroundColor = kRGBColor(255, 255,255, 1);
    notiB.titleLabel.font = Font12;
    [notiB setTitleColor:kRGBColor(35, 35, 35, 1) forState:UIControlStateNormal];
    [notiB setTitle:@"公告" forState:UIControlStateNormal];
    [self.view addSubview:notiB];
    [notiB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *leaveB = [UIButton buttonWithType:UIButtonTypeCustom];
    leaveB.tag = 103;
    leaveB.frame = CGRectMake(0, notiB.maxY+10, kScreenW, 50);
    leaveB.backgroundColor = kRGBColor(255, 255,255, 1);
    leaveB.titleLabel.font = Font12;
    [leaveB setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leaveB setTitle:@"退出会议" forState:UIControlStateNormal];
    [self.view addSubview:leaveB];
    [leaveB addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button {
    NSLog(@"button.tag = %ld", button.tag);
    if (button.tag == 101) {
        
    }
    if (button.tag == 102) {
        
    }
    if (button.tag == 103) {
        
    }
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        CGFloat  maxCol = 5;
        CGFloat itemH = 70;
        CGFloat itemW = 50;
        CGFloat margin = 15;
        CGFloat space = (kScreenW-2*margin-maxCol*itemW)/4;
        space = (kScreenW-5*itemW)/6;
        layout.itemSize = CGSizeMake(itemW, itemH);
        //minimumInteritemSpacing 设置同一列中间隔的cell最小间距。
        layout.minimumInteritemSpacing = space;
        //minimumLineSpacing 设置最小行间距
        layout.minimumLineSpacing = margin;
        
        layout.sectionInset = UIEdgeInsetsMake(space,space,0, space);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, kScreenW, 300) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[TMPersonCollectCell class] forCellWithReuseIdentifier:[TMPersonCollectCell identifer]];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 56;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TMPersonCollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TMPersonCollectCell identifer] forIndexPath:indexPath];
    cell.personNameLabel.text = @"qwert";
    cell.personImageView.image = [UIImage imageNamed:@"placeholder"];
    //cell.backgroundColor = [UIColor greenColor];
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点我");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
