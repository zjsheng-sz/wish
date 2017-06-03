//
//  GWWish.h
//  Runtime
//
//  Created by autel on 17/6/3.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWBaseModel.h"

@interface GWWish : GWBaseModel

@property (nonatomic, copy) NSString *wishId;
@property (nonatomic, copy) NSString *wishTime;
@property (nonatomic, copy) NSString *wishPlace;
@property (nonatomic, copy) NSString *wishDescription;



@end
