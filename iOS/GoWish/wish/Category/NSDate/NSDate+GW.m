//
//  NSData+FormartString.m
//  MobVDT
//
//  Created by autel on 17/4/6.
//  Copyright © 2017年 Autel. All rights reserved.
//

#import "NSDate+GW.h"

@implementation NSDate (GW)

- (NSString *)formatterString{

    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *finishTimeString = [formatter stringFromDate:self];
    
    return finishTimeString;
}


- (NSString *)getdateIndex{

    NSTimeInterval currentTime = [self timeIntervalSince1970];
    
    NSString *currentTimeStr = [NSString stringWithFormat:@"%f",currentTime];

    return currentTimeStr;
}



@end
