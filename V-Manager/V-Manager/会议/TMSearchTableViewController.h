//
//  TMSearchTableViewController.h
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/16.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "BaseTableViewController.h"
//多个窗口共同调用会议查询接口，分类型传递
typedef NS_ENUM(NSInteger, searchMeetingType) {
    searchMeetingAll,    //全部
    searchMeetingToday,  //今日
    searchMeetingFollow, //关注
    searchMeetingWait    //待办
};
//查询关键字类型
typedef NS_ENUM(NSInteger, searchKeywordType) {
    searchKeywordMeetingName,    //会议名称
    searchKeywordVmeeting,  //V智会
    searchKeywordImportant, //重要
    searchKeywordSaleName,    //销售姓名
    searchKeywordMeetingAddress   //会议地点
};



@interface TMSearchTableViewController : BaseTableViewController
@property(assign,nonatomic) searchMeetingType searchType;
@property (nonatomic, strong) UISearchBar *searchBar;
@end
