//
//  VMNetworkService.m
//  V-Manager
//
//  Created by ZhaoMirror on 2018/6/4.
//  Copyright © 2018年 com.tamigroup. All rights reserved.
//

#import "VMNetworkService.h"

NSString * kVMMessageURI =@"http://192.168.103.104:8080/apis/tm";
//NSString * kVMMessageURI =@"http://test.yundaoapp.com/yundao-api";

NSString * endPoint = @"http://oss-cn-beijing.aliyuncs.com";
NSString *  multipartUploadKey = @"multipartUploadObject";

NSString * kVMErrorDomain          = @"VM.errors";
NSString * kVMErrorDescriptionKey  = @"VM.errors.description";
NSString * kVMErrorOriginal        = @"VM.errors.original";
NSString * kVMOperationIdentifier  = @"operation_identifier";
//分享Type


//NSString * kVMErrorPasswordCode    = @"error_code";
static double kDelayInSeconds = 0.25;




@interface VMNetworkService()

@property (nonatomic, strong) AFHTTPSessionManager *networkManager;
@property (nonatomic, strong) AFHTTPSessionManager *networkUploadManager;
@property (nonatomic, strong) AFNetworkReachabilityManager  *reachabilityManager;

@end

@implementation VMNetworkService {
    NSDictionary *errorMessage_;
}

/**
 *  获取单例对象
 */
+ (VMNetworkService *)sharedService {
    static dispatch_once_t predicate = 0;
    static VMNetworkService *object = nil;
    dispatch_once(&predicate, ^{ object = [[self class] new]; });
    return object;
}

- (id)init {
    if ((self = [super init])) {
        
        self.config = [VMConfig shared];
        self.userInfo = [VMUserInfo shared];
        
        // 暂时锁住网络访问
        self.lock = YES;
        
        errorMessage_
        = @{
            @(VMNetworkErrorCodeUnavailable)   : @"未能连接上服务器",
            @(VMNetworkErrorCodeAccessTimeOut) : @"网络访问超时，请重新访问",
            @(VMNetworkErrorCodeFail)          : @"服务维护中，请稍候重新打开APP",
            @(VMNetworkErrorCodeTimeOut)       : @"访问服务超时",
            @(VMNetworkErrorCodeNoAuth)        : @"请登录",
            @(VMNetworkErrorCodeConcurrent)    : @"您已在别处登录此处已下线",
            @(VMNetworkErrorCodeAuthFail)      : @"用户名或密码错误",
            @(VMNetworkErrorCodeVfCodeWrong)   : @"验证码输入有误",
            @(VMNetworkErrorCodeVfCodeBlank)   : @"请输入验证码",
            @(VMNetworkErrorCodeBusinessError)  : @"交易错误",
            };
        
        // 初始化请求对象
        self.networkManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kVMMessageURI]];
        // 设置请求最大并发数
        self.networkManager.operationQueue.maxConcurrentOperationCount = 1;
        // 初始化上传对象
        self.networkUploadManager = [AFHTTPSessionManager manager];
        self.networkUploadManager.operationQueue.maxConcurrentOperationCount = 1;
        // 设置上传最大并发数
        self.networkStatus = AFNetworkReachabilityStatusNotReachable;
    }
    return self;
}

/**
 *  开始检测网络
 */
- (void)startMonitoringNetworkStatus {
    @weakify(self);
    [self.networkManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        @strongify(self);
        
        NSOperationQueue *operationQueue = self.networkManager.operationQueue;
        self.networkStatus = status;
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                DDLogVerbose(@">>>>    WAN");
                
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
                DDLogVerbose(@">>>>    Service online");
                
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
            {
                DDLogVerbose(@">>>>    Service offline");
                [operationQueue setSuspended:YES];
            }
                break;
        }
    }];
    [self.networkManager.reachabilityManager startMonitoring];
}

/**
 *  停止检测网络
 */
- (void)stopMonitoringNetworkStatus {
    DDLogVerbose(@">>>>    Stop monitoring network status");
    [self.networkManager.reachabilityManager stopMonitoring];
}

/**
 *  发送post请求,请求前先判断下是否已登录
 */
- (void)postMessageRequest:(MessageRequest*)messageRequest
            taskIdentifier:(NSString*)taskIdentifier
                 inSession:(BOOL)inSession
           disbleOperation:(BOOL)disableOperation
               layerString:(NSString*)layerString
                completion:(void (^)(MessageResponse * messageResponse, NSError *err))completion
{
    // 检测网络
    if (![self isNetworkAvailable]) {
        return;
    }
    
    // 隐式登录:根据sessionId判断是否已登录
    if (inSession) {
        if (self.userInfo.token==nil) {
            // 没有token
            NSError *err = [NSError errorWithDomain:kVMErrorDomain
                                               code:VMNetworkErrorCodeTimeOut
                                           userInfo:@{kVMErrorDescriptionKey: @"您未登录，请重新登录"}];
            completion(nil, err);
        } else {  // sessionId没过期
            [self postMessageRequest:messageRequest
                          identifier:taskIdentifier
                    disableOperation:(BOOL)disableOperation
                         layerString:(NSString*)layerString
                          completion:^(MessageResponse *messageResponse, NSError *err)
             {
                 if (err) {
                     completion(messageResponse, err);
                 } else {
                     completion(messageResponse, nil);
                 }
             }];
        }
    } else {
        // 根据所给的messageRequest报文发送post请求
        
        
        [self postMessageRequest:messageRequest identifier:taskIdentifier   disableOperation:disableOperation  layerString:layerString completion:^(MessageResponse *messageResponse, NSError *err)
         {
             if (err) {
                 completion(nil, err);
             } else {
                 completion(messageResponse, nil);
             }
         } ];
    }
}

/**
 *
 *  根据所给messageRequest报文发送post请求
 */
- (void)postMessageRequest:(MessageRequest*)messageRequest
                identifier:(NSString*)identifier
          disableOperation:(BOOL)disableOperation
               layerString:(NSString*)layerString
                completion:(void (^)(MessageResponse * messageResponse, NSError *err))completion
{
    
  NSString *URLString = [NSString stringWithFormat:@"%@/%@", kVMMessageURI, [[messageRequest class] RA_type]];
  //  NSString *URLString = [NSString stringWithFormat:@"%@", kVMMessageURI];
    DDLogDebug(@"😁访问地址:%@", URLString);
    // 初始化请求对
    NSMutableURLRequest *URLRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    DDLogDebug(@"😜发送报文:\n%@", [messageRequest toString]);
    // 设置请求头信息
    NSData *bodyData = [[messageRequest toString] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *test=[messageRequest toString];
    [URLRequest setHTTPBody:bodyData];
    
    [URLRequest  addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[bodyData length]]
       forHTTPHeaderField:@"Content-Length"];
    
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest  addValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [URLRequest  addValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    [URLRequest addValue:self.userInfo.token forHTTPHeaderField:@"token"];
    [URLRequest setTimeoutInterval:self.config.networkAccessTimeout];
    
    // 添加加载蒙版
    if (   disableOperation) {
        
        [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
        if ((layerString) && ([layerString length]>0))
        {
            [SVProgressHUD showWithStatus:layerString];
        }
        else
        {
            [SVProgressHUD showWithStatus:@"请求中..."];
        }
        // 加载时禁止页面交互
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    }
    
    // 隐藏加载蒙版
    dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, kDelayInSeconds * NSEC_PER_SEC);
    dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^{
        [SVProgressHUD popActivity];
    });
    
    //构建会话
    NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    //会话任务
    NSURLSessionTask *task = [session dataTaskWithRequest:URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //如果有错误
        if (error)
        {
            if (disableOperation)
            {
                [SVProgressHUD popActivity];
            }
            DDLogDebug(@"network.error:%@", error);
            [self showToastMessage:@"无法连接服务器"];
            completion(nil, error);
            return;
        }
        NSString *responseString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        DDLogDebug(@"🤡🤡响应报文:\n%@", responseString);
        MessageResponse *messageResponse = [ [[messageRequest class] responseClass] responseWithReponseData:data];
        if (messageResponse) {
            long statasCode = messageResponse.code ;
            switch (statasCode) {
                case VMNetworkErrorCodeSuccess: {
                    completion(messageResponse, nil);
                }
                    break;
                case VMNetworkErrorCodeFail: {
                    
                    NSError *err = [NSError errorWithDomain:kVMErrorDomain
                                                       code:statasCode
                                                   userInfo:@{kVMErrorDescriptionKey: [messageResponse message]}];
                    completion(messageResponse, err);
                    break;
                    
                }
                    
                default: {
                    
                    NSError *err = [NSError errorWithDomain:kVMErrorDomain
                                                       code:statasCode
                                                   userInfo:@{kVMErrorDescriptionKey:[messageResponse message]} ];
                    completion(nil, err);
                }
                    break;
            }
        }
        else
        {
            NSError *err = [NSError errorWithDomain:kVMErrorDomain
                                               code:VMNetworkErrorCodeFail
                                           userInfo:@{kVMErrorDescriptionKey: errorMessage_[@(VMNetworkErrorCodeFail)]}];
            completion(nil, err);
        }
        
        
        
    }];
    [task resume];
    //
    
    
}

/**
 *  判断sessionId是否过期
 */
- (BOOL) isSessionTimeout {
    if (nil == self.userInfo.token) return YES;
    else return NO;
}

/**
 *  网络是否可用
 */
- (BOOL)isNetworkAvailable {
    //    return !(self.networkStatus == AFNetworkReachabilityStatusNotReachable);
    return YES;
}
/**
 * 显示弹出式信息
 */
- (void)showToastMessage:(NSString*)message {
    CGRect scrBounds = [[UIScreen mainScreen]bounds];
    CGPoint toastPosition = CGPointMake(scrBounds.size.width / 2, scrBounds.size.height - 100);
    
    [[AppDelegate instance].window makeToast:message
                                    duration:1.25f
                                    position:[NSValue valueWithCGPoint:toastPosition]];
}



///**
// * 取消全部访问
// */
//- (void) cancelAllOperations {
//    for (AFHTTPRequestOperation *op in self.networkManager.operationQueue.operations) {
//        if (op.isExecuting || op.isReady) {
//            [op cancel];
//        }
//    }
//
//    for (AFHTTPRequestOperation *op in self.networkUploadManager.operationQueue.operations) {
//        if (op.isExecuting || op.isReady) {
//            [op cancel];
//        }
//    }
//}
//
///**
// * 取消指定的访问
// */
//- (void)cancelSpecifiedOperaions:(NSArray*)identifiers {
//    for (NSString *iden in identifiers) {
//        for (AFHTTPRequestOperation *op in self.networkManager.operationQueue.operations) {
//            if ([op.userInfo[kVMOperationIdentifier] isEqualToString:iden]
//                && (op.isExecuting || op.isReady)) {
//                [op cancel];
//            }
//        }
//    }
//
//    for (NSString *iden in identifiers) {
//        for (AFHTTPRequestOperation *op in self.networkUploadManager.operationQueue.operations) {
//            if ([op.userInfo[kVMOperationIdentifier] isEqualToString:iden]
//                && (op.isExecuting || op.isReady)) {
//                [op cancel];
//            }
//        }
//    }
//}
//
///**
// * 目标访问是否处于访问中状态
// */
//- (BOOL)isSpecifiedTasksBusy:(NSArray*)taskIdenfiers {
//    for (NSString *iden in taskIdenfiers) {
//        for (AFHTTPRequestOperation *op in self.networkManager.operationQueue.operations) {
//            if ([op.userInfo[kVMOperationIdentifier] isEqualToString:iden]
//                && (op.isExecuting || op.isReady)) {
//                return YES;
//            }
//        }
//    }
//    return NO;
//}
//
//
///**
// * 目标访问是否处于访问中状态
// */
//- (BOOL)isSpecifiedTaskBusy :(NSString*)taskIdenfier {
//    return [self isSpecifiedTasksBusy:@[taskIdenfier]];
//}
//
//
/////**
//// *  判断sessionId是否过期
//// */
//- (BOOL) isSessionTimeout {
//    if (nil == self.config.sessionId) return YES;
//    else return NO;
//}

@end
