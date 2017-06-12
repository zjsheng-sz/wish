//
//  UITabBar+badge.h
//  PhoneBookV1
//
//  Created by ipi on 16/3/11.
//  Copyright © 2016年 wds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (GWBadge)

/**
 显示小红点

 @param index tabBar的index
 */
- (void)showBadgeOnItemIndex:(int)index;


/**
 隐藏小红点

 @param index tabBar的index
 */

- (void)hideBadgeOnItemIndex:(int)index;

@end
