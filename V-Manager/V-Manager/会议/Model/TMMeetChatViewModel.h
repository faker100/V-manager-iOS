//
//  TMMeetChatViewModel.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TMMeetChat;

@interface TMMeetChatViewModel : NSObject
/* model */
@property (nonatomic, strong) TMMeetChat *model;

/* cellHeight */
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic ,assign) CGRect imgViewFrame;

@property (nonatomic ,assign) CGRect nameFrame;

@property (nonatomic ,assign) CGRect contentFrame;

@property (nonatomic ,assign) CGRect bgviewFrame;

@end
