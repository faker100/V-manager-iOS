//
//  MessageResponse.m
//
//  Created by 代码生成器1.0
//

#import <objc/runtime.h>
#import "MessageResponse.h"



@interface MessageResponse ()

@property (nonatomic, copy, readwrite) NSString *responseString;

//@property (nonatomic, copy, readwrite) NSString *errorMessage; //错误信息（失败的情况）

@end

@implementation MessageResponse

+ (id)responseWithReponseData:(NSData*)responseData {
    MessageResponse *response = [[self class]alloc];
    response = [response initWithReponseData:responseData];
    return response;
}

- (id)initWithReponseData:(NSData*)responseData {
    if ((self = [super init])) {
        self.responseString = [[NSString alloc]initWithData:responseData
                                                   encoding:NSUTF8StringEncoding];
        NSLog(@"响应报文:\n%@", self.responseString);
        [self fromString: self.responseString];
    }
    return self;
}

-(void)setCode:(int)value {
    self.contextContent[C_CODE] = [NSNumber numberWithInt: value];
}
-(int)code{
    NSNumber *value = self.contextContent[C_CODE];
    return [value intValue];
}

-(void)setMessage:(NSString*)value {
    self.contextContent[C_MESSAGE] = value;
}



-(NSString*)message {
    return self.contextContent[C_MESSAGE];
}



@end
