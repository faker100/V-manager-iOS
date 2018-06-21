//
//  TMMetChat.m
//  V-Manager
//
//  Created by 塔米 on 2018/6/20.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "TMMeetChat.h"

@implementation TMMeetChat

+(instancetype)creatModelwithImgName:(NSString *)imgName andName:(NSString *)name andContent:(NSString *)content {
    TMMeetChat *model = [TMMeetChat new];
    model.imgName = imgName;
    model.name = name;
    model.content = content;
    return model;
}

@end
