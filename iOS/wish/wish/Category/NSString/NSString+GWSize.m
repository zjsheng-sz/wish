//
//  NSString+IPI.m
//  ZJSDemoProjection
//
//  Created by ipi on 16/6/13.
//  Copyright © 2016年 zjs. All rights reserved.
//

#import "NSString+GWSize.h"

@implementation NSString (GWSize)

- (CGSize)getTextHeightWithMaxWidth:(CGFloat)width font:(CGFloat)fontsize
{
    
    CGFloat systemVerson = [[UIDevice currentDevice].systemVersion floatValue];
    
    CGSize size;
    
    if (systemVerson >= 7.0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontsize] forKey:NSFontAttributeName] context:nil];
        
        size = rect.size;
        
    }else{
    
        size = [self sizeWithFont:[UIFont systemFontOfSize:fontsize] constrainedToSize:CGSizeMake(width, 1000)];

    }
    
    return size;
}



- (CGSize)getTextWidthWithMaxHeight:(CGFloat)height font:(CGFloat)fontsize{

    
    CGFloat systemVerson = [[UIDevice currentDevice].systemVersion floatValue];
    
    CGSize size;
    
    if (systemVerson >= 7.0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(320, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontsize] forKey:NSFontAttributeName] context:nil];
        
        size = rect.size;
        
    }else{
        
        size = [self sizeWithFont:[UIFont systemFontOfSize:fontsize] constrainedToSize:CGSizeMake(320, height)];
        
    }
    
    return size;

}

@end
