//
//  TMPersonCollectCell.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/19.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMPersonCollectCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *personImageView;
@property (nonatomic, strong) UILabel *personNameLabel;

+ (NSString *)identifer;
@end
