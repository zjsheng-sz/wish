//
//  UIButton+AUTButton.h
//  MobVDT
//
//  Created by Autel_Ling on 2016/12/13.
//  Copyright © 2016年 Autel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AUTButton)

/**
 设置图上文下的按钮

 @param spacing 图文间隔
 */
- (void)verticalImageAndTitle:(CGFloat)spacing;


/**
 设置无边框按钮属性

 @param button 要处理的按钮
 */
+ (void)setButtonBorderNoneAttributesWithButton:(UIButton *)button;



/**
 设置有边框按钮属性

 @param button 要处理的按钮
 */
+ (void)setButtonBorderLineAttributesWithButton:(UIButton *)button;

@end
