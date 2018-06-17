//
//  KNPch.h
//  KNPhotoBrower
//
//  Created by LuKane on 16/8/16.
//  Copyright © 2016年 LuKane. All rights reserved.
//

#ifndef ScreenWidth
    #define ScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef ScreenHeight
    #define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

#define PhotoBrowerBackgroundAlpha 1.f
#define PhotoBrowerBrowerTime      .3f
#define PhotoBrowerMargin          20.f

#define PhotoSaveImageSuccessMessage  @"保存成功!!"
#define PhotoSaveImageFailureMessage @"保存失败!!"
#define PhotoSaveImageMessageTime    2
#define PhotoSaveImageFailureReason  @"图片需要下载完成"

#import "UIView+PBExtesion.h"
