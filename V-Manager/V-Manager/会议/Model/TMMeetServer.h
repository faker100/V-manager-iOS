//
//  TMMeetServer.h
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMMeetServer : NSObject

/* imgName */
@property (nonatomic, strong) NSString *imgName;

/* name */
@property (nonatomic, strong) NSString *name;

/* content */
@property (nonatomic, strong) NSString *content;

/* date */
@property (nonatomic, strong) NSString *date;

+ (instancetype)creatModelWith:(NSString *)imgName andName:(NSString *)name andContent:(NSString *)content andDate:(NSString *)date;

@end
