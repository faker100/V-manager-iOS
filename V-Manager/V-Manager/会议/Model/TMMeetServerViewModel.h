//
//  TMMeetServerViewModel.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMMeetServer;
@interface TMMeetServerViewModel : NSObject

/* model */
@property (nonatomic, strong) TMMeetServer *model;


@property (nonatomic ,assign) CGRect imgViewFrame;

@property (nonatomic ,assign) CGRect nameFrame;

@property (nonatomic ,assign) CGRect contentFrame;

@property (nonatomic ,assign) CGRect dateFrame;

@property (nonatomic ,assign) CGRect bgviewFrame;

/**
 *  cell高度
 */
@property (nonatomic ,assign) CGFloat cellHeight;

@end
