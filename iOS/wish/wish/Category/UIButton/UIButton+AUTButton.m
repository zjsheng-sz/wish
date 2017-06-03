//
//  UIButton+AUTButton.m
//  MobVDT
//
//  Created by Autel_Ling on 2016/12/13.
//  Copyright © 2016年 Autel. All rights reserved.
//

#import "UIButton+AUTButton.h"
#import "UIImage+GW.h"

#define AUTTextColor5                    [UIColor redColor]
#define GlobalColor                      [UIColor redColor]
#define AUTBackGroundColorDisabled       [UIColor redColor]
#define KNormalCornerRadius       6.0



@implementation UIButton (AUTButton)


- (void)verticalImageAndTitle:(CGFloat)spacing {
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height), 0.0, 0.0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(totalHeight - titleSize.height), 0);
    
}


+ (void)setButtonBorderNoneAttributesWithButton:(UIButton *)button {
    
    [button setTitleColor:AUTTextColor5 forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage gw_imageWithColor:GlobalColor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage gw_imageWithColor:AUTBackGroundColorDisabled size:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = KNormalCornerRadius;
    
}


+ (void)setButtonBorderLineAttributesWithButton:(UIButton *)button {
    [button setTitleColor:GlobalColor forState:UIControlStateNormal];
    [button setTitleColor:AUTTextColor5 forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage gw_imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage gw_imageWithColor:GlobalColor size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    button.layer.cornerRadius = 3;
    button.layer.borderWidth = 1;
    button.layer.borderColor = GlobalColor.CGColor;
    button.clipsToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:17];
}

@end
