//
//  UIImage+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GW)

#pragma mark - image with color

+ (UIImage*)gw_imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage*)gw_imageWithColorArray:(NSArray*)colorArray frameArray:(NSArray*)frameArray totalSize:(CGSize)totalSize;
+ (UIImage*)gw_imageWithGradientColor:(NSArray*)gradientColor size:(CGSize)size;

#pragma mark - image resize

/**
 *  等比缩放
 *
 *  @param scale 缩放比例
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reScaleToScale:(float)scale;

/**
 *  指定size缩放
 *
 *  @param size 指定size
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToSize:(CGSize)size;

/**
 *  指定最大size缩放
 *
 *  @param maxSize 缩放后图片的最大size
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToMaxSize:(CGSize)maxSize;

/**
 *  指定最小size缩放
 *
 *  @param minSize 缩放后图片的最小size
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToMinSize:(CGSize)minSize;

/**
 *  指定宽度缩放
 *
 *  @param width 指定宽度
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToWidth:(CGFloat)width;

/**
 *  指定最大宽度缩放
 *
 *  @param maxWidth 最大宽度
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToMaxWidth:(CGFloat)maxWidth;

/**
 *  指定最大高度缩放
 *
 *  @param maxHeight 最大高度
 *
 *  @return 处理后的图片
 */
- (UIImage *)gw_reSizeToMaxHeight:(CGFloat)maxHeight;

#pragma mark - image length

/**
 *  获取最大大小的data
 *
 *  @param maxLength 最大大小，单位:byte
 *
 *  @return data
 */
- (NSData*)gw_dataWithMaxLength:(NSUInteger)maxLength;

/**
 *  获取最大大小的uiimage
 *
 *  @param maxLength 最大大小，单位:byte
 *
 *  @return UIImage
 */
- (UIImage*)gw_imageWithMaxLength:(NSUInteger)maxLength;

@end
