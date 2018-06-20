//
//  TMMeetServer.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetServer.h"

@implementation TMMeetServer

+ (instancetype)creatModelWith:(NSString *)imgName andName:(NSString *)name andContent:(NSString *)content andDate:(NSString *)date {
    TMMeetServer *meetServer = [[TMMeetServer alloc] init];
    meetServer.imgName = imgName;
    meetServer.name = name;
    meetServer.content = content;
    meetServer.date = date;
    return meetServer;
}
@end
