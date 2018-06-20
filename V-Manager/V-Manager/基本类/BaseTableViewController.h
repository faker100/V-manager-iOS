//
//  BaseTableViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController
@property (nonatomic, weak) VMUserInfo*        userInfo;
@property (nonatomic, weak) VMConfig*          config;
@property (nonatomic, weak) VMNetworkService*  networkService;
@property (nonatomic, copy) NSString*           networkAccessIdentifier;
@property (nonatomic, strong) UIImageView*        norecordImageView;
@property (nonatomic, strong) UILabel*        norecordLabel;

/**
 *  统一导航栏与内容的距离
 */
- (void)setUpTableViewHeaderView;

- (void)showToastMessage:(NSString*)message;
- (void)adjustHeightOfTableview;
@end
