//
//  UIImage+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "UIImage+GW.h"

@implementation UIImage (GW)

#pragma mark - image with color

+ (UIImage*)gw_imageWithColor:(UIColor*)color size:(CGSize)size {
    size.width = size.width > 0 ? size.width : 1.f;
    size.height = size.height > 0 ? size.height : 1.f;
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)gw_imageWithColorArray:(NSArray*)colorArray frameArray:(NSArray*)frameArray totalSize:(CGSize)totalSize {
    UIGraphicsBeginImageContext(totalSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (NSInteger index = 0; index < colorArray.count; index ++) {
        UIColor *color = [colorArray objectAtIndex:index];
        NSString *strFrame = [frameArray objectAtIndex:index];
        CGRect frame = CGRectFromString(strFrame);
        
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, frame);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)gw_imageWithGradientColor:(NSArray*)gradientColor size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CAGradientLayer* cagradientLayrer = [[CAGradientLayer alloc] init];
    NSMutableArray* cagradientColors = [[NSMutableArray alloc] init];
    for (UIColor* color in gradientColor) {
        [cagradientColors addObject:(id)(color.CGColor)];
    }
    cagradientLayrer.colors = cagradientColors;
    cagradientLayrer.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
    [cagradientLayrer drawInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - image resize

- (UIImage *)gw_reScaleToScale:(float)scale
{
    return [self gw_reSizeToSize:CGSizeMake(self.size.width * scale, self.size.height * scale)];
}

- (UIImage *)gw_reSizeToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

- (UIImage *)gw_reSizeToMaxSize:(CGSize)maxSize
{
    CGSize imageSize = self.size;
    CGFloat widthScale = maxSize.width / imageSize.width;
    CGFloat heightScale = maxSize.height / imageSize.height;
    if (widthScale >= 1) {
        if (heightScale >= 1) {
            return self;
        } else {
            return [self gw_reScaleToScale:heightScale];
        }
    } else {
        if (heightScale >= 1) {
            return [self gw_reScaleToScale:widthScale];
        } else {
            return [self gw_reScaleToScale: heightScale < widthScale ? heightScale : widthScale];
        }
    }
}


- (UIImage *)gw_reSizeToMinSize:(CGSize)minSize
{
    CGSize imageSize = self.size;
    CGFloat widthScale = minSize.width / imageSize.width;
    CGFloat heightScale = minSize.height / imageSize.height;
    if (widthScale <= 1) {
        if (heightScale <= 1) {
            return self;
        } else {
            return [self gw_reScaleToScale:heightScale];
        }
    } else {
        if (heightScale <= 1) {
            return [self gw_reScaleToScale:widthScale];
        } else {
            return [self gw_reScaleToScale: heightScale > widthScale ? heightScale : widthScale];
        }
    }
}

- (UIImage *)gw_reSizeToWidth:(CGFloat)width
{
    CGFloat height = self.size.height / self.size.width * width;
    return [self gw_reSizeToSize:CGSizeMake(width, height)];
}

- (UIImage *)gw_reSizeToMaxWidth:(CGFloat)maxWidth
{
    CGFloat scale = maxWidth / self.size.width;
    if (scale < 1) {
        return [self gw_reScaleToScale:scale];
    } else {
        return self;
    }
}

- (UIImage *)gw_reSizeToMaxHeight:(CGFloat)maxHeight
{
    CGFloat scale = maxHeight / self.size.height;
    if (scale < 1) {
        return [self gw_reScaleToScale:scale];
    } else {
        return self;
    }
}

#pragma mark - image length

- (NSData *)gw_dataWithMaxLength:(NSUInteger)maxLength
{
    NSData *data = UIImageJPEGRepresentation(self,1);
    NSUInteger length = data.length;
    
    if (length > maxLength) {   // 压缩图片大小
        CGFloat rate = (CGFloat)maxLength / (CGFloat)length * 0.7;
        while (length > maxLength && rate > 0) {
            data = UIImageJPEGRepresentation(self,rate);
            length = data.length;
            rate -= 0.2;
            NSLog(@"length---:%ld",(long)length);
        }
    }
    
    if (length > maxLength) { // 压缩图片size
        UIImage *image = [UIImage imageWithData:data];
        CGFloat scale = (CGFloat)maxLength / (CGFloat)length * 0.7;
        while (length > maxLength && scale) {
            image = [image gw_reScaleToScale:scale];
            data = UIImageJPEGRepresentation(image,0.7);
            length = data.length;
            scale = (CGFloat)maxLength / (CGFloat)length * 0.7;
            NSLog(@"length+++:%ld",(long)length);
        }
    }
    return data;
}

- (UIImage*)gw_imageWithMaxLength:(NSUInteger)maxLength
{
    NSData *data = UIImageJPEGRepresentation(self,1);
    NSUInteger length = data.length;
    
    if (length > maxLength) {   // 压缩图片大小
        CGFloat rate = (CGFloat)maxLength / (CGFloat)length * 0.7;
        while (length > maxLength && rate > 0) {
            data = UIImageJPEGRepresentation(self,rate);
            length = data.length;
            rate -= 0.2;
            NSLog(@"length:%ld",(long)length);
        }
    } else {
        return self;
    }
    
    if (length > maxLength) { // 压缩图片size
        UIImage *image = [UIImage imageWithData:data];
        CGFloat scale = (CGFloat)maxLength / (CGFloat)length * 0.7;
        while (length > maxLength && scale < 1) {
            image = [image gw_reScaleToScale:scale];
            data = UIImageJPEGRepresentation(image,1);
            length = data.length;
            scale = (CGFloat)maxLength / (CGFloat)length * 0.7;
            NSLog(@"length:%ld",(long)length);
        }
        return image;
    } else {
        NSLog(@"length:%ld",(long)data.length);
        return [UIImage imageWithData:data];
    }
}

@end
