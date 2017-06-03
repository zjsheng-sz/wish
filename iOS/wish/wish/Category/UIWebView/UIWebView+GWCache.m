//
//  UIWebView+Cache.m
//  PhoneBookV1
//
//  Created by ipi on 2017/1/11.
//  Copyright © 2017年 wds. All rights reserved.
//

#import "UIWebView+GWCache.h"

@implementation UIWebView (GWCache)

+(void)clearCookieAndCache{
    
    NSLog(@"清除Cookie and Cache");
    
    //清除cookies
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    
    //清除UIWebView的缓存
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLCache * cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];

}

@end
