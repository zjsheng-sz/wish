//
//  UIColor+HexColor.h
//  WeHalal
//
//  Created by ChenGe on 14-8-6.
//  Copyright (c) 2014年 Panda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GWHexColor)

+ (UIColor *)colorFromHexString:(NSString *)hexString;


/**
 @param hexStr @"e0e0e0" / @"#e0e0e0"
 @return a color from hexStr
 */
+ (UIColor *)colorWithHexString:(NSString *)hexStr;

@end
