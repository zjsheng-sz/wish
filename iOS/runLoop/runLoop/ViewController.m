//
//  ViewController.m
//  runLoop
//
//  Created by autel on 17/7/29.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    [NSThread detachNewThreadSelector:@selector(runloop) toTarget:self withObject:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)runloop{

    
    //获得Run Loop对象
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    //配置Run Loop
    
    //启动Run Loop
    
    [runloop run];
    //退出Run Loop    

    
}


@end
