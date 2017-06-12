//
//  NSString+IPI.h
//  ZJSDemoProjection
//
//  Created by ipi on 16/6/13.
//  Copyright © 2016年 zjs. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (GWSize)


/**
 get Height
 */
- (CGSize)getTextHeightWithMaxWidth:(CGFloat)width font:(CGFloat)fontsize;


/**
 get width
 */
- (CGSize)getTextWidthWithMaxHeight:(CGFloat)height font:(CGFloat)fontsize;

@end
