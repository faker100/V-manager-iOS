//
//  Message.m
//
//  Created by 代码生成器1.0
//

#import "Message.h"

@interface Message ()

@end

@implementation Message

-(id)init {
    self = [super init];
    if ( self ) {
		self.context = [NSMutableDictionary new];
    }
    return self;
}

-(void)fromString:(NSString*)message {
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                          		 options:NSJSONReadingMutableContainers
                                      			   error:nil];
	if ([jsonObj isKindOfClass:[NSMutableDictionary class]]) {
		self.context = (NSMutableDictionary*)jsonObj;
	} else {
		NSAssert1(NO, @"不正确的Json:%@", message);
	}
}

-(NSString*)toString {
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.context
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *jsonTest=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}


@end
