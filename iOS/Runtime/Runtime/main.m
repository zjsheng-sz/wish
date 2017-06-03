//
//  main.m
//  Runtime
//
//  Created by autel on 17/6/3.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWWish.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        GWWish *myWish = [[GWWish alloc] init];
        
        [myWish association];
        
//        NSLog(@"allMethods:%@",[myWish getAllMethodsForSwizzling]);

    }
    return 0;
}
