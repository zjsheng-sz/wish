//
//  NSData+FormartString.h
//  MobVDT
//
//  Created by autel on 17/4/6.
//  Copyright © 2017年 Autel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GW)

/**
 @return yyyy-MM-dd HH:mm:ss
 */
- (NSString *)formatterString;



/**
 将时间做为唯一identifier

 @return identifier
 */
- (NSString *)getdateIndex;



@end
