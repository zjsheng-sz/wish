//
//  UIView+Expand.h
//  MMStore
//
//  Created by qianfeng on 15/8/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GWExpand)

- (void)setX:(CGFloat)x;
- (CGFloat)x;

- (void)setY:(CGFloat)y;
- (CGFloat)y;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setHeight:(CGFloat)height;
- (CGFloat)height;

- (void)setCenterX:(CGFloat)centerX;
- (CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;
- (CGFloat)centerY;

- (void)setOrigin:(CGPoint)origin;
- (CGPoint)origin;

- (void)setSize:(CGSize)size;
- (CGSize)size;
@end
